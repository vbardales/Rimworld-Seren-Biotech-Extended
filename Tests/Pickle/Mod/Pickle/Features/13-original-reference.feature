# Reference photographs of the ORIGINAL Seren mod (HAR race, no Realistic Bodies, no Facial Animation): how its body mask 6 draws on a body, front, side and back, to compare with the ported mask of this mod. Map wsl-deps.seren-original.map. Scenario 1 is a probe: list the pawn's HAR addons, force mask 6, one photograph.
@review
Feature: Original Seren body mask 6

  Scenario: seren-reference-1: probe, the HAR addons of an original Seren, mask 6 forced, front
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I frame the area centred on (177, 121) at root size 6.5
    And Nelim's Pickle Tools: a colonist "Orig" of kind "SerenRefugee" exists
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: the alien addons of "Orig" are listed
    And Nelim's Pickle Tools: "Orig" is undressed
    And Nelim's Pickle Tools: I frame the cell (176, 120) at zoom 2
    When Nelim's Pickle Tools: "Orig" alien addon "Things/Seren/Masks/Body/Mask" variant is 6
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-mask-6-south"
