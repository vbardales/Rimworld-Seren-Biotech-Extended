using System.Collections.Generic;
using HarmonyLib;
using RimWorld;
using UnityEngine;
using Verse;

namespace SerenBiotechExtended
{
    // The body masks are drawn on a square canvas for the body of the original Seren. Two bakes, once at startup on the main
    // thread (the render jobs only read the cache), same method as Venus Touch Waistlines (TopFit.ClipToBody):
    //  - mask 6, a fluffy pants shape that hangs below the feet on every body: stretched over the body from the feet to the
    //    waist, each row fitted to the skin, clipped to the skin;
    //  - the other masks, on adult bodies: the art clipped to the skin, so nothing is drawn past the silhouette of a body
    //    narrower than the original (Realistic Bodies Thin Female). Child and baby bodies keep the mapping of the node worker.
    internal static class MaskBake
    {
        internal const string MaskPath = "Things/SerenBiotechExtended/Mask6";
        internal const string MaskFolder = "Things/SerenBiotechExtended/Mask";
        private const string BodiesFolder = "Things/Pawn/Humanlike/Bodies";
        private const int MaskCount = 12;
        private const int VanillaPictureSize = 128;
        private static readonly string[] Facings = { "north", "east", "south" };

        // "mask path|body graphic path" (without the facing) to its three baked pictures: north, east, south.
        private static readonly Dictionary<string, Texture2D[]> Baked = new Dictionary<string, Texture2D[]>();
        private static readonly Dictionary<string, Graphic> Graphics = new Dictionary<string, Graphic>();

        internal sealed class DirectGraphic : Graphic_Multi
        {
            // The node may ask a recoloured version; a baked picture has no path to rebuild it from.
            public override Graphic GetColoredVersion(Shader newShader, Color newColor, Color newColorTwo) => this;
        }

        internal static bool IsMask(string texPath) => texPath != null && texPath.StartsWith(MaskFolder);

        internal static void Load()
        {
            var bodies = new List<KeyValuePair<string, Texture2D>>();
            foreach (Texture2D south in ContentFinder<Texture2D>.GetAllInFolder(BodiesFolder))
                if (south.name.EndsWith("_south"))
                    bodies.Add(new KeyValuePair<string, Texture2D>(BodiesFolder + "/" + south.name.Substring(0, south.name.Length - "_south".Length), south));
            LoadPants(bodies);
            LoadClips(bodies);
        }

        private static Pixels[] ReadArt(string maskPath)
        {
            var art = new Pixels[3];
            for (int i = 0; i < 3; i++)
            {
                Texture2D texture = ContentFinder<Texture2D>.Get(maskPath + "_" + Facings[i], false);
                if (texture == null)
                    return null;
                art[i] = Pixels.Read(texture);
                if (art[i] == null)
                    return null;
            }
            return art;
        }

        private static Pixels ReadBody(string basePath, int facing, Texture2D south) =>
            Pixels.Read(Facings[facing] == "south" ? south : ContentFinder<Texture2D>.Get(basePath + "_" + Facings[facing], false) ?? south);

        private static void LoadPants(List<KeyValuePair<string, Texture2D>> bodies)
        {
            Pixels[] art = ReadArt(MaskPath);
            if (art == null)
                return;
            foreach (KeyValuePair<string, Texture2D> body in bodies)
            {
                Texture2D[] baked = new Texture2D[3];
                bool ok = true;
                for (int i = 0; i < 3 && ok; i++)
                {
                    baked[i] = Bake(art[i], ReadBody(body.Key, i, body.Value), body.Key + "_" + Facings[i]);
                    ok = baked[i] != null;
                }
                if (ok)
                    Baked[MaskPath + "|" + body.Key] = baked;
            }
        }

        // Adult bodies only (the child and baby bodies are mapped by the node worker, not clipped).
        private static bool IsAdultNaked(string basePath)
        {
            string name = basePath.Substring(basePath.LastIndexOf('/') + 1);
            return name.StartsWith("Naked_") && !name.Contains("Child") && !name.Contains("Baby");
        }

        private static void LoadClips(List<KeyValuePair<string, Texture2D>> bodies)
        {
            for (int mask = 0; mask < MaskCount; mask++)
            {
                string maskPath = MaskFolder + mask;
                if (maskPath == MaskPath)
                    continue;
                Pixels[] art = ReadArt(maskPath);
                if (art == null)
                    continue;
                foreach (KeyValuePair<string, Texture2D> body in bodies)
                {
                    if (!IsAdultNaked(body.Key))
                        continue;
                    Texture2D[] baked = new Texture2D[3];
                    bool ok = true;
                    for (int i = 0; i < 3 && ok; i++)
                    {
                        baked[i] = Clip(art[i], ReadBody(body.Key, i, body.Value), maskPath + " " + body.Key + "_" + Facings[i]);
                        ok = baked[i] != null;
                    }
                    if (ok)
                        Baked[maskPath + "|" + body.Key] = baked;
                }
            }
        }

        // The art of a mask clipped to the skin of a body picture, at the size of the picture (256 for a 512 px body).
        private static Texture2D Clip(Pixels art, Pixels body, string name)
        {
            int size = body.Width >= 2 * VanillaPictureSize ? body.Width / 2 : body.Width;
            Color32[] output = ToPixels(MaskBakeCore.BakeClip(ToImage(art), ToImage(body), size));
            if (output == null)
                return null;
            var texture = new Texture2D(size, size, TextureFormat.RGBA32, false)
            {
                name = "SBE_MaskClip_" + name,
                wrapMode = TextureWrapMode.Clamp,
                filterMode = FilterMode.Bilinear
            };
            texture.SetPixels32(output);
            texture.Apply(false, false);
            return texture;
        }

