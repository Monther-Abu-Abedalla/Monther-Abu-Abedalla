enum PreferencesTypes {
  team,
  nationalTeam,
  championship,
  league,
  player,
}

extension PreferencesTypesExtension on PreferencesTypes {
  int get value {
    switch (this) {
      case PreferencesTypes.team:
        return 1;
      case PreferencesTypes.nationalTeam:
        return 7;
      case PreferencesTypes.championship:
        return 4;
      case PreferencesTypes.league:
        return 5;
      case PreferencesTypes.player:
        return 6;
    }
  }

  //create a function to get number and return the enum
  static PreferencesTypes fromInt(int value) {
    switch (value) {
      case 1:
        return PreferencesTypes.team;
      case 7:
        return PreferencesTypes.nationalTeam;
      case 4:
        return PreferencesTypes.championship;
      case 5:
        return PreferencesTypes.league;
      case 6:
        return PreferencesTypes.player;
      default:
        return PreferencesTypes.championship;
    }
  }
}
