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
        // The pale tones of the original are tinted over grey shaded art, where they read as almost white: raise the
        // saturation and lower the value a little, keeping the hue.
        private const float SaturationFactor = 1.7f;
        private const float ValueFactor = 0.94f;

        private static Color Deepen(Color c)
        {
            Color.RGBToHSV(c, out float h, out float s, out float v);
            Color d = Color.HSVToRGB(h, Mathf.Clamp01(s * SaturationFactor), v * ValueFactor);
            d.a = c.a;
            return d;
        }

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
                    return Deepen(ext.color);
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

        public static bool IsFeetToNavel(PawnRenderNode node) => node.Props.texPath != null && node.Props.texPath.EndsWith("Mask6");

        // The MaskN_Fit textures (content cropped to its bounding box) are used for Mask 6 on every body,
        // and for the other masks on a child or a baby.
        public static bool UsesFit(PawnRenderNode node, Pawn pawn)
        {
            BodyTypeDef body = pawn.story?.bodyType;
            return IsFeetToNavel(node) || body == BodyTypeDefOf.Child || body == BodyTypeDefOf.Baby;
        }

        protected override string TexPathFor(Pawn pawn) => UsesFit(this, pawn) ? Props.texPath + "_Fit" : base.TexPathFor(pawn);
    }
}
