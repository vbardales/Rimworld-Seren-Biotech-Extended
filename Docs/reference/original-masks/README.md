# Original Seren body masks on vanilla bodies

Reference for the fit of our masks: the original Seren mod (2704627783, CC0) masks 0 to 11, drawn on a vanilla adult (Thin) and a vanilla child, undressed, three facings.

- Files: `<adult|child>-mask-<N>-<south|east|north>.jpg`, 72 files, 1280 px wide, JPEG 70 (re-encoded from the 1920 px captures).
- Source runs (Pickle, Tests/Pickle/Inbox, scenarios `seren-original-vanilla-1` to `-8`): 78eb (masks 0 to 2), 4010 (adult 3 to 11), 856f (child 3 to 11). Tree 6dd4739.
- Measured on the vanilla bodies: Thin h264 w108, Child h204 w120. Measured on our WDI adult: h260 w118, navel 31 percent from the bottom; our child h196 w113; ratios 0.754 and 0.958.
- The full-size PNG captures stay in Tests/Pickle/Inbox until the masks are measured on them.

## Measured (full-size 1920x1080 captures, south, mask 6 pink gradient, game pixels)

Method: pink pixels (R>190, G<175, B>140, R-G>40) and dark outline pixels (R+G+B<90) in the box x 860..1060, y 380..760.

| Body | Pink rows (height) | Pink x (width) | Body outline x at torso (width) | Outline bottom |
|---|---|---|---|---|
| Vanilla child | 504..624 (121) | 936..983 (48) | 929..990 (62) | about 632 |
| Vanilla Thin adult | 437..656 (220) | 934..985 (52) | 921..997 (77) | about 670 |

Reading: the original mask fills the whole torso inside the outline, from under the head to about 8 px (child) and 14 px (adult) above the outline bottom, about 0.77 (child) and 0.68 (adult) of the outer torso width. On the child the body is a straight tube; the mask is not squeezed and is hidden only where the head covers it. Mask 0 on the child: a thin white smile line on the chest under the head, not hidden.
