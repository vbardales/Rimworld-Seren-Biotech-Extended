using RimWorld;
using UnityEngine;
using Verse;

namespace SerenBiotechExtended
{
    // Worker of the body mask nodes. The masks are drawn on an adult 512 px canvas whose sides and legs are mostly
    // transparent, so scaling that canvas down to a child or a baby body leaves almost nothing visible. On those
    // body types the genes use the MaskN_Fit textures (content cropped to its bounding box, stretched to the whole
    // texture) and this worker sizes the node in world units to a part of the body, measured from the feet:
    // Mask 6 (pants-like) goes from the feet to the navel, the other masks cover the torso only.
    public class PawnRenderNodeWorker_MaskBody : PawnRenderNodeWorker_AttachmentBody
    {
        // Width and height of the whole body, neck to feet, in world units.
        private const float ChildWidth = 0.30f;
        private const float ChildHeight = 0.66f;
        private const float BabyWidth = 0.30f;
        private const float BabyHeight = 0.55f;

        // Parts of the height, from the feet (0) to the neck (1): the navel is at about half, the crotch at about a quarter.
        private const float FeetToNavelTop = 0.48f;
        private const float TorsoBottom = 0.28f;

        private static bool IsFeetToNavel(PawnRenderNode node)
        {
            string path = node.Props.texPath;
            return path != null && path.EndsWith("Mask6");
        }

        private static bool TryDims(Pawn pawn, out float width, out float height)
        {
            BodyTypeDef body = pawn.story?.bodyType;
            if (body == BodyTypeDefOf.Baby)
            {
                width = BabyWidth;
                height = BabyHeight;
                return true;
            }
            if (body == BodyTypeDefOf.Child)
            {
                width = ChildWidth;
                height = ChildHeight;
                return true;
            }
            width = height = 0f;
            return false;
        }

        private static void Part(PawnRenderNode node, out float bottom, out float top)
        {
            if (IsFeetToNavel(node))
            {
                bottom = 0f;
                top = FeetToNavelTop;
            }
            else
            {
                bottom = TorsoBottom;
                top = 1f;
            }
        }

        public override Vector3 ScaleFor(PawnRenderNode node, PawnDrawParms parms)
        {
            Vector3 scale = base.ScaleFor(node, parms);
            if (!TryDims(parms.pawn, out float width, out float height))
                return scale;
            Part(node, out float bottom, out float top);
            return new Vector3(scale.x * width, scale.y, scale.z * height * (top - bottom));
        }

        public override Vector3 OffsetFor(PawnRenderNode node, PawnDrawParms parms, out Vector3 pivot)
        {
            Vector3 offset = base.OffsetFor(node, parms, out pivot);
            if (TryDims(parms.pawn, out _, out float height))
            {
                Part(node, out float bottom, out float top);
                offset.z += ((bottom + top) / 2f - 0.5f) * height;
            }
            return offset;
        }
    }
}
