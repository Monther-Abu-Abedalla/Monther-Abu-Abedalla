import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/feature/view_model/match_detail_view_model.dart';
import 'package:taktikat/utils/router/routes.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../../../../../model/models/match/general_matches_model.dart';
import 'league_title.dart';
import 'match_item.dart';

class LeagueMatchesItem extends StatelessWidget {
  const LeagueMatchesItem({super.key, required this.matches});

  final List<GeneralMatchesModel> matches;

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
                LeagueTitle(
                  title: Utils.instance.isArabic()
                      ? matches[index].leagueValues?.nameValues?.ar
                      : matches[index].leagueValues?.nameValues?.en,
                  logo: matches[index].leagueImage,
                ),
                MatchItem(
                  matches: matches[index].matches ?? [],
                  onClick: (match) {
                    Utils.instance
                        .getController(MatchDetailViewModel())
                        .checkIfMatchFinished(match);

                    Get.toNamed(
                      Routes.matchDetails,
                      arguments: match.id,
                      parameters: {
                        'match': '${match.id}',
                      },
                    );
                  },
                ),
                const SizedBox(height: 8)
              ],
            );
          }),
    );
  }
}
