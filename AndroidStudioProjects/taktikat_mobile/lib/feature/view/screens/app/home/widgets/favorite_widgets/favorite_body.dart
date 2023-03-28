import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_font_size.dart';
import 'package:taktikat/feature/view_model/match_view_model.dart';
import 'package:taktikat/utils/localization/string_keys.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../../../../../../model/enums/preferences_types.dart';
import 'favorite_matches_widget.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchViewModel>(
      builder: (matchLogic) {
        return ListView(
          shrinkWrap: true,
          physics: Utils.instance.getAppScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            if (matchLogic.favoriteMatches.matches.isNotEmpty) ...[
              title(StringKeys.singleton.favoriteMatches.tr),
              FavoriteMatchesWidget(
                isLeagueTitleSwappable: false,
                isSwappable: true,
                matches: matchLogic.favoriteMatches.matches,
                preferencesTypes: PreferencesTypes.player,
              ),
              const SizedBox(height: 10),
            ],
            if (matchLogic.favoriteMatches.teams.isNotEmpty) ...[
              title(StringKeys.singleton.favoriteTeams.tr),
              const SizedBox(height: 10),
              FavoriteMatchesWidget(
                isLeagueTitleSwappable: false,
                isSwappable: true,
                matches: matchLogic.favoriteMatches.teams,
                preferencesTypes: PreferencesTypes.team,
              ),
            ],
            if (matchLogic.favoriteMatches.championships.isNotEmpty) ...[
              const SizedBox(height: 10),
              title(StringKeys.singleton.favoriteChampionships.tr),
              const SizedBox(height: 10),
              FavoriteMatchesWidget(
                isLeagueTitleSwappable: true,
                isSwappable: false,
                matches: matchLogic.favoriteMatches.championships,
                preferencesTypes: PreferencesTypes.championship,
              ),
            ],
            if (matchLogic.favoriteMatches.leagues.isNotEmpty) ...[
              const SizedBox(height: 10),
              title(StringKeys.singleton.favoriteLeagues.tr),
              const SizedBox(height: 10),
              FavoriteMatchesWidget(
                isLeagueTitleSwappable: true,
                isSwappable: false,
                matches: matchLogic.favoriteMatches.leagues,
                preferencesTypes: PreferencesTypes.league,
              ),
            ],
          ],
        );
      },
    );
  }

  Widget title(String title) => Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            title,
            style: Theme.of(Get.context!).textTheme.bodySmall?.copyWith(
                  fontSize: FontSize.fontSize14,
                  color: Theme.of(Get.context!).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      );
}
