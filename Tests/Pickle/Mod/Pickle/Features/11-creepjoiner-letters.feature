# The letters of the eight Seren creepjoiner forms (Anomaly) through the real arrival quest, in the game language (English by default; French by the same file played with -Language French, scenario 13 of TEST_SCENARIOS.md). Steps from PickleTools ColonistRace (commit d8608fe, compiled, not played): the quest is picked by name (a QuestScriptDef holding creepjoiner and arrival; the failure lists the candidates, send it to NPT).
# One scenario per form: the arrival, then the letter read for a pawn made male, female and without gender, each time fully resolved (no raw key, no PAWN_ token, no braces). Words are checked only where the French agrees with the gender (scenario 13 adds them after the first French reading).
@review
Feature: Seren creepjoiner letters

  Scenario: seren-letter-LeatheryStranger: the letter reads right for three genders
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    When Nelim's Pickle Tools: I trigger the creepjoiner arrival of the kind "OL_SerenLeatheryStranger"
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made Male and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made Female and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made None and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved

  Scenario: seren-letter-DarkScholar: the letter reads right for three genders
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    When Nelim's Pickle Tools: I trigger the creepjoiner arrival of the kind "OL_SerenDarkScholar"
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made Male and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made Female and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made None and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved

  Scenario: seren-letter-DealMaker: the letter reads right for three genders
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    When Nelim's Pickle Tools: I trigger the creepjoiner arrival of the kind "OL_SerenDealMaker"
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made Male and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made Female and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made None and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved

  Scenario: seren-letter-CreepDrifter: the letter reads right for three genders
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    When Nelim's Pickle Tools: I trigger the creepjoiner arrival of the kind "OL_SerenCreepDrifter"
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made Male and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made Female and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made None and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved

  Scenario: seren-letter-Blindhealer: the letter reads right for three genders
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    When Nelim's Pickle Tools: I trigger the creepjoiner arrival of the kind "OL_SerenBlindhealer"
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made Male and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made Female and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made None and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved

  Scenario: seren-letter-TimelessOne: the letter reads right for three genders
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    When Nelim's Pickle Tools: I trigger the creepjoiner arrival of the kind "OL_SerenTimelessOne"
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made Male and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made Female and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made None and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved

  Scenario: seren-letter-CultEscapee: the letter reads right for three genders
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    When Nelim's Pickle Tools: I trigger the creepjoiner arrival of the kind "OL_SerenCultEscapee"
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made Male and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made Female and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made None and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved

  Scenario: seren-letter-LoneGenius: the letter reads right for three genders
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    When Nelim's Pickle Tools: I trigger the creepjoiner arrival of the kind "OL_SerenLoneGenius"
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made Male and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made Female and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
    When Nelim's Pickle Tools: the arrived creepjoiner is made None and the letter is read again
    Then Nelim's Pickle Tools: the creepjoiner letter is fully resolved
