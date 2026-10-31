using System.Collections.Generic;
using HarmonyLib;
using RimWorld;
using UnityEngine;
using Verse;

namespace SerenBiotechExtended
{
    // Mask 6 is a fluffy pants-like shape drawn for an adult canvas: on every body it hangs below the feet. It is baked
    // for each body picture (same method as Venus Touch Waistlines, TopFit.ClipToBody): the art is stretched over the part
    // of the body from the feet up to the navel and every pixel outside the body alpha is erased. The textures are
    // baked once at startup, on the main thread; the render jobs only read the cache.
    internal static class MaskBake
    {
        internal const string MaskPath = "Things/SerenBiotechExtended/Mask6";
        private const string BodiesFolder = "Things/Pawn/Humanlike/Bodies";
        private const byte BodyAlpha = 40;
        private const byte ArtAlpha = 8;
        // The navel, as a share of the body height counted from the feet.
        private const float NavelFromFeet = 0.5f;
        private static readonly string[] Facings = { "north", "east", "south" };

        // Body graphic path (without the facing) to its three baked pictures: north, east, south.
        private static readonly Dictionary<string, Texture2D[]> Baked = new Dictionary<string, Texture2D[]>();
        private static readonly Dictionary<string, Graphic> Graphics = new Dictionary<string, Graphic>();

        internal sealed class DirectGraphic : Graphic_Multi
        {
            // The node may ask a recoloured version; a baked picture has no path to rebuild it from.
            public override Graphic GetColoredVersion(Shader newShader, Color newColor, Color newColorTwo) => this;
        }

        internal static void Load()
        {
            Pixels[] art = new Pixels[3];
            for (int i = 0; i < 3; i++)
            {
                Texture2D texture = ContentFinder<Texture2D>.Get(MaskPath + "_" + Facings[i], false);
                if (texture == null)
                    return;
                art[i] = Pixels.Read(texture);
            }
            foreach (Texture2D south in ContentFinder<Texture2D>.GetAllInFolder(BodiesFolder))
            {
                if (!south.name.EndsWith("_south"))
                    continue;
                string basePath = BodiesFolder + "/" + south.name.Substring(0, south.name.Length - "_south".Length);
                Texture2D[] baked = new Texture2D[3];
                bool ok = true;
                for (int i = 0; i < 3 && ok; i++)
                {
                    Texture2D body = Facings[i] == "south" ? south : ContentFinder<Texture2D>.Get(basePath + "_" + Facings[i], false) ?? south;
                    baked[i] = Bake(art[i], Pixels.Read(body), basePath + "_" + Facings[i]);
                    ok = baked[i] != null;
                }
                if (ok)
                    Baked[basePath] = baked;
            }
        }

        // The graphic of mask 6 baked for a body picture, built from the graphic the game made for the node (same fields)
        // and tinted with the node colour; null when this body has no baked picture.
        internal static Graphic GraphicFor(string bodyPath, Graphic source, Shader shader, Color color)
        {
            if (bodyPath == null || !Baked.TryGetValue(bodyPath, out Texture2D[] textures) || !(source is Graphic_Multi))
                return null;
            Color32 c = color;
            string key = bodyPath + "|" + c.r + "," + c.g + "," + c.b;
            if (!Graphics.TryGetValue(key, out Graphic graphic))
            {
                var mats = new Material[4];
                for (int i = 0; i < 3; i++)
                {
                    MaterialRequest request = default(MaterialRequest);
                    request.mainTex = textures[i];
                    request.shader = shader;
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

        // The art stretched over the body from the feet to the navel, clipped to the body alpha.
        private static Texture2D Bake(Pixels art, Pixels body, string name)
        {
            if (art == null || body == null)
                return null;
            int aMinX = art.Width, aMaxX = -1, aMinY = art.Height, aMaxY = -1;
            for (int y = 0; y < art.Height; y++)
                for (int x = 0; x < art.Width; x++)
                    if (art.Data[y * art.Width + x].a > ArtAlpha)
                    {
                        if (x < aMinX) aMinX = x;
                        if (x > aMaxX) aMaxX = x;
                        if (y < aMinY) aMinY = y;
                        if (y > aMaxY) aMaxY = y;
                    }
            int bMinX = body.Width, bMaxX = -1, bMinY = body.Height, bMaxY = -1;
            for (int y = 0; y < body.Height; y++)
                for (int x = 0; x < body.Width; x++)
                    if (body.Data[y * body.Width + x].a >= BodyAlpha)
                    {
                        if (x < bMinX) bMinX = x;
                        if (x > bMaxX) bMaxX = x;
                        if (y < bMinY) bMinY = y;
                        if (y > bMaxY) bMaxY = y;
                    }
            if (aMaxX < 0 || bMaxX < 0)
                return null;
            Log.Message("[SerenBiotechExtended] mask 6 bake " + name + ": body " + body.Width + "x" + body.Height + " x " + bMinX + ".." + bMaxX + " y " + bMinY + ".." + bMaxY + ", art x " + aMinX + ".." + aMaxX + " y " + aMinY + ".." + aMaxY);
            int rectBottom = bMinY;
            int rectTop = bMinY + (int)((bMaxY - bMinY + 1) * NavelFromFeet);
            int rectLeft = bMinX, rectWidth = bMaxX - bMinX + 1, rectHeight = System.Math.Max(1, rectTop - rectBottom);
            int artWidth = aMaxX - aMinX + 1, artHeight = aMaxY - aMinY + 1;
            var output = new Color32[body.Width * body.Height];
            for (int y = rectBottom; y < rectTop && y < body.Height; y++)
            {
                int ay = aMinY + System.Math.Min(artHeight - 1, (y - rectBottom) * artHeight / rectHeight);
                for (int x = rectLeft; x <= bMaxX; x++)
                {
                    if (body.Data[y * body.Width + x].a < BodyAlpha)
                        continue;
                    int ax = aMinX + System.Math.Min(artWidth - 1, (x - rectLeft) * artWidth / rectWidth);
                    output[y * body.Width + x] = art.Data[ay * art.Width + ax];
                }
            }
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
