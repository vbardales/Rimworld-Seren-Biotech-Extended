# ChatGPT review refusals

Suggestions from the ChatGPT translation review that were refused. `/review-translation` sends this file with every page and tells ChatGPT not to propose them again. One line each: key or text, proposal, reason, date.

- French letters, `PAWN_possessive` and `PAWN_objective`: restore them in the French letter texts. Refused: vanilla French packs never use them, and French possessives agree with the noun, not the pawn. 2026-11-12.
- `genderNoun` ask: add a gender noun to the French texts. Refused by the session, same reasoning (French agreement follows the noun). 2026-11-12.
- French letter `OL_SerenCreepDrifter.letterPrompt`: replace `très fatiguæ` by another neutral form. Refused: `-æ` is the documented neutral ending of the project, same as `ratatinæ`; no better neutral form exists. 2026-11-13.
- `OL_SpaceBorn.description` English: capitalise `Panastrian sun`. Refused: official name of the star unconfirmed by lore, no change without it. 2026-11-13.
- French `OL_SerenBlindhealer.letterPrompt`: replace the neutral branch `An petit être ratatinæ` by `Un petit être ratatinæ` (2026-11-13 page) or by lowercase `an petit être ratatinæ` (later page). Refused both: `an` is the documented neutral article (docs/TRANSLATIONS.md, al system), `Un` is masculine; the capital stays because the branch opens the sentence. 2026-11-13.
