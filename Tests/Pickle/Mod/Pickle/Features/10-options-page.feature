# The Mod options page of Seren Biotech Extended (page of Mod Settings Framework, one checkbox SerenFaceSetVTE, default off, cold loading so a restart applies it). Steps from PickleTools ColonistRace (commit d8608fe, compiled, not played): the page is found by the handle named after the mod, the option by member name in the handle settings (NPT guess: if no member matches the failure lists them, send it to NPT), the settings file is read from disk.
# Scenarios 1 to 3 run with wsl-deps.masks.map (Facial Animation Experimentals active, so the page exists). Scenario 5 runs with wsl-deps.nofa.map (no Facial Animation staged: no page, no empty entry), played alone with -Filter.
# Scenarios 2, 3 and 4 are one restart chain (-Then, one hold of the lock): 2 writes the choice, 3 reads it in another process and puts it back, 4 reads the default back.
@review
Feature: Seren options page

  Scenario: seren-options-1: the page exists, the box is off by default
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    Then Nelim's Pickle Tools: the mod options page of the mod "nelim.serenbiotechextended" exists
    And Nelim's Pickle Tools: the option "SerenFaceSetVTE" of the mod "nelim.serenbiotechextended" is "False"
    When Nelim's Pickle Tools: I open the mod options page of the mod "nelim.serenbiotechextended"
    And Nelim's Pickle Tools: I let 20 frames pass
    Then I take a screenshot "seren-options-default"
    When Nelim's Pickle Tools: I close the mod options window

  Scenario: seren-options-2: ticking the box is kept, writer of the restart chain
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    When Nelim's Pickle Tools: I open the mod options page of the mod "nelim.serenbiotechextended"
    And Nelim's Pickle Tools: I set the option "SerenFaceSetVTE" of the mod "nelim.serenbiotechextended" to "True"
    And Nelim's Pickle Tools: I let 20 frames pass
    Then I take a screenshot "seren-options-ticked"
    When Nelim's Pickle Tools: I close the mod options window
    And Nelim's Pickle Tools: I open the mod options page of the mod "nelim.serenbiotechextended"
    Then Nelim's Pickle Tools: the option "SerenFaceSetVTE" of the mod "nelim.serenbiotechextended" is "True"
    And Nelim's Pickle Tools: the settings file of the mod "nelim.serenbiotechextended" holds "SerenFaceSetVTE" as "True"
    When Nelim's Pickle Tools: I close the mod options window

  Scenario: seren-options-3: after a restart the box is still on, then it is put back, reader of the restart chain
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    Then Nelim's Pickle Tools: the option "SerenFaceSetVTE" of the mod "nelim.serenbiotechextended" is "True"
    And Nelim's Pickle Tools: the settings file of the mod "nelim.serenbiotechextended" holds "SerenFaceSetVTE" as "True"
    When Nelim's Pickle Tools: I open the mod options page of the mod "nelim.serenbiotechextended"
    And Nelim's Pickle Tools: I set the option "SerenFaceSetVTE" of the mod "nelim.serenbiotechextended" to "False"
    And Nelim's Pickle Tools: I close the mod options window
    Then Nelim's Pickle Tools: the settings file of the mod "nelim.serenbiotechextended" holds "SerenFaceSetVTE" as "False"

  Scenario: seren-options-4: after a second restart the box is off again, last of the restart chain
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    Then Nelim's Pickle Tools: the option "SerenFaceSetVTE" of the mod "nelim.serenbiotechextended" is "False"
    And Nelim's Pickle Tools: the settings file of the mod "nelim.serenbiotechextended" holds "SerenFaceSetVTE" as "False"

  Scenario: seren-options-5: without Facial Animation there is no page and no empty entry
    Given the save "test-colony" is loaded
    And game speed is paused
    Then Nelim's Pickle Tools: the mod options page of the mod "nelim.serenbiotechextended" does not exist
