import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:taktikat/feature/model/models/profile/profile_preference.dart';
import 'package:taktikat/feature/view/global_widgets/app_loading.dart';
import 'package:taktikat/feature/view/screens/app/profile/widgets/preferance_parent.dart';
import 'package:taktikat/feature/view_model/home_view_model.dart';
import 'package:taktikat/feature/view_model/profile_view_model.dart';
import 'package:taktikat/utils/localization/string_keys.dart';
import 'package:taktikat/utils/router/routes.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../../../../../model/enums/preferences_types.dart';

class UserPreferenceSection extends StatelessWidget {
  const UserPreferenceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      builder: (_) => _.isLoading
          ? const AppLoading()
          : ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                PreferenceParent(
                  onClicked: (ProfilePreference preferences) async {
                    await onClicked(preferences, _);
                    if (preferences.id != -1) {
                      _.preferenceTeams.removeWhere((element) =>
                          element.model?.name == preferences.model?.name);
                      _.update();
                    }
                  },
                  onAddClicked: () {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      Utils.instance
                          .getController(HomeViewModel())
                          .changeCurrentPage(index: 0);
                    });
                    Get.offNamed(Routes.userPreferences, arguments: true);
                  },
                  preferences: _.preferenceTeams,
                  label: StringKeys.singleton.favoriteTeams.tr,
                ),
                const SizedBox(height: 32),
                PreferenceParent(
                  onClicked: (ProfilePreference preferences) async {
                    await onClicked(preferences, _);
                    if (preferences.id != -1) {
                      _.preferenceChampionship.removeWhere((element) =>
                          element.model?.name == preferences.model?.name);
                      _.update();
                    }
                  },
                  onAddClicked: () {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      Utils.instance
                          .getController(HomeViewModel())
                          .changeCurrentPage(index: 1);
                    });
                    Get.offNamed(Routes.userPreferences, arguments: true);
                  },
                  preferences: _.preferenceChampionship,
                  label: StringKeys.singleton.favoriteChampionships.tr,
                ),
                const SizedBox(height: 32),
                PreferenceParent(
                  onClicked: (ProfilePreference preferences) async {
                    await onClicked(preferences, _);
                    if (preferences.id != -1) {
                      _.preferencePlayers.removeWhere((element) =>
                          element.model?.name == preferences.model?.name);
                      _.update();
                    }
                  },
                  onAddClicked: () {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      Utils.instance
                          .getController(HomeViewModel())
                          .changeCurrentPage(index: 2);
                    });
                    Get.offNamed(Routes.userPreferences, arguments: true);
                  },
                  preferences: _.preferencePlayers,
                  label: StringKeys.singleton.favoritePlayers.tr,
                ),
                const SizedBox(height: 32),
              ],
            ),
    );
  }

  Future<void> onClicked(
      ProfilePreference preferences, ProfileViewModel _) async {
    if (Utils.instance.getController(HomeViewModel()).isLoading) {
      return;
    }

    if (preferences.id == -1) {
      Get.offNamed(Routes.userPreferences, arguments: true);
    } else {
      Logger().e(preferences.toJson());
      await Utils.instance.getController(HomeViewModel()).togglePreferences(
            preferenceType: PreferencesTypesExtension.fromInt(
                preferences.preferenceId ?? 0),
            id: preferences.model?.id ?? 0,
          );
    }
  }
}
