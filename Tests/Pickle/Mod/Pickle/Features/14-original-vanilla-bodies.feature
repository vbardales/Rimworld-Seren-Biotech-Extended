# The ORIGINAL Seren mod (HAR race, vanilla bodies, no Realistic Bodies, no Facial Animation): every body mask 0 to 11 on an adult, a child (1 to 8) and a baby (9 to 12), undressed, south, east and north, to see where the original draws each mask on a vanilla body (asked by Virginie, 2026-11-03: restart the masks from the original). Map wsl-deps.seren-original.map. Three masks per scenario (9 shots), the Pickle watchdog stops a scenario after 300 s.
@review @timeout:900 @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.camerazoom
Feature: Original Seren body masks on vanilla adult and child bodies

  Scenario: seren-original-vanilla-1: original Seren adult, masks 0, 1, 2, undressed, south east north
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
    And Nelim's Pickle Tools: "Orig" is undressed
    And Nelim's Pickle Tools: I frame the cell (176, 120) at zoom 2
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 0
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-0-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-0-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-0-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 1
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-1-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-1-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-1-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 2
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-2-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-2-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-2-north"

  Scenario: seren-original-vanilla-2: original Seren adult, masks 3, 4, 5, undressed, south east north
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
    And Nelim's Pickle Tools: "Orig" is undressed
    And Nelim's Pickle Tools: I frame the cell (176, 120) at zoom 2
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 3
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-3-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-3-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-3-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 4
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-4-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-4-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-4-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 5
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-5-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-5-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-5-north"

  Scenario: seren-original-vanilla-3: original Seren adult, masks 6, 7, 8, undressed, south east north
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
    And Nelim's Pickle Tools: "Orig" is undressed
    And Nelim's Pickle Tools: I frame the cell (176, 120) at zoom 2
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 6
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-6-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-6-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-6-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 7
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-7-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-7-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-7-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 8
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-8-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-8-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-8-north"

  Scenario: seren-original-vanilla-4: original Seren adult, masks 9, 10, 11, undressed, south east north
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
    And Nelim's Pickle Tools: "Orig" is undressed
    And Nelim's Pickle Tools: I frame the cell (176, 120) at zoom 2
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 9
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-9-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-9-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-9-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 10
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-10-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-10-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-10-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 11
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-11-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-11-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-adult-mask-11-north"

  Scenario: seren-original-vanilla-5: original Seren child, masks 0, 1, 2, undressed, south east north
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I frame the area centred on (177, 121) at root size 6.5
    And Nelim's Pickle Tools: a colonist "Orig" of kind "SerenRefugee" exists
    And "Orig" is 8 years old
    And Nelim's Pickle Tools: "Orig" body type is Child
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: "Orig" is undressed
    And Nelim's Pickle Tools: I frame the cell (176, 120) at zoom 2
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 0
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-0-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-0-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-0-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 1
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-1-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-1-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-1-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 2
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-2-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-2-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-2-north"

  Scenario: seren-original-vanilla-6: original Seren child, masks 3, 4, 5, undressed, south east north
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I frame the area centred on (177, 121) at root size 6.5
    And Nelim's Pickle Tools: a colonist "Orig" of kind "SerenRefugee" exists
    And "Orig" is 8 years old
    And Nelim's Pickle Tools: "Orig" body type is Child
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: "Orig" is undressed
    And Nelim's Pickle Tools: I frame the cell (176, 120) at zoom 2
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 3
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-3-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-3-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-3-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 4
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-4-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-4-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-4-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 5
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-5-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-5-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-5-north"

  Scenario: seren-original-vanilla-7: original Seren child, masks 6, 7, 8, undressed, south east north
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I frame the area centred on (177, 121) at root size 6.5
    And Nelim's Pickle Tools: a colonist "Orig" of kind "SerenRefugee" exists
    And "Orig" is 8 years old
    And Nelim's Pickle Tools: "Orig" body type is Child
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: "Orig" is undressed
    And Nelim's Pickle Tools: I frame the cell (176, 120) at zoom 2
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 6
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-6-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-6-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-6-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 7
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-7-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-7-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-7-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 8
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-8-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-8-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-8-north"

  Scenario: seren-original-vanilla-8: original Seren child, masks 9, 10, 11, undressed, south east north
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I frame the area centred on (177, 121) at root size 6.5
    And Nelim's Pickle Tools: a colonist "Orig" of kind "SerenRefugee" exists
    And "Orig" is 8 years old
    And Nelim's Pickle Tools: "Orig" body type is Child
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: "Orig" is undressed
    And Nelim's Pickle Tools: I frame the cell (176, 120) at zoom 2
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 9
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-9-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-9-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-9-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 10
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-10-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-10-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-10-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 11
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-11-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-11-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-child-mask-11-north"

  Scenario: seren-original-vanilla-9: original Seren baby, masks 0, 1, 2, undressed, south east north
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I frame the area centred on (177, 121) at root size 6.5
    And Nelim's Pickle Tools: a colonist "Orig" of kind "SerenRefugee" exists
    And "Orig" is 1 years old
    And Nelim's Pickle Tools: "Orig" body type is Baby
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: "Orig" is undressed
    And Nelim's Pickle Tools: I frame the cell (176, 120) at zoom 2
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 0
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-0-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-0-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-0-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 1
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-1-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-1-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-1-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 2
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-2-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-2-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-2-north"

  Scenario: seren-original-vanilla-10: original Seren baby, masks 3, 4, 5, undressed, south east north
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I frame the area centred on (177, 121) at root size 6.5
    And Nelim's Pickle Tools: a colonist "Orig" of kind "SerenRefugee" exists
    And "Orig" is 1 years old
    And Nelim's Pickle Tools: "Orig" body type is Baby
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: "Orig" is undressed
    And Nelim's Pickle Tools: I frame the cell (176, 120) at zoom 2
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 3
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-3-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-3-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-3-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 4
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-4-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-4-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-4-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 5
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-5-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-5-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-5-north"

  Scenario: seren-original-vanilla-11: original Seren baby, masks 6, 7, 8, undressed, south east north
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I frame the area centred on (177, 121) at root size 6.5
    And Nelim's Pickle Tools: a colonist "Orig" of kind "SerenRefugee" exists
    And "Orig" is 1 years old
    And Nelim's Pickle Tools: "Orig" body type is Baby
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: "Orig" is undressed
    And Nelim's Pickle Tools: I frame the cell (176, 120) at zoom 2
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 6
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-6-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-6-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-6-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 7
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-7-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-7-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-7-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 8
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-8-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-8-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-8-north"

  Scenario: seren-original-vanilla-12: original Seren baby, masks 9, 10, 11, undressed, south east north
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the item and name labels are hidden
    And Nelim's Pickle Tools: the tooltips are hidden
    And Nelim's Pickle Tools: the colonist bar is hidden
    And Nelim's Pickle Tools: the learning helper is hidden
    And Nelim's Pickle Tools: the temperature of the map is 20 degrees
    And Nelim's Pickle Tools: I frame the area centred on (177, 121) at root size 6.5
    And Nelim's Pickle Tools: a colonist "Orig" of kind "SerenRefugee" exists
    And "Orig" is 1 years old
    And Nelim's Pickle Tools: "Orig" body type is Baby
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: the other colonists are out of frame
    And Nelim's Pickle Tools: "Orig" is undressed
    And Nelim's Pickle Tools: I frame the cell (176, 120) at zoom 2
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 9
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-9-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-9-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-9-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 10
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-10-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-10-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-10-north"
    When Nelim's Pickle Tools: "Orig" alien body mask variant is 11
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing South
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-11-south"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing East
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-11-east"
    And Nelim's Pickle Tools: "Orig" stands at (176, 120) facing North
    And Nelim's Pickle Tools: I let 5 frames pass
    And I take a screenshot "orig-baby-mask-11-north"

