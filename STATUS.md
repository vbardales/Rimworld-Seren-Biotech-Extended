---
mod: Seren Biotech Extended
packageId: nelim.serenbiotechextended
repo: Rimworld-Seren-Biotech-Extended
remote: https://github.com/vbardales/Rimworld-Seren-Biotech-Extended.git
visibility: public
detached: yes
workflow_stage: makeSources
licence: open
licence_at: "2026-10-26 (rechecked): CC0 for the original Seren 2704627783 (LICENSE file and GitHub OdysseyLotus/Seren, CC0-1.0) and for the Biotech fork 3726565301 (LICENSE file), both reusable. NOT established for the three face mods 3793591541, 2844766515, 2844766352 by OdysseyLotus: no LICENSE, no licence text in About.xml, no GitHub repo, they declare 1.6 so the workflow rule class is alive: nothing is copied from them. The facial assets inside the CC0 original and fork are usable."
upstream_mod_remotes:
  - https://github.com/Lucius127/Steam-Seren-Biotech
settings_audit: not_applicable
localization: unchecked
translation_en: unchecked
translation_fr: unchecked
dependencies: unchecked
workshop: none
published: no
tested_on: never
# Audit 2026-10-26: stage 1 setupRepo complete (1.a closed by Search-Workshop over 9402 About.xml: no other Seren-related mod besides the originals and the fork), 1.j ERROR cleared by the 1.k commit itself (it carried protocols_read_sha), 1.k declared. Stage 2 makeSources: ModIcon-source and Preview-source belong to Virginie.
remaining:
  - "2026-10-26: unverified 1.a closed: Search-Workshop.sh over 9402 installed About.xml found only odysseylotus.seren, the 3 OdysseyLotus face mods, the fork, thrumbohusbandry and Royal Serenity Statue (unrelated); also read locally 3822096385, 2879072525, 2887956113, 3214172563, 3314993192, 2880940958, 2880942803, 3658223466, 3547798297: none adds Seren horns, masks or heads, none chooses a pale accent colour by gene (2878375967 unread, Steam 429)"
  - "2026-10-26: feature makeSources: ModIcon-source.png and Preview-source.png are Virginie's sources (AUDIT.md 2.a, 2.e); session prepares PROMPT_SerenBiotechExtended.md only when she asks"
  - "2026-10-26: feature accent colour genes: C# assembly and 12 SerenAccent_* genes built, ticket 9b52 (03-accents) queued; then heads and ears textures from the CC0 original, then the VTE or Experimentals face-set choice, then pawnkinds and the rest"
  - "2026-10-26: feature lifespan (fork feedback Oct 2026): the original race lives about 300 years, the fork xenotype ages like a human (a player got frail at 55, Lucius says it was never implemented). Candidate for this mod once the render work is done: check what a gene can change (GeneDef lifespan and ageing fields in Biotech 1.6) before promising it; ask Virginie first, it changes gameplay, not looks"
  - "2026-10-26: unverified fork feedback on the blood smear still red and facial animations odd with Camera+ (May 2026, Lucius said he would fix); relevant to the face-set work, check on captures"
  - "2026-10-26: unverified fork feedback (Workshop 3726565301 comments, May 2026): cross-reference errors Creative_DT (TraitDef, Dynamic.DynamicsTraits) and AA_BiologicalCorruptors (MemeDef, sarg.alphaanimals); Lucius fixed (resubscribe); the installed fork no longer contains either. The original guards both with MayRequire. When porting pawnkinds, backstories, factions or creepjoiners, keep every MayRequire, check each trait, meme and def reference against the fork, run Check-DefRefs on the result"
  - "2026-10-26: feature scope widened by Virginie: port what the original lacks vs the fork, order: 12 masks (done), horns (ticket f72b), heads/ears textures, then pawnkinds and the rest; inventory in the side-session notes"
  - "2026-10-26: done folder renamed SerenOriginalMasks to SerenBiotechExtended, map line nelim.serenbiotechextended path:SerenBiotechExtended/Mod"
  - "2026-10-26: unverified horns: ticket f72b green (1 scenario, 11 shots, Tests/Pickle/Inbox/horns); styles 0 to 7 draw as grey horns with a dark outline, like the fork Back sensors, not skin-tinted: the original does the same, its horn and body masks are drawn in the skin channel second colour (pale white, light yellow, light blue, light indigo, light purple, 5 weight each), not the skin colour; Virginie to judge; Baby and Child horn variants not ported"
  - "2026-10-26: feature setting to choose Vanilla Textures Expanded or Nals Experimentals face set when both are installed (the fork loads Experimentals when both are active); needs MOD_SETTINGS.md pass"
  - "2026-10-26: defect licence of 3793591541, 2844766515, 2844766352 (OdysseyLotus, Seren face assets) not established: nothing taken from them; if their assets are wanted, ask OdysseyLotus for explicit permission (Virginie decides; the author is reachable on Discord per the Seren README) and record the answer"
  - "2026-10-26: unverified upstream_mod_remotes: https://github.com/Lucius127/Steam-Seren-Biotech answers 404 (private or renamed); the original repo https://github.com/OdysseyLotus/Seren is CC0 and public"
  - "2026-10-26: unverified Virginie compares captures (Tests/Pickle/Inbox/first-captures, ticket efee, 2/2 green, 20 shots) with her reference image"
  - "2026-10-26: unverified colours (genes tint white textures, values guessed)"
updated: 2026-10-26
protocols_read_sha: 43dd90d4b7873c500347fba1be01275a48d5795b
---

# Seren Biotech Extended: status

Current state only: the front matter above is the source of truth, run lines go to `docs/runs/`.
