# The hidden MainButtons shortcut to the options of the mod (MainButtonDef SerenBiotechExtended_Settings): hidden by default, revealed the way RIMMSQOL does, then it opens the options page (which exists only with Facial Animation Experimentals, staged by the map).
@review @requires:MalteSchulze.RIMMSqol @requires:nelim.pickletools.rimmsqol @requires:nelim.pickletools.screenshotstudio
Feature: Seren options shortcut

  Scenario: seren-shortcut-1: hidden by default
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And RIMMSQOL is ready to be driven
    Then RIMMSQOL's own list of main buttons offers "SerenBiotechExtended_Settings"
    And RIMMSQOL holds no choice for the main button "SerenBiotechExtended_Settings"
    And RIMMSQOL shows the main button "SerenBiotechExtended_Settings" as hidden
    And the main bar does not draw the button "SerenBiotechExtended_Settings"

  Scenario: seren-shortcut-2: revealed by RIMMSQOL, it opens the options
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And RIMMSQOL is ready to be driven
    When RIMMSQOL reveals the main button "SerenBiotechExtended_Settings"
    Then the main bar draws the button "SerenBiotechExtended_Settings"
    And RIMMSQOL's settings file records the main button "SerenBiotechExtended_Settings" as visible
    When the main bar's button "SerenBiotechExtended_Settings" is activated
    And Nelim's Pickle Tools: I let 20 frames pass
    Then I take a screenshot "seren-options-page"
