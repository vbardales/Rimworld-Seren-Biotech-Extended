# The face set of Seren, with Facial Animation Experimentals and Vanilla Textures Expanded Facial Animation both active. Run once with the setting off (Experimentals, the fork default) and once with it on (VTE): the same markings, two looks.
@review
Feature: Seren face set

  Scenario: seren-face-set-1: faces with markings
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I frame the area centred on (177, 121) at root size 6.5
    And Nelim's Pickle Tools: "Nelim" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: "Nelim" hairstyle is "Bald"
    And Nelim's Pickle Tools: "Nelim" face tattoo is "none"
    And Nelim's Pickle Tools: "Nelim" mouth is "MouthNormal"
    And Nelim's Pickle Tools: "Nelim" brows are "BrowNormal"
    And Nelim's Pickle Tools: "Nelim" lids are "LidNormal"
    And Nelim's Pickle Tools: "Nelim" face skin is "SkinNormal"
    And Nelim's Pickle Tools: "Nelim" eyeballs are "EyeNormal"
    And Nelim's Pickle Tools: "Nelim" face head shape is "HeadNormal"
    And Nelim's Pickle Tools: "Nelim" facial expression is "normal"
    And Nelim's Pickle Tools: "Nelim" face is held neutral
    And Nelim's Pickle Tools: I frame the cell (176, 120) at zoom 5
    And Nelim's Pickle Tools: "Nelim" skin colour is rgb (50, 90, 190)
    When Nelim's Pickle Tools: "Nelim" loses all genes
    And Nelim's Pickle Tools: "Nelim" has the gene "OL_SerenEyes"
    And Nelim's Pickle Tools: "Nelim" has the gene "SerenMarkings_Big"
    And Nelim's Pickle Tools: "Nelim" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 20 frames pass
    And I take a screenshot "faceset-Big"
    When Nelim's Pickle Tools: "Nelim" loses all genes
    And Nelim's Pickle Tools: "Nelim" has the gene "OL_SerenEyes"
    And Nelim's Pickle Tools: "Nelim" has the gene "SerenMarkings_Cheeks"
    And Nelim's Pickle Tools: "Nelim" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 20 frames pass
    And I take a screenshot "faceset-Cheeks"
    When Nelim's Pickle Tools: "Nelim" loses all genes
    And Nelim's Pickle Tools: "Nelim" has the gene "OL_SerenEyes"
    And Nelim's Pickle Tools: "Nelim" has the gene "SerenMarkings_Tristar"
    And Nelim's Pickle Tools: "Nelim" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 20 frames pass
    And I take a screenshot "faceset-Tristar"
