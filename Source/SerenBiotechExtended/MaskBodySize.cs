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

        public override string ToString() => "L" + Left.ToString("0.###") + " R" + Right.ToString("0.###") + " B" + Bottom.ToString("0.###") + " T" + Top.ToString("0.###");

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
            string path = BodyPathFor(pawn);
            if (path != null && ByPath.TryGetValue(path + "_south", out BodyBounds bounds))
                return bounds;
            return null;
        }

        // The graphic path of the body picture the pawn body node draws, the body type path when the node is not built yet.
        public static string BodyPathFor(Pawn pawn)
        {
            string path = null;
            if (pawn.Drawer?.renderer?.renderTree != null
                && pawn.Drawer.renderer.renderTree.TryGetNodeByTag(PawnRenderNodeTagDefOf.Body, out PawnRenderNode node))
                path = (node.PrimaryGraphic as Graphic_Multi)?.path;
            return path ?? pawn.story?.bodyType?.bodyNakedGraphicPath;
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
        internal const string ReferenceBodyPath = "Things/Pawn/Humanlike/Bodies/Naked_Thin";

        // Share of the skin height, from the top, that the head of a child or a baby covers: a first estimate, to read on the shots.
        private const float HeadCover = 0.35f;

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
            Map(body.Value, reference.Value, out scaleX, out scaleZ, out offsetX, out offsetZ);
            return true;
        }

        // The mapping from the adult reference body onto a child or baby body, also used by the bake to clip the masks to the skin.
        internal static void Map(BodyBounds b, BodyBounds r, out float scaleX, out float scaleZ, out float offsetX, out float offsetZ)
        {
            scaleX = (b.Right - b.Left) / (r.Right - r.Left);
            scaleZ = (b.Top - b.Bottom) / (r.Top - r.Bottom);
            float bodyX = (b.Left + b.Right) / 2f;
            float refX = (r.Left + r.Right) / 2f;
            offsetX = (bodyX - 0.5f) - (refX - 0.5f) * scaleX;
            // The big head of a child or a baby covers the top of the skin box, where the adult art keeps the crescent, the sun
            // and the top of the constellations (masks 0 and 1 never showed). Squeeze the art vertically into the part below the
            // head, feet kept at the feet of the body.
            scaleZ *= 1f - HeadCover;
            offsetZ = (b.Bottom - 0.5f) - (r.Bottom - 0.5f) * scaleZ;
        }

        // Diagnosis: scale, offset and pivot the body node and this node get from their own workers on a child or a baby.
        private void LogBody(PawnRenderNode node, PawnDrawParms parms, Vector3 scale)
        {
            if (!PawnRenderNode_AccentBody.IsChildBody(parms.pawn) || !FirstMap("body|" + parms.pawn.story.bodyType.defName + "|" + node.Props.texPath))
                return;
            Vector3 maskOffset = base.OffsetFor(node, parms, out Vector3 maskPivot);
            string body = "no body node";
            if (parms.pawn.Drawer.renderer.renderTree.TryGetNodeByTag(PawnRenderNodeTagDefOf.Body, out PawnRenderNode bodyNode))
            {
                Vector3 bodyOffset = bodyNode.Worker.OffsetFor(bodyNode, parms, out Vector3 bodyPivot);
                body = "scale " + bodyNode.Worker.ScaleFor(bodyNode, parms) + ", offset " + bodyOffset + ", pivot " + bodyPivot;
            }
            Log.Message("[SerenBiotechExtended] mask node " + node.Props.texPath + " on " + parms.pawn.story.bodyType.defName + ": scale " + scale
                + ", offset " + maskOffset + ", pivot " + maskPivot + "; body node: " + body);
        }

        // World units. 0.078 put mask 6 above the feet once the mapped masks were fixed: halved, to read on the shots.
        private const float ChildLift = 0.04f;

        private static readonly HashSet<string> MapLogged = new HashSet<string>();

        // The render jobs run in parallel: one lock for the set.
        private static bool FirstMap(string key)
        {
            lock (MapLogged)
                return MapLogged.Add(key);
        }

        public override Vector3 ScaleFor(PawnRenderNode node, PawnDrawParms parms)
        {
            Vector3 scale = base.ScaleFor(node, parms);
            // The attachment worker multiplies by the average of bodyType.bodyGraphicScale (0.8 on Thin: (0.6 + 1) / 2, 0.5 on
            // Baby) but the body node itself is drawn at scale 1 (measured in game, ticket 9653): every mask was 80 percent of
            // an adult body and the child mapping below started from half the body. The masks are baked and clipped on the
            // body picture, or mapped from the ratio of the pictures: start from the body scale.
            Vector2 graphicScale = parms.pawn.story.bodyType.bodyGraphicScale;
            float average = (graphicScale.x + graphicScale.y) / 2f;
            if (average > 0f)
                scale /= average;
            if (PawnRenderNode_AccentBody.IsBaked(node) || !TryMap(parms.pawn, out float sx, out float sz, out float ox, out float oz))
            {
                LogBody(node, parms, scale);
                return scale;
            }
            if (FirstMap(parms.pawn.story.bodyType.defName + "|" + node.Props.texPath))
                Log.Message("[SerenBiotechExtended] child mask map " + node.Props.texPath + " on " + parms.pawn.story.bodyType.defName
                    + ": base scale " + scale + ", picture ratio " + sx.ToString("0.###") + " x " + sz.ToString("0.###")
                    + ", offset " + ox.ToString("0.###") + " " + oz.ToString("0.###")
                    + ", body bounds " + (BodyBounds.For(parms.pawn)?.ToString() ?? "none"));
            return new Vector3(scale.x * sx, scale.y, scale.z * sz);
        }

        public override Vector3 OffsetFor(PawnRenderNode node, PawnDrawParms parms, out Vector3 pivot)
        {
            Vector3 offset = base.OffsetFor(node, parms, out pivot);
            // Measured on the child pictures (ticket d410, mask 6 baked on the body picture itself, same scale and offset as the
            // body node in the logs): every mask is drawn about 8 screen pixels, 0.05 of the picture, below the body. Cause not
            // found, the Child body type only (the baby is aligned).
            // The mapped masks are placed from the body bounds, they need no lift (it hid masks 0 and 1 under the head).
            if (parms.pawn.story.bodyType == BodyTypeDefOf.Child && PawnRenderNode_AccentBody.IsBaked(node))
                offset.z += ChildLift;
            if (!PawnRenderNode_AccentBody.IsBaked(node) && TryMap(parms.pawn, out _, out _, out float x, out float z))
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
        static BodyBoundsLoader()
        {
            BodyBounds.Load();
            MaskBake.Load();
        }
    }
}
