using System.Collections.Generic;
using RimWorld;
using UnityEngine;
using Verse;

namespace SerenBiotechExtended
{
    // Where the body of a body type is drawn inside its square texture, read from the alpha of the body's own picture
    // (Naked_<type>_south), so it follows any body type: vanilla, child, baby, or a mod that swaps the body picture
    // (Realistic Bodies). Fractions of the square, 0 to 1, bottom up.
    public struct BodyBounds
    {
        public float Left, Right, Bottom, Top;

        private const byte MinAlpha = 40;
        private static readonly Dictionary<Texture2D, BodyBounds?> Cache = new Dictionary<Texture2D, BodyBounds?>();

        // The bounds of the picture the pawn body node really draws (south view), so a gendered or swapped body
        // (Realistic Bodies draws a female Thin, Fat or Hulk body of its own) is followed; the body type path otherwise.
        public static BodyBounds? For(Pawn pawn)
        {
            Texture2D texture = null;
            if (pawn.Drawer?.renderer?.renderTree != null
                && pawn.Drawer.renderer.renderTree.TryGetNodeByTag(PawnRenderNodeTagDefOf.Body, out PawnRenderNode node)
                && node.PrimaryGraphic is Graphic_Multi multi)
                texture = multi.MatSouth?.mainTexture as Texture2D;
            if (texture == null)
            {
                string path = pawn.story?.bodyType?.bodyNakedGraphicPath;
                if (path != null)
                    texture = ContentFinder<Texture2D>.Get(path + "_south", false);
            }
            if (texture == null)
                return null;
            if (!Cache.TryGetValue(texture, out BodyBounds? bounds))
            {
                bounds = Read(texture);
                Cache[texture] = bounds;
            }
            return bounds;
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

    // Worker of the body mask nodes. The masks are drawn on an adult 512 px canvas whose sides and legs are mostly
    // transparent, so scaling that canvas down to a child or a baby body leaves almost nothing visible, and Mask 6
    // (pants-like) hangs below the feet. Where the node uses the MaskN_Fit textures (content cropped to its bounding box,
    // see PawnRenderNode_AccentBody), this worker sizes the node to a part of the body, measured from the feet:
    // Mask 6 goes from the feet to the navel, the other masks cover the torso only.
    public class PawnRenderNodeWorker_MaskBody : PawnRenderNodeWorker_AttachmentBody
    {
        // Parts of the body height, from the feet (0) to the neck (1): the navel is at about half, the crotch at about a quarter.
        private const float FeetToNavelTop = 0.48f;
        private const float TorsoBottom = 0.28f;
        // Share of the body width the masks cover (the arms are part of the body picture).
        private const float WidthShare = 0.85f;

        // The part of the body the node covers, or false when the node keeps its adult drawing.
        private static bool TryRegion(PawnRenderNode node, Pawn pawn, out float x, out float z, out float width, out float height)
        {
            x = z = width = height = 0f;
            if (!PawnRenderNode_AccentBody.UsesFit(node, pawn))
                return false;
            BodyBounds? bounds = BodyBounds.For(pawn);
            if (bounds == null)
                return false;
            BodyBounds b = bounds.Value;
            bool feetToNavel = PawnRenderNode_AccentBody.IsFeetToNavel(node);
            float low = feetToNavel ? 0f : TorsoBottom;
            float high = feetToNavel ? FeetToNavelTop : 1f;
            float bodyHeight = b.Top - b.Bottom;
            float bottom = b.Bottom + low * bodyHeight;
            float top = b.Bottom + high * bodyHeight;
            x = (b.Left + b.Right) / 2f - 0.5f;
            z = (bottom + top) / 2f - 0.5f;
            width = (b.Right - b.Left) * WidthShare;
            height = top - bottom;
            return true;
        }

        public override Vector3 ScaleFor(PawnRenderNode node, PawnDrawParms parms)
        {
            Vector3 scale = base.ScaleFor(node, parms);
            if (!TryRegion(node, parms.pawn, out _, out _, out float width, out float height))
                return scale;
            return new Vector3(scale.x * width, scale.y, scale.z * height);
        }

        public override Vector3 OffsetFor(PawnRenderNode node, PawnDrawParms parms, out Vector3 pivot)
        {
            Vector3 offset = base.OffsetFor(node, parms, out pivot);
            if (TryRegion(node, parms.pawn, out float x, out float z, out _, out _))
            {
                offset.x += x;
                offset.z += z;
            }
            return offset;
        }
    }
}
