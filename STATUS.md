---
mod: Seren Original Masks
packageId: nelim.serenoriginalmasks
repo: Rimworld-Seren-Original-Masks
remote: https://github.com/vbardales/Rimworld-Seren-Original-Masks.git
visibility: public
detached: yes
workflow_stage: setupRepo
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
# Audit stage 1 (setupRepo) 2026-10-26: 1.b, 1.c, 1.d (public: not applicable), 1.e, 1.f, 1.g, 1.h, 1.i done; 1.a open; 1.j Check-Status ERROR kept by Virginie; 1.k not declared. Code on the way (masks, horns) while 1.a waits.
remaining:
  - "2026-10-26: feature scope widened by Virginie: port what the original lacks vs the fork, order: 12 masks (done), horns (ticket f72b), heads/ears textures, then pawnkinds and the rest; inventory in the side-session notes"
  - "2026-10-26: feature setting to choose Vanilla Textures Expanded or Nals Experimentals face set when both are installed (the fork loads Experimentals when both are active); needs MOD_SETTINGS.md pass"
  - "2026-10-26: defect licence of 3793591541, 2844766515, 2844766352 (OdysseyLotus, Seren face assets) not established: nothing taken from them; if their assets are wanted, ask OdysseyLotus for explicit permission (Virginie decides; the author is reachable on Discord per the Seren README) and record the answer"
  - "2026-10-26: unverified upstream_mod_remotes: https://github.com/Lucius127/Steam-Seren-Biotech answers 404 (private or renamed); the original repo https://github.com/OdysseyLotus/Seren is CC0 and public"
  - "2026-10-26: unverified 1.a duplicate check: no duplicate found among 3822096385, 2879072525, 2887956113, 3214172563 (LFS Genes Expanded Skin, skin colours only, 1.4 to 1.5, no licence), none adds body masks, horns or heads for Seren; Workshop search itself still not run (needs Virginie OK)"
  - "2026-10-26: defect 1.j Check-Status ERROR protocols_read_sha missing in first commit 4b8f824, Virginie chose to leave it (fix = squash and force-push)"
  - "2026-10-26: feature 1.k move to makeSources once 1.a is closed (commit 2)"
  - "2026-10-26: unverified Virginie compares captures (Tests/Pickle/Inbox/first-captures, ticket efee, 2/2 green, 20 shots) with her reference image"
  - "2026-10-26: unverified colours (genes tint white textures, values guessed)"
updated: 2026-10-26
protocols_read_sha: 43dd90d4b7873c500347fba1be01275a48d5795b
---

# Seren Original Masks: status

Current state only: the front matter above is the source of truth, run lines go to `docs/runs/`.
