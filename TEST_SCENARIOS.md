# Test scenarios: Seren Biotech Extended

One scenario per behaviour the mod promises (About.xml description and CHANGELOG `[Unreleased]`; `PUBLICATION.md` does not exist yet, it is written at `writeDocs`: re-check this list against it then). Written at `writeTests`, played at `playTests`. Map: save `Nelims-tribe`, dependency map `Tests/Pickle/wsl-deps.masks.map`.

Figures checked against the code: 12 body masks (`SerenOriginalMask_0` to `_11`), 8 horn styles (`SerenOriginalHorns_0` to `_7`), 12 accent genes (`SerenAccent_*`), 8 creepjoiner kinds, 7 player kinds (`OL_SerenTribalPlayer` and six themed ones), longevity curve 1 up to 19 years then 0.214.

Status of each: `written` (Gherkin in `Tests/Pickle/Mod/Pickle/Features/`), `played` (a green ticket exists, evidence in `Tests/Pickle/Evidence/`, not a proof of the current revision), `to write` (needs steps to check against `PickleTools/Docs/steps.md` or new ones, declared to NPT).

| # | Behaviour | Preconditions | Actions | Expected | Status |
|---|---|---|---|---|---|
| 1 | Body masks draw | Seren pawn, one mask gene | Give each of `SerenOriginalMask_0..11`, capture front and back | Mask drawn on the body, only one mask worn, no blank or missing texture | `01-masks.feature` written, played 2026-10-26 (Evidence/first-captures), Virginie still to judge masks 5, 1, 6 against her reference |
| 2 | Horns draw | Seren pawn, one horn gene | Give each of `SerenOriginalHorns_0..7`, capture | Horns drawn, grey with a dark outline without accent gene | `02-horns.feature` written, played (Evidence/horns) |
| 3 | Accent genes tint horns and masks | Seren pawn with a horn or mask gene | Give each `SerenAccent_*` | Horns and masks take the pale tone of the gene; one accent gene at a time (exclusion tag) | `03-accents.feature` written, played (accents, accents3), validated by Virginie 2026-10-26 |
| 4 | Face set, setting off (default) | Facial Animation Experimentals and Vanilla Textures Expanded Facial Animation active | Give eyes and markings genes, capture | Experimentals face parts, markings drawn | `04-faceset.feature` scenario 1 written, played (faceset-off) |
| 5 | Face set, setting on | Same, option `SerenFaceSetVTE` on | Same | Vanilla Textures Expanded face parts | `04-faceset.feature` scenario 2 written (option pinned, not clicked), played (faceset-on3) |
| 6 | Face-set option in Mod options | Experimentals active | Open Mod options, Seren Biotech Extended, tick the box, close, reopen, restart the game | Page present, box keeps its value after reopening and after a restart, effect applies after the restart, no log error; with Experimentals absent no page and no empty entry | to write (UI steps) |
| 7 | Hidden shortcut | Clean configuration, then RIMMSQOL | Look at the main buttons; reveal the button in RIMMSQOL; click | Button neither visible nor greyed by default; once revealed it opens the same page as Mod options; without the page a "no options" message | to write (UI steps, RIMMSQOL in the map) |
| 8 | Longevity gene given | Seren pawn | Give `OL_SerenLongevity` | Gene accepted, in the xenotype `OL_SerenBase` for new pawns | `05-ported-defs.feature` seren-ported-1 written, played (c087 green 2026-10-28, def loads and is given only) |
| 9 | Longevity slows ageing | Pawn with the gene, known age | Advance time over a known span, read the biological age | After 20 years: 20 + 280 calendar years = 80 biological; growth normal before 20; frailty hediffs follow the slowed age | to write (needs a step that reads or sets the biological age, none known) |
| 10 | Ported kinds spawn | Map with Anomaly | Spawn `OL_SerenTribalPlayer` and the 8 creepjoiner kinds as colonists | All 9 spawn, no "tried 300 times to generate age", age clamped | seren-ported-1 written, played (d70c green 2026-10-27) |
| 11 | Space-born gene | Seren pawn | Give `OL_SpaceBorn` | Given without error; with Vanilla Expanded Framework the conditional stat affecters load | seren-ported-1 written, given only; stat effects in vacuum not tested |
| 12 | Creepjoiner letters through the real event | Anomaly, French and English | Trigger a creepjoiner of each form | Letter label and text render in the language, no raw key, pronouns and agreements right for male, female and no-gender pawns | to write (event step, three genders) |
| 13 | French texts | Game in French | Open the gene list, the main button list, the no-page message | Every text of the mod in French, no raw key, nothing cut off; the face-set option label stays English (engine limit) | to write; `FRENCH_REVIEW.md` read by Virginie first |

Not applicable: no recipes, research, items or alerts in this mod, so no scenario for them. No C# logic beyond the accent tint (`AccentColor.cs`) and the shortcut worker: no unit-test project (`Tests/` holds only Pickle), the tint is covered by scenario 3.

Automated and XML checks replayed 2026-10-28 on revision `ba9f323` (all green): `Check-Status.ps1` 0 error, `Check-Translations.ps1` PASS, `Check-DefRefs.ps1` (with the fork as `-AlsoScan`) no unresolved reference, `Check-ConfigErrors.ps1` no config error, `Check-TypeRefs.ps1` no unguarded third-party type, `Check-XmlFields.ps1` only the 12 `color` fields of `AccentColorExtension` (our own class, not resolved by the script: false positives).
