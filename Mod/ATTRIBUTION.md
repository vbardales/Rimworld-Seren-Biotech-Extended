# Attribution

- **Seren** (original, Humanoid Alien Races), Steam Workshop 2704627783, by OdysseyLotus. CC0 (LICENSE read 2026-10-26). The twelve body masks `Things/Seren/Masks/Body/Mask*_south/_east/_north.png` are the source of every texture in `Mod/Textures/Things/SerenOriginalMasks/`.
- **Seren, from Stardust [Biotech Fork]**, Steam Workshop 3726565301, packageId `odysseylotus.serenbiotech`, by OdysseyLotus and Lucius. CC0 (LICENSE read 2026-10-26). The gene definitions are modelled on its `GeneDefs_Seren_BodyMasks.xml` and inherit its abstract `GeneSerenBodyMaskBase`.

## Conversion

The originals are HAR channel masks (opaque, red = no mark, green = marking drawn in the second colour, mixed values = blend). Each pixel becomes white with alpha = G / (R + G), so the drawn area and its gradient are kept. The gene tints the white (`colorType` Custom). `Mask.png` of the original is `Mask0` here.
