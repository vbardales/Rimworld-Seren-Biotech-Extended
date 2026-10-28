using System.Collections.Generic;
using System.Linq;
using HarmonyLib;
using RimWorld;
using Verse;

namespace SerenBiotechExtended
{
    // On a skin colour GeneDef of the Seren xenotype: its weight in the draw of the original Seren mod.
    public class SkinWeightExtension : DefModExtension
    {
        public float weight = 1f;
    }

    // The game picks one of the genes of a xenotype that exclude each other with TryRandomElement, every gene as likely as any other,
    // and never reads selectionWeight there. The original Seren mod draws its skin colour with a weight per colour, so a new
    // pawn that holds several weighted skin genes keeps one of them, picked by weight, and loses the others.
    [StaticConstructorOnStartup]
    public static class SkinWeights
    {
        static SkinWeights()
        {
            new Harmony("nelim.serenbiotechextended").PatchAll();
        }

        public static void Choose(Pawn pawn)
        {
            if (pawn?.genes == null)
                return;
            List<Gene> candidates = pawn.genes.GenesListForReading
                .Where(g => g.def.GetModExtension<SkinWeightExtension>() != null).ToList();
            if (candidates.Count < 2)
                return;
            Gene chosen = candidates.RandomElementByWeight(g => g.def.GetModExtension<SkinWeightExtension>().weight);
            foreach (Gene gene in candidates)
            {
                if (gene != chosen)
                    pawn.genes.RemoveGene(gene);
            }
        }
    }

    [HarmonyPatch(typeof(PawnGenerator), "GenerateGenes")]
    public static class PawnGenerator_GenerateGenes_Patch
    {
        public static void Postfix(Pawn pawn)
        {
            SkinWeights.Choose(pawn);
        }
    }
}
