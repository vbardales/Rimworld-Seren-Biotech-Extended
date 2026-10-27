# The defs ported from the original Seren mod: the tribal player kind, the eight creepjoiner forms (Anomaly) and the space-born gene.
# The player kinds of the Vanilla Factions Expanded and other themed mods only load with those mods, which the pass map does not hold.
@review
Feature: Ported Seren kinds and genes

  Scenario: seren-ported-1: kinds spawn and the space-born gene is given
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: a colonist "tribe1" of kind "OL_SerenTribalPlayer" exists
    And Nelim's Pickle Tools: a colonist "cj1" of kind "OL_SerenLeatheryStranger" exists
    And Nelim's Pickle Tools: a colonist "cj2" of kind "OL_SerenDarkScholar" exists
    And Nelim's Pickle Tools: a colonist "cj3" of kind "OL_SerenDealMaker" exists
    And Nelim's Pickle Tools: a colonist "cj4" of kind "OL_SerenCreepDrifter" exists
    And Nelim's Pickle Tools: a colonist "cj5" of kind "OL_SerenBlindhealer" exists
    And Nelim's Pickle Tools: a colonist "cj6" of kind "OL_SerenTimelessOne" exists
    And Nelim's Pickle Tools: a colonist "cj7" of kind "OL_SerenCultEscapee" exists
    And Nelim's Pickle Tools: a colonist "cj8" of kind "OL_SerenLoneGenius" exists
    When Nelim's Pickle Tools: "tribe1" has the gene "OL_SpaceBorn"
    And Nelim's Pickle Tools: the camera frames the head of "tribe1" at root size 3
    And Nelim's Pickle Tools: I let 20 frames pass
    And I take a screenshot "ported-tribal"
