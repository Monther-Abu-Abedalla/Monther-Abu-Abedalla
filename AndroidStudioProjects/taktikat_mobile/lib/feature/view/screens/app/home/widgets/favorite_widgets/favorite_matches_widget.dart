import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/utils/router/routes.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../../../../../../model/enums/preferences_types.dart';
import '../../../../../../model/models/match/general_matches_model.dart';
import 'favorite_league_title.dart';
import 'favorite_match_item.dart';

class FavoriteMatchesWidget extends StatelessWidget {
  const FavoriteMatchesWidget({
    super.key,
    required this.matches,
    required this.preferencesTypes,
    this.isSwappable = false,
    this.isLeagueTitleSwappable = false,
  });

  final List<GeneralMatchesModel> matches;
  final bool isSwappable;
  final bool isLeagueTitleSwappable;
  final PreferencesTypes preferencesTypes;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(AppSize.r10),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: matches.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                FavoriteLeagueTitle(
                  competitionId: matches[index].leagueId,
                  title: Utils.instance.isArabic()
                      ? matches[index].leagueValues?.nameValues?.ar
                      : matches[index].leagueValues?.nameValues?.en,
                  logo: matches[index].leagueImage,
                  isSwappable: isLeagueTitleSwappable,
                  preferencesTypes: preferencesTypes,
                ),
                FavoriteMatchItem(
                  isSwappable: isSwappable,
                  preferencesTypes: preferencesTypes,
                  matches: matches[index].matches ?? [],
                  onClick: (match) {
                    Get.toNamed(Routes.matchDetails, arguments: match.id);
                  },
                ),
                const SizedBox(height: 8)
              ],
            );
          }),
    );
  }
}
