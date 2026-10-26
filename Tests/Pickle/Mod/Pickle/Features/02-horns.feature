# Photographs of the ported Seren head horns (styles 0 to 7) on Nelim, bald, front; styles 1 and 3 from behind too; then the fork's own Back sensors for comparison.
@review
Feature: Seren original horns

  Scenario: seren-original-horns-1: horns 0 to 7, front
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
    And Nelim's Pickle Tools: I frame the cell (176, 120) at zoom 2
    And Nelim's Pickle Tools: "Nelim" skin colour is rgb (50, 90, 190)
    When Nelim's Pickle Tools: "Nelim" loses all genes
    And Nelim's Pickle Tools: "Nelim" has the gene "SerenOriginalHorns_0"
    And Nelim's Pickle Tools: "Nelim" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orighorn-0-front"
    When Nelim's Pickle Tools: "Nelim" loses all genes
    And Nelim's Pickle Tools: "Nelim" has the gene "SerenOriginalHorns_1"
    And Nelim's Pickle Tools: "Nelim" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orighorn-1-front"
    When Nelim's Pickle Tools: "Nelim" loses all genes
    And Nelim's Pickle Tools: "Nelim" has the gene "SerenOriginalHorns_2"
    And Nelim's Pickle Tools: "Nelim" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orighorn-2-front"
    When Nelim's Pickle Tools: "Nelim" loses all genes
    And Nelim's Pickle Tools: "Nelim" has the gene "SerenOriginalHorns_3"
    And Nelim's Pickle Tools: "Nelim" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orighorn-3-front"
    When Nelim's Pickle Tools: "Nelim" loses all genes
    And Nelim's Pickle Tools: "Nelim" has the gene "SerenOriginalHorns_4"
    And Nelim's Pickle Tools: "Nelim" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orighorn-4-front"
    When Nelim's Pickle Tools: "Nelim" loses all genes
    And Nelim's Pickle Tools: "Nelim" has the gene "SerenOriginalHorns_5"
    And Nelim's Pickle Tools: "Nelim" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orighorn-5-front"
    When Nelim's Pickle Tools: "Nelim" loses all genes
    And Nelim's Pickle Tools: "Nelim" has the gene "SerenOriginalHorns_6"
    And Nelim's Pickle Tools: "Nelim" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orighorn-6-front"
    When Nelim's Pickle Tools: "Nelim" loses all genes
    And Nelim's Pickle Tools: "Nelim" has the gene "SerenOriginalHorns_7"
    And Nelim's Pickle Tools: "Nelim" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orighorn-7-front"
    When Nelim's Pickle Tools: "Nelim" loses all genes
    And Nelim's Pickle Tools: "Nelim" has the gene "SerenOriginalHorns_1"
    And Nelim's Pickle Tools: "Nelim" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orighorn-1-back"
    When Nelim's Pickle Tools: "Nelim" loses all genes
    And Nelim's Pickle Tools: "Nelim" has the gene "SerenOriginalHorns_3"
    And Nelim's Pickle Tools: "Nelim" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orighorn-3-back"
    When Nelim's Pickle Tools: "Nelim" loses all genes
    And Nelim's Pickle Tools: "Nelim" has the gene "SerenSensors_Back"
    And Nelim's Pickle Tools: "Nelim" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orighorn-fork-back-front"
