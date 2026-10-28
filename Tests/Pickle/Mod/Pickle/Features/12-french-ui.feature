# The French texts of the mod, read from the loaded defs and keys, in the game language: this file is played only with -Language French and -Filter seren-french (in English every scenario fails by design) (the expected texts are French; Virginie validated them 2026-10-28, FRENCH_REVIEW.md). Steps: DefFieldSteps (def field is) and LoadAudit (translation of the key reads, commit after d8608fe of PickleTools, compiled, not played). The face-set option label stays English (engine limit, MOD_SETTINGS.md): not read here. The creepjoiner letters in French are 11-creepjoiner-letters.feature played with the same -Language French.
@requires:nelim.pickletools.deffields @requires:nelim.pickletools.loadaudit
Feature: Seren French texts

  Scenario: seren-french-1: gene labels and descriptions
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    Then Nelim's Pickle Tools: def "SerenAccent_Pearl" of type "GeneDef" field "label" is "accent perle"
    And Nelim's Pickle Tools: def "SerenOriginalHorns_0" of type "GeneDef" field "label" is "cornes d'origine 0"
    And Nelim's Pickle Tools: def "SerenOriginalMask_0" of type "GeneDef" field "label" is "masque corporel d'origine 0"
    And Nelim's Pickle Tools: def "SerenOriginalMask_0" of type "GeneDef" field "description" is "Les colons qui portent ce gène arborent le masque corporel 0 du mod Seren d'origine."

  Scenario: seren-french-2: main button label and description
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    Then Nelim's Pickle Tools: def "SerenBiotechExtended_Settings" of type "MainButtonDef" field "label" is "Seren Biotech"
    And Nelim's Pickle Tools: def "SerenBiotechExtended_Settings" of type "MainButtonDef" field "description" is "Ouvrir les options de Seren Biotech Extended."

  Scenario: seren-french-3: the no-page message is translated, not a raw key
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    Then Nelim's Pickle Tools: the translation of the key "SerenBiotechExtended_NoSettingsPage" reads "n'a aucune option à afficher pour le moment"
