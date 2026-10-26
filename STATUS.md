---
mod: Seren Original Masks
packageId: nelim.serenoriginalmasks
repo: Rimworld-Seren-Original-Masks
remote: https://github.com/vbardales/Rimworld-Seren-Original-Masks.git
visibility: public
detached: yes
workflow_stage: setupRepo
licence: open
licence_at: "2026-10-26: both source mods are CC0 (their LICENSE files read), reuse allowed, credited in ATTRIBUTION.md"
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
  - "2026-10-26: unverified sources 3793591541, 2844766515, 2844766352 not read (not installed, Steam 429), licences unknown"
  - "2026-10-26: unverified 1.a duplicate check: Virginie named 3822096385, 3214172563, 2879072525, 2887956113; three read locally (colour/skin patches, no body masks), 3214172563 unread (Steam 429); the three extra source mods 3793591541, 2844766515, 2844766352 are arriving (subscribed), then read their licences and content"
  - "2026-10-26: defect 1.j Check-Status ERROR protocols_read_sha missing in first commit 4b8f824, Virginie chose to leave it (fix = squash and force-push)"
  - "2026-10-26: feature 1.k move to makeSources once 1.a is closed (commit 2)"
  - "2026-10-26: unverified Virginie compares captures (Tests/Pickle/Inbox/first-captures, ticket efee, 2/2 green, 20 shots) with her reference image"
  - "2026-10-26: unverified colours (genes tint white textures, values guessed)"
updated: 2026-10-26
protocols_read_sha: 43dd90d4b7873c500347fba1be01275a48d5795b
---

# Seren Original Masks: status

Current state only: the front matter above is the source of truth, run lines go to `docs/runs/`.
