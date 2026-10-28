using RimWorld;
using Verse;

namespace SerenBiotechExtended
{
    // Hidden shortcut (MainButtonDef buttonVisible false, revealed by RIMMSQOL and similar mods) that opens the same page as Mod options.
    // The page belongs to Mod Settings Framework, which gives each mod a handle named after the mod while one of its options can run.
    public class MainButtonWorker_Settings : MainButtonWorker
    {
        private const string PackageId = "nelim.serenbiotechextended";

        public override void Activate()
        {
            ModContentPack pack = LoadedModManager.RunningModsListForReading.Find(p => p.PackageIdPlayerFacing.ToLower() == PackageId);
            foreach (Mod handle in LoadedModManager.ModHandles)
            {
                if (pack != null && handle.GetType().Name == "ModSettingsFrameworkMod" && handle.SettingsCategory() == pack.Name)
                {
                    Find.WindowStack.Add(new Dialog_ModSettings(handle));
                    return;
                }
            }
            Messages.Message("SerenBiotechExtended_NoSettingsPage".Translate(), MessageTypeDefOf.RejectInput, false);
        }
    }
}
