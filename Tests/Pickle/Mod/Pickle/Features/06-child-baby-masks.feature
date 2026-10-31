# The ported Seren body masks on a baby and on a child, undressed (asked by SanctuaryBacklot for the owner, 2026-10-28: the mask of Nima, a baby, and of Lyra, a child, was not seen in their shots). The mod has no baby or child variant of the masks: this shows whether the adult texture draws on the smaller bodies. Teal skin of the original (OL_SkinTeal), front view, masks 0 to 11.
@review @timeout:900 @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.camerazoom
Feature: Seren original body masks on a baby and a child

  Scenario: seren-child-masks-1: baby, masks 6, 0, 1, 2, undressed, teal skin (split in groups of four, the Pickle watchdog stops a scenario after 300 s)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: a colonist "Baby" of kind "OL_SerenColonist" exists
    And "Baby" is 1 years old
    And Nelim's Pickle Tools: "Baby" gender is Female
    When Nelim's Pickle Tools: "Baby" loses all genes
    And Nelim's Pickle Tools: "Baby" body type is Baby
    And Nelim's Pickle Tools: "Baby" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Baby" has the gene "SerenOriginalMask_6"
    And Nelim's Pickle Tools: "Baby" is undressed
    And Nelim's Pickle Tools: "Baby" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Baby" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "babymask-6"
    When Nelim's Pickle Tools: "Baby" loses all genes
    And Nelim's Pickle Tools: "Baby" body type is Baby
    And Nelim's Pickle Tools: "Baby" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Baby" has the gene "SerenOriginalMask_0"
    And Nelim's Pickle Tools: "Baby" is undressed
    And Nelim's Pickle Tools: "Baby" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Baby" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "babymask-0"
    When Nelim's Pickle Tools: "Baby" loses all genes
    And Nelim's Pickle Tools: "Baby" body type is Baby
    And Nelim's Pickle Tools: "Baby" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Baby" has the gene "SerenOriginalMask_1"
    And Nelim's Pickle Tools: "Baby" is undressed
    And Nelim's Pickle Tools: "Baby" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Baby" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "babymask-1"
    When Nelim's Pickle Tools: "Baby" loses all genes
    And Nelim's Pickle Tools: "Baby" body type is Baby
    And Nelim's Pickle Tools: "Baby" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Baby" has the gene "SerenOriginalMask_2"
    And Nelim's Pickle Tools: "Baby" is undressed
    And Nelim's Pickle Tools: "Baby" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Baby" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "babymask-2"

  Scenario: seren-child-masks-2: baby, masks 3, 4, 5, 7, undressed, teal skin (split in groups of four, the Pickle watchdog stops a scenario after 300 s)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: a colonist "Baby" of kind "OL_SerenColonist" exists
    And "Baby" is 1 years old
    And Nelim's Pickle Tools: "Baby" gender is Female
    When Nelim's Pickle Tools: "Baby" loses all genes
    And Nelim's Pickle Tools: "Baby" body type is Baby
    And Nelim's Pickle Tools: "Baby" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Baby" has the gene "SerenOriginalMask_3"
    And Nelim's Pickle Tools: "Baby" is undressed
    And Nelim's Pickle Tools: "Baby" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Baby" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "babymask-3"
    When Nelim's Pickle Tools: "Baby" loses all genes
    And Nelim's Pickle Tools: "Baby" body type is Baby
    And Nelim's Pickle Tools: "Baby" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Baby" has the gene "SerenOriginalMask_4"
    And Nelim's Pickle Tools: "Baby" is undressed
    And Nelim's Pickle Tools: "Baby" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Baby" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "babymask-4"
    When Nelim's Pickle Tools: "Baby" loses all genes
    And Nelim's Pickle Tools: "Baby" body type is Baby
    And Nelim's Pickle Tools: "Baby" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Baby" has the gene "SerenOriginalMask_5"
    And Nelim's Pickle Tools: "Baby" is undressed
    And Nelim's Pickle Tools: "Baby" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Baby" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "babymask-5"
    When Nelim's Pickle Tools: "Baby" loses all genes
    And Nelim's Pickle Tools: "Baby" body type is Baby
    And Nelim's Pickle Tools: "Baby" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Baby" has the gene "SerenOriginalMask_7"
    And Nelim's Pickle Tools: "Baby" is undressed
    And Nelim's Pickle Tools: "Baby" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Baby" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "babymask-7"

  Scenario: seren-child-masks-3: baby, masks 8, 9, 10, 11, undressed, teal skin (split in groups of four, the Pickle watchdog stops a scenario after 300 s)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: a colonist "Baby" of kind "OL_SerenColonist" exists
    And "Baby" is 1 years old
    And Nelim's Pickle Tools: "Baby" gender is Female
    When Nelim's Pickle Tools: "Baby" loses all genes
    And Nelim's Pickle Tools: "Baby" body type is Baby
    And Nelim's Pickle Tools: "Baby" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Baby" has the gene "SerenOriginalMask_8"
    And Nelim's Pickle Tools: "Baby" is undressed
    And Nelim's Pickle Tools: "Baby" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Baby" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "babymask-8"
    When Nelim's Pickle Tools: "Baby" loses all genes
    And Nelim's Pickle Tools: "Baby" body type is Baby
    And Nelim's Pickle Tools: "Baby" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Baby" has the gene "SerenOriginalMask_9"
    And Nelim's Pickle Tools: "Baby" is undressed
    And Nelim's Pickle Tools: "Baby" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Baby" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "babymask-9"
    When Nelim's Pickle Tools: "Baby" loses all genes
    And Nelim's Pickle Tools: "Baby" body type is Baby
    And Nelim's Pickle Tools: "Baby" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Baby" has the gene "SerenOriginalMask_10"
    And Nelim's Pickle Tools: "Baby" is undressed
    And Nelim's Pickle Tools: "Baby" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Baby" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "babymask-10"
    When Nelim's Pickle Tools: "Baby" loses all genes
    And Nelim's Pickle Tools: "Baby" body type is Baby
    And Nelim's Pickle Tools: "Baby" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Baby" has the gene "SerenOriginalMask_11"
    And Nelim's Pickle Tools: "Baby" is undressed
    And Nelim's Pickle Tools: "Baby" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Baby" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "babymask-11"

  Scenario: seren-child-masks-4: child, masks 6, 0, 1, 2, undressed, teal skin (split in groups of four, the Pickle watchdog stops a scenario after 300 s)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: a colonist "Child" of kind "OL_SerenColonist" exists
    And "Child" is 8 years old
    And Nelim's Pickle Tools: "Child" gender is Female
    When Nelim's Pickle Tools: "Child" loses all genes
    And Nelim's Pickle Tools: "Child" body type is Child
    And Nelim's Pickle Tools: "Child" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Child" has the gene "SerenOriginalMask_6"
    And Nelim's Pickle Tools: "Child" is undressed
    And Nelim's Pickle Tools: "Child" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Child" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "childmask-6"
    When Nelim's Pickle Tools: "Child" loses all genes
    And Nelim's Pickle Tools: "Child" body type is Child
    And Nelim's Pickle Tools: "Child" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Child" has the gene "SerenOriginalMask_0"
    And Nelim's Pickle Tools: "Child" is undressed
    And Nelim's Pickle Tools: "Child" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Child" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "childmask-0"
    When Nelim's Pickle Tools: "Child" loses all genes
    And Nelim's Pickle Tools: "Child" body type is Child
    And Nelim's Pickle Tools: "Child" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Child" has the gene "SerenOriginalMask_1"
    And Nelim's Pickle Tools: "Child" is undressed
    And Nelim's Pickle Tools: "Child" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Child" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "childmask-1"
    When Nelim's Pickle Tools: "Child" loses all genes
    And Nelim's Pickle Tools: "Child" body type is Child
    And Nelim's Pickle Tools: "Child" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Child" has the gene "SerenOriginalMask_2"
    And Nelim's Pickle Tools: "Child" is undressed
    And Nelim's Pickle Tools: "Child" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Child" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "childmask-2"

  Scenario: seren-child-masks-5: child, masks 3, 4, 5, 7, undressed, teal skin (split in groups of four, the Pickle watchdog stops a scenario after 300 s)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: a colonist "Child" of kind "OL_SerenColonist" exists
    And "Child" is 8 years old
    And Nelim's Pickle Tools: "Child" gender is Female
    When Nelim's Pickle Tools: "Child" loses all genes
    And Nelim's Pickle Tools: "Child" body type is Child
    And Nelim's Pickle Tools: "Child" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Child" has the gene "SerenOriginalMask_3"
    And Nelim's Pickle Tools: "Child" is undressed
    And Nelim's Pickle Tools: "Child" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Child" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "childmask-3"
    When Nelim's Pickle Tools: "Child" loses all genes
    And Nelim's Pickle Tools: "Child" body type is Child
    And Nelim's Pickle Tools: "Child" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Child" has the gene "SerenOriginalMask_4"
    And Nelim's Pickle Tools: "Child" is undressed
    And Nelim's Pickle Tools: "Child" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Child" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "childmask-4"
    When Nelim's Pickle Tools: "Child" loses all genes
    And Nelim's Pickle Tools: "Child" body type is Child
    And Nelim's Pickle Tools: "Child" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Child" has the gene "SerenOriginalMask_5"
    And Nelim's Pickle Tools: "Child" is undressed
    And Nelim's Pickle Tools: "Child" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Child" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "childmask-5"
    When Nelim's Pickle Tools: "Child" loses all genes
    And Nelim's Pickle Tools: "Child" body type is Child
    And Nelim's Pickle Tools: "Child" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Child" has the gene "SerenOriginalMask_7"
    And Nelim's Pickle Tools: "Child" is undressed
    And Nelim's Pickle Tools: "Child" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Child" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "childmask-7"

  Scenario: seren-child-masks-6: child, masks 8, 9, 10, 11, undressed, teal skin (split in groups of four, the Pickle watchdog stops a scenario after 300 s)
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: a colonist "Child" of kind "OL_SerenColonist" exists
    And "Child" is 8 years old
    And Nelim's Pickle Tools: "Child" gender is Female
    When Nelim's Pickle Tools: "Child" loses all genes
    And Nelim's Pickle Tools: "Child" body type is Child
    And Nelim's Pickle Tools: "Child" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Child" has the gene "SerenOriginalMask_8"
    And Nelim's Pickle Tools: "Child" is undressed
    And Nelim's Pickle Tools: "Child" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Child" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "childmask-8"
    When Nelim's Pickle Tools: "Child" loses all genes
    And Nelim's Pickle Tools: "Child" body type is Child
    And Nelim's Pickle Tools: "Child" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Child" has the gene "SerenOriginalMask_9"
    And Nelim's Pickle Tools: "Child" is undressed
    And Nelim's Pickle Tools: "Child" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Child" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "childmask-9"
    When Nelim's Pickle Tools: "Child" loses all genes
    And Nelim's Pickle Tools: "Child" body type is Child
    And Nelim's Pickle Tools: "Child" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Child" has the gene "SerenOriginalMask_10"
    And Nelim's Pickle Tools: "Child" is undressed
    And Nelim's Pickle Tools: "Child" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Child" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "childmask-10"
    When Nelim's Pickle Tools: "Child" loses all genes
    And Nelim's Pickle Tools: "Child" body type is Child
    And Nelim's Pickle Tools: "Child" has the gene "OL_SkinTeal"
    And Nelim's Pickle Tools: "Child" has the gene "SerenOriginalMask_11"
    And Nelim's Pickle Tools: "Child" is undressed
    And Nelim's Pickle Tools: "Child" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the camera is centered on "Child" at root size 2
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "childmask-11"
