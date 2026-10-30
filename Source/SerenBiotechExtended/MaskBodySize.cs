using RimWorld;
using UnityEngine;
using Verse;

namespace SerenBiotechExtended
{
    // Worker of the body mask nodes: the masks are drawn for an adult torso, so on a child or a baby body they are
    // scaled down and moved up to sit on the smaller torso, like Children Wear Anything does for clothes.
    public class PawnRenderNodeWorker_MaskBody : PawnRenderNodeWorker_AttachmentBody
    {
        private const float ChildScale = 0.65f;
        private const float BabyScale = 0.45f;
        private const float ChildLift = 0.08f;
        private const float BabyLift = 0.12f;

        private static void FactorsFor(Pawn pawn, out float scale, out float lift)
        {
            BodyTypeDef body = pawn.story?.bodyType;
            if (body == BodyTypeDefOf.Baby)
            {
                scale = BabyScale;
                lift = BabyLift;
            }
            else if (body == BodyTypeDefOf.Child)
            {
                scale = ChildScale;
                lift = ChildLift;
            }
            else
            {
                scale = 1f;
                lift = 0f;
            }
        }

        public override Vector3 ScaleFor(PawnRenderNode node, PawnDrawParms parms)
        {
            FactorsFor(parms.pawn, out float scale, out _);
            return base.ScaleFor(node, parms) * scale;
        }

        public override Vector3 OffsetFor(PawnRenderNode node, PawnDrawParms parms, out Vector3 pivot)
        {
            Vector3 offset = base.OffsetFor(node, parms, out pivot);
            FactorsFor(parms.pawn, out _, out float lift);
            offset.z += lift;
            return offset;
        }
    }
}
