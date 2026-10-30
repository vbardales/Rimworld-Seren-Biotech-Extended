using RimWorld;
using UnityEngine;
using Verse;

namespace SerenBiotechExtended
{
    // Worker of the body mask nodes. The masks are drawn on an adult 512 px canvas whose sides and legs are mostly
    // transparent, so scaling that canvas down to a child or a baby body leaves almost nothing visible. On those
    // body types the genes use the MaskN_Fit textures (content cropped to its bounding box, stretched to the whole
    // texture) and this worker sizes the node to the torso and legs of the body in world units.
    // Mask 6 is the pants-like one: it goes from the feet to the navel, the others cover the torso and the legs.
    public class PawnRenderNodeWorker_MaskBody : PawnRenderNodeWorker_AttachmentBody
    {
        // Width and height of the torso and legs, and of the feet to navel part, in world units.
        private const float ChildWidth = 0.30f;
        private const float ChildHeight = 0.66f;
        private const float BabyWidth = 0.30f;
        private const float BabyHeight = 0.55f;
        // The navel sits at about half of the height; Mask 6 covers the lower half.
        private const float NavelFraction = 0.48f;

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

        public override Vector3 ScaleFor(PawnRenderNode node, PawnDrawParms parms)
        {
            Vector3 scale = base.ScaleFor(node, parms);
            if (!TryDims(parms.pawn, out float width, out float height))
                return scale;
            if (IsFeetToNavel(node))
                height *= NavelFraction;
            return new Vector3(scale.x * width, scale.y, scale.z * height);
        }

        public override Vector3 OffsetFor(PawnRenderNode node, PawnDrawParms parms, out Vector3 pivot)
        {
            Vector3 offset = base.OffsetFor(node, parms, out pivot);
            if (TryDims(parms.pawn, out _, out float height) && IsFeetToNavel(node))
                offset.z -= height * (1f - NavelFraction) / 2f;
            return offset;
        }
    }
}
