using System.Collections.Generic;
using RimWorld;
using UnityEngine;
using Verse;

namespace SerenBiotechExtended
{
    // On a GeneDef: the pale second colour of the original Seren mod, chosen by gene instead of drawn at random.
    public class AccentColorExtension : DefModExtension
    {
        public Color color = Color.white;
    }

    public static class AccentColor
    {
        // The accent colour of the first accent gene the pawn has, or null when it has none.
        public static Color? For(Pawn pawn)
        {
            List<Gene> genes = pawn?.genes?.GenesListForReading;
            if (genes == null)
                return null;
            for (int i = 0; i < genes.Count; i++)
            {
                AccentColorExtension ext = genes[i].def.GetModExtension<AccentColorExtension>();
                if (ext != null)
                    return ext.color;
            }
            return null;
        }
    }

    // Render nodes of the horn and body mask genes: drawn in the accent colour when the pawn has one,
    // in the colour written on the gene otherwise.
    public class PawnRenderNode_AccentHead : PawnRenderNode_AttachmentHead
    {
        public PawnRenderNode_AccentHead(Pawn pawn, PawnRenderNodeProperties props, PawnRenderTree tree) : base(pawn, props, tree) { }

        public override Color ColorFor(Pawn pawn) => AccentColor.For(pawn) ?? base.ColorFor(pawn);
    }

    public class PawnRenderNode_AccentBody : PawnRenderNode
    {
        public PawnRenderNode_AccentBody(Pawn pawn, PawnRenderNodeProperties props, PawnRenderTree tree) : base(pawn, props, tree) { }

        public override Color ColorFor(Pawn pawn) => AccentColor.For(pawn) ?? base.ColorFor(pawn);
    }
}
