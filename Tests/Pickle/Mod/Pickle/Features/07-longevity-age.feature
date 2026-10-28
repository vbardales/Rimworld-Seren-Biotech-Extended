# The Seren longevity gene (OL_SerenLongevity): biological ageing 1 up to 19 years, 0.214 from 20 (Virginie, 2026-10-28). Scenario 1 is the control without the gene: the ageing step itself must move the biological age by the calendar years asked. Scenario 2: 20 years old, the gene, 280 calendar years later the biological age is 20 + 280 * 0.214 = about 79.9.
@review @requires:nelim.pickletools.colonistrace
Feature: Seren longevity

  Scenario: seren-longevity-1: control without the gene, 20 + 40 years
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: a colonist "age1" of kind "OL_SerenColonist" exists
    And Nelim's Pickle Tools: "age1" loses all genes
    And "age1" is 20 years old
    When Nelim's Pickle Tools: "age1" ages by 40 years
    Then Nelim's Pickle Tools: "age1" biological age is above 59 years
    And Nelim's Pickle Tools: "age1" biological age is below 61 years

  Scenario: seren-longevity-2: the gene slows ageing, 20 + 280 years
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: a colonist "age2" of kind "OL_SerenColonist" exists
    And Nelim's Pickle Tools: "age2" loses all genes
    And Nelim's Pickle Tools: "age2" has the gene "OL_SerenLongevity"
    And "age2" is 20 years old
    When Nelim's Pickle Tools: "age2" ages by 280 years
    Then Nelim's Pickle Tools: "age2" biological age is above 79 years
    And Nelim's Pickle Tools: "age2" biological age is below 81 years
