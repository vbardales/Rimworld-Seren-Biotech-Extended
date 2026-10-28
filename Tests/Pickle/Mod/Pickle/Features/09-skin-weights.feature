# The skin colour of new Seren pawns follows the weights of the original mod (13 colours, total 82: Albino 1, Planetary 1, Twilight 2, Nebula 2 ... Cobalt 10), not one chance in thirteen each (7.7 percent). 200 pawns generated: the rare colours must stay rare. Albino expected 1.2 percent (a uniform draw gives 7.7 and fails the upper bound of 4 percent), Planetary 1.2, Twilight 2.4.
@requires:nelim.pickletools.colonistrace
Feature: Seren skin weights

  Scenario: seren-skin-weights-1: the rare skin colours stay rare
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: 200 pawns of kind "OL_SerenColonist" are generated
    Then Nelim's Pickle Tools: the genes with the prefix "OL_Skin" of the generated pawns are counted
    And Nelim's Pickle Tools: the share of the generated pawns holding the gene "OL_SkinAlbino" is between 0 and 4 percent
    And Nelim's Pickle Tools: the share of the generated pawns holding the gene "OL_SkinPlanetary" is between 0 and 4 percent
    And Nelim's Pickle Tools: the share of the generated pawns holding the gene "OL_SkinTwilight" is between 0 and 7 percent
