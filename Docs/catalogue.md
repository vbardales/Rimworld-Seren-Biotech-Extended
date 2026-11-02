# Seren body masks

Seren Biotech Extended adds the 12 body masks of the original Seren mod (2704627783) to the Biotech fork of Seren (3726565301). Each mask is a gene: SerenOriginalMask_0 to SerenOriginalMask_11. A pawn wears one mask at most (same exclusion tag as the fork masks, SerenBodyMask). The masks are drawn on the body in the pale second colour of the pawn, or in white (235, 238, 255) when the pawn has no accent gene.

The Seren sheets of the NPT catalogue (seren.md and the sheets 07xx to 1xxx) stay on their own pages: this page only describes how the masks are sized and baked.

## The 12 masks

- Mask 0: a crescent on the chest.
- Mask 1: a sun, drawn in white as in the original.
- Mask 5: a diffuse galaxy with one bright star, stays inside the body silhouette.
- Mask 6: fluffy pants in three tones, from the waist to the feet, wavy top edge.
- Masks 2, 3, 4, 7 to 11: other patterns of the original, same rules as below.

## Photographs

![Mask 6, front](mask6-front.png)

![Mask 6, back](mask6-back.png)

![Mask 5, front](mask5-front.png)

![Mask 1, front](mask1-front.png)

## How a mask is drawn

| Rule | What it does |
|---|---|
| Canvas | The art is a square picture for the body of the original Seren, north, east and south facings. |
| Mask 6 bake | At startup, the art is stretched over each Naked body picture from the feet to the waist, each row fitted to the skin width, then clipped to the skin. |
| Other masks, adult bodies | At startup, the art is clipped to the skin of each adult Naked body picture, so nothing is drawn past the silhouette of a body narrower than the original. |
| Child and baby bodies | The mask is mapped from the adult body onto the child body: same relative place, scale from the ratio of the two body pictures. |
| Draw scale | The mask is drawn at the scale of the body node. The game attachment worker multiplies by the average of the body graphic scale (0.8 on Thin, 0.5 on Baby), which left the masks too small before the fix of 2026-11-02. |
| Shader | Transparent, so the tones of the pants and the haze of the galaxy keep their alpha levels. |

## Where the pants start on the Realistic Bodies

Share of the skin height from the feet: the navel mark plus about a tenth of the height, so the top of the pants sits just above the navel.

| Body | Share |
|---|---|
| Male | 0.41 |
| Female | 0.50 |
| Thin | 0.39 |
| Thin Female | 0.47 |
| Fat | 0.50 |
| Fat Female | 0.50 |
| Hulk | 0.44 |
| Hulk Female | 0.48 |

## Size check

The check photographs the masks on an undressed purple-skinned pawn, front and back, and on a blue-skinned one. The masks must reach the sides and the bottom outline of the body. The photographs above come from the run of 2026-11-02 on the Thin Female body.