        // The graphic of a mask baked for a body picture, built from the graphic the game made for the node (same fields)
        // and tinted with the node colour; null when this body has no baked picture. Mask 6 is drawn with the Transparent
        // shader: the three tones of the pants are alpha levels (white art), and a cutout shader keeps only the pixels above
        // half alpha, which left one flat tone and dropped the two upper bands.
        internal static Graphic GraphicFor(string maskPath, string bodyPath, Graphic source, Shader shader, Color color)
        {
            if (bodyPath == null || !Baked.TryGetValue(maskPath + "|" + bodyPath, out Texture2D[] textures) || !(source is Graphic_Multi))
                return null;
            Color32 c = color;
            string key = maskPath + "|" + bodyPath + "|" + c.r + "," + c.g + "," + c.b;
            if (!Graphics.TryGetValue(key, out Graphic graphic))
            {
                var mats = new Material[4];
                for (int i = 0; i < 3; i++)
                {
                    MaterialRequest request = default(MaterialRequest);
                    request.mainTex = textures[i];
                    request.shader = maskPath == MaskPath ? ShaderDatabase.Transparent : shader;
                    request.color = color;
                    mats[i] = MaterialPool.MatFrom(request);
                }
                mats[3] = mats[1];
                var direct = new DirectGraphic();
                for (System.Type type = typeof(Graphic_Multi); type != null && type != typeof(object); type = type.BaseType)
                    foreach (System.Reflection.FieldInfo field in type.GetFields(
                        System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.Public
                        | System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.DeclaredOnly))
                        field.SetValue(direct, field.GetValue(source));
                AccessTools.Field(typeof(Graphic_Multi), "mats").SetValue(direct, mats);
                graphic = direct;
                Graphics[key] = graphic;
            }
            return graphic;
        }

        // WDI draws its bodies on 512 px pictures, vanilla on 128: the table only describes the WDI drawings.
        private const int WdiPictureSize = 512;

        // Where the pants start on the WDI Realistic Bodies, as a share of the skin height from the feet: the navel mark measured on
        // the south pictures plus about a tenth of the height, so the top of the pants sits just above the navel and never climbs
        // onto the chest (Fat and Hulk are short and wide). Other bodies have no entry.
        private static readonly Dictionary<string, float> NavelShare = new Dictionary<string, float>
        {
            { "Male", 0.35f }, { "Female", 0.47f }, { "Thin", 0.33f }, { "Thin_Female", 0.41f },
            { "Fat", 0.44f }, { "Fat_Female", 0.44f }, { "Hulk", 0.38f }, { "Hulk_Female", 0.42f },
        };

        // The art stretched over the body from the feet to the waist, clipped to the skin (MaskBakeCore).
        private static Texture2D Bake(Pixels art, Pixels body, string name)
        {
            string key = name.Substring(name.LastIndexOf('/') + 1);
            key = key.StartsWith("Naked_") ? key.Substring("Naked_".Length) : key;
            key = key.Substring(0, key.LastIndexOf('_'));
            Color32[] output = ToPixels(MaskBakeCore.Bake(ToImage(art), ToImage(body), body.Width >= WdiPictureSize && NavelShare.TryGetValue(key, out float share) ? share : -1f, out string report));
            if (output == null)
                return null;
            Log.Message("[SerenBiotechExtended] mask 6 bake " + name + ": " + report);
            var texture = new Texture2D(body.Width, body.Height, TextureFormat.RGBA32, false)
            {
                name = "SBE_Mask6_" + name,
                wrapMode = TextureWrapMode.Clamp,
                filterMode = FilterMode.Bilinear
            };
            texture.SetPixels32(output);
            texture.Apply(false, false);
            return texture;
        }

        private static RgbaImage ToImage(Pixels p)
        {
            if (p == null)
                return null;
            var data = new Rgba[p.Data.Length];
            for (int i = 0; i < data.Length; i++)
                data[i] = new Rgba { R = p.Data[i].r, G = p.Data[i].g, B = p.Data[i].b, A = p.Data[i].a };
            return new RgbaImage { Width = p.Width, Height = p.Height, Data = data };
        }

        private static Color32[] ToPixels(Rgba[] data)
        {
            if (data == null)
                return null;
            var output = new Color32[data.Length];
            for (int i = 0; i < data.Length; i++)
                output[i] = new Color32(data[i].R, data[i].G, data[i].B, data[i].A);
            return output;
        }
    }

    // The pixels of a texture, rows from the bottom, read through a render texture (loaded textures are not readable).
    // Main thread only.
    internal sealed class Pixels
    {
        public int Width, Height;
        public Color32[] Data;

        public static Pixels Read(Texture2D texture)
        {
            int width = texture.width, height = texture.height;
            RenderTexture temp = RenderTexture.GetTemporary(width, height, 0, RenderTextureFormat.ARGB32, RenderTextureReadWrite.Default);
            RenderTexture active = RenderTexture.active;
            Texture2D copy = null;
            try
            {
                Graphics.Blit(texture, temp);
                RenderTexture.active = temp;
                copy = new Texture2D(width, height, TextureFormat.RGBA32, false);
                copy.ReadPixels(new Rect(0f, 0f, width, height), 0, 0);
                copy.Apply(false, false);
                return new Pixels { Width = width, Height = height, Data = copy.GetPixels32() };
            }
            catch (System.Exception e)
            {
                Log.Warning("[SerenBiotechExtended] could not read a picture: " + e.Message);
                return null;
            }
            finally
            {
                RenderTexture.active = active;
                RenderTexture.ReleaseTemporary(temp);
                if (copy != null)
                    Object.Destroy(copy);
            }
        }
    }
}
