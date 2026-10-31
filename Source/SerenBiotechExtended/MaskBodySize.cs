using System.Collections.Generic;
using RimWorld;
using UnityEngine;
using Verse;

namespace SerenBiotechExtended
{
    // Where a body is drawn inside its square texture, read from the alpha of the body picture (Naked_<type>_south), so it
    // follows any body: vanilla, child, baby, or a mod that swaps or adds body pictures (Realistic Bodies draws a
    // female Thin, Fat and Hulk body of its own). Fractions of the square, 0 to 1, bottom up.
    // The pictures are read once at startup, on the main thread: the render tree calls the node workers from
    // parallel jobs, where Unity textures cannot be touched (a first version read them there and crashed the game).
    public struct BodyBounds
    {
        public float Left, Right, Bottom, Top;

        private const byte MinAlpha = 40;
        private const string BodiesFolder = "Things/Pawn/Humanlike/Bodies";
        // Texture path (with the _south suffix) to bounds.
        private static readonly Dictionary<string, BodyBounds> ByPath = new Dictionary<string, BodyBounds>();

        internal static void Load()
        {
            foreach (Texture2D texture in ContentFinder<Texture2D>.GetAllInFolder(BodiesFolder))
                if (texture.name.EndsWith("_south"))
                    Add(BodiesFolder + "/" + texture.name, texture);
            foreach (BodyTypeDef body in DefDatabase<BodyTypeDef>.AllDefs)
            {
                string path = body.bodyNakedGraphicPath;
                if (path == null || ByPath.ContainsKey(path + "_south"))
                    continue;
                Texture2D texture = ContentFinder<Texture2D>.Get(path + "_south", false);
                if (texture != null)
                    Add(path + "_south", texture);
            }
        }

        public static BodyBounds? ForPath(string path) => ByPath.TryGetValue(path + "_south", out BodyBounds bounds) ? bounds : (BodyBounds?)null;

        // The bounds of the body picture the pawn body node draws (its graphic path), the body type path otherwise.
        // Only reads dictionaries, so it is safe in the parallel render jobs.
        public static BodyBounds? For(Pawn pawn)
        {
            string path = null;
            if (pawn.Drawer?.renderer?.renderTree != null
                && pawn.Drawer.renderer.renderTree.TryGetNodeByTag(PawnRenderNodeTagDefOf.Body, out PawnRenderNode node))
                path = (node.PrimaryGraphic as Graphic_Multi)?.path;
            if (path == null)
                path = pawn.story?.bodyType?.bodyNakedGraphicPath;
            if (path != null && ByPath.TryGetValue(path + "_south", out BodyBounds bounds))
                return bounds;
            return null;
        }

        private static void Add(string path, Texture2D texture)
        {
            BodyBounds? bounds = Read(texture);
            if (bounds != null)
                ByPath[path] = bounds.Value;
        }

        private static BodyBounds? Read(Texture2D texture)
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
                Color32[] pixels = copy.GetPixels32();
                int minX = width, maxX = -1, minY = height, maxY = -1;
                for (int y = 0; y < height; y++)
                    for (int x = 0; x < width; x++)
                        if (pixels[y * width + x].a >= MinAlpha)
                        {
                            if (x < minX) minX = x;
                            if (x > maxX) maxX = x;
                            if (y < minY) minY = y;
                            if (y > maxY) maxY = y;
                        }
                if (maxX < 0)
                    return null;
                return new BodyBounds
                {
                    Left = minX / (float)width,
                    Right = (maxX + 1) / (float)width,
                    Bottom = minY / (float)height,
                    Top = (maxY + 1) / (float)height
                };
            }
            catch (System.Exception e)
            {
                Log.Warning("[SerenBiotechExtended] could not read a body picture: " + e.Message);
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
    // Worker of the body mask nodes. The masks are drawn on a square canvas for an adult body. On a child or a baby
    // body the same canvas leaves the mask too large and misplaced, so the node is mapped from the adult body onto the
    // pawn body: a point at some place of the adult body lands at the same relative place of the child body (scale
    // from the ratio of the two body pictures, read from their alpha, no crop and no stretch of the mask itself).
    public class PawnRenderNodeWorker_MaskBody : PawnRenderNodeWorker_AttachmentBody
    {
        // The picture the masks were drawn for.
        private const string ReferenceBodyPath = "Things/Pawn/Humanlike/Bodies/Naked_Thin";

        // Scale and offset of the node, or false when the node keeps its adult drawing.
        private static bool TryMap(Pawn pawn, out float scaleX, out float scaleZ, out float offsetX, out float offsetZ)
        {
            scaleX = scaleZ = 1f;
            offsetX = offsetZ = 0f;
            if (!PawnRenderNode_AccentBody.IsChildBody(pawn))
                return false;
            BodyBounds? body = BodyBounds.For(pawn);
            BodyBounds? reference = BodyBounds.ForPath(ReferenceBodyPath);
            if (body == null || reference == null)
                return false;
            BodyBounds b = body.Value, r = reference.Value;
            scaleX = (b.Right - b.Left) / (r.Right - r.Left);
            scaleZ = (b.Top - b.Bottom) / (r.Top - r.Bottom);
            float bodyX = (b.Left + b.Right) / 2f, bodyZ = (b.Bottom + b.Top) / 2f;
            float refX = (r.Left + r.Right) / 2f, refZ = (r.Bottom + r.Top) / 2f;
            offsetX = (bodyX - 0.5f) - (refX - 0.5f) * scaleX;
            offsetZ = (bodyZ - 0.5f) - (refZ - 0.5f) * scaleZ;
            return true;
        }

        public override Vector3 ScaleFor(PawnRenderNode node, PawnDrawParms parms)
        {
            Vector3 scale = base.ScaleFor(node, parms);
            if (!TryMap(parms.pawn, out float sx, out float sz, out _, out _))
                return scale;
            return new Vector3(scale.x * sx, scale.y, scale.z * sz);
        }

        public override Vector3 OffsetFor(PawnRenderNode node, PawnDrawParms parms, out Vector3 pivot)
        {
            Vector3 offset = base.OffsetFor(node, parms, out pivot);
            if (TryMap(parms.pawn, out _, out _, out float x, out float z))
            {
                offset.x += x;
                offset.z += z;
            }
            return offset;
        }
    }
}

namespace SerenBiotechExtended
{
    // Reads the body pictures once, at startup on the main thread (see BodyBounds).
    [StaticConstructorOnStartup]
    internal static class BodyBoundsLoader
    {
        static BodyBoundsLoader() => BodyBounds.Load();
    }
}
