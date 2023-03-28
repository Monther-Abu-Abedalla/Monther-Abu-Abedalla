import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../network/feature/profile_feature.dart';
import '../../utils/shared/shared_prefs.dart';
import '../model/enums/preferences_types.dart';
import '../model/models/auth/user.dart';
import '../model/models/profile/profile_preference.dart';

class MainViewModel extends GetxController {
  bool isLoading = false;
  void startLoading() {
    isLoading = true;
    update();
  }

  void stopLoading() {
    isLoading = false;
    update();
  }

  List<ProfilePreference> profilePreference = [];
  List<ProfilePreference> preferenceTeams = [];
  List<ProfilePreference> preferencePlayers = [];
  List<ProfilePreference> preferenceChampionship = [];

  Future<void> getProfile({
    bool isHaveLoading = true,
  }) async {
    try {
      if (isHaveLoading) {
        startLoading();
      }
      startLoading();
      final response = await ProfileFeature.instance.getProfile();
      final Map<String, dynamic> responseDate = response.data;
     final User user = User.fromJson(response.data);
     final List data = responseDate['customer_preference'];
      profilePreference =
          data.map((e) => ProfilePreference.fromJson(e)).toList();
      SharedPrefs.instance.setUserData(user: user);

      preferenceTeams = profilePreference
          .where((element) =>
              element.preferenceId == PreferencesTypes.team.value ||
              element.preferenceId == PreferencesTypes.nationalTeam.value)
          .toList();
      preferencePlayers = profilePreference
          .where((element) =>
              element.preferenceId == PreferencesTypes.player.value)
          .toList();
      preferenceChampionship = profilePreference
          .where((element) =>
              element.preferenceId == PreferencesTypes.championship.value ||
              element.preferenceId == PreferencesTypes.league.value)
          .toList();

      if (preferenceTeams.length >= 7) {
        // preferenceTeams.add(ProfilePreference(id: -2));
        preferenceTeams.add(ProfilePreference(id: -1));
      } else {
        preferenceTeams.add(ProfilePreference(id: -1));
      }
      if (preferencePlayers.length >= 7) {
        // preferencePlayers.add(ProfilePreference(id: -2));
        preferencePlayers.add(ProfilePreference(id: -1));
      } else {
        preferencePlayers.add(ProfilePreference(id: -1));
      }
      if (preferenceChampionship.length >= 7) {
        // preferenceChampionship.add(ProfilePreference(id: -2));
        preferenceChampionship.add(ProfilePreference(id: -1));
      } else {
        preferenceChampionship.add(ProfilePreference(id: -1));
      }
      update();
    } catch (e) {
      Logger().e(e);
    } finally {
      stopLoading();
    }
  }

  List<ProfilePreference>? userPreferencesSelectedLists(int index) {
    switch (index) {
      case 0:
        return preferenceTeams;
      case 1:
        return preferenceChampionship;
      case 2:
        return preferencePlayers;
      case 3:
        return [];
      default:
        return preferenceTeams;
    }
  }
}
