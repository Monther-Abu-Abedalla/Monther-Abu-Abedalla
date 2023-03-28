import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/utils/localization/string_keys.dart';

import '../../../../../../core/theme/color/color_manager.dart';
import '../../../../../../core/theme/size/app_size.dart';
import '../../../../../../view_model/match_detail_view_model.dart';
import 'confrontation_item.dart';
import 'confrontation_teams.dart';

class Confrontations extends StatelessWidget {
  const Confrontations({Key? key, required this.logic}) : super(key: key);

  final MatchDetailViewModel logic;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(AppSize.r8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            color: ColorManager.instance.hintColor,
            borderRadius: BorderRadius.circular(AppSize.r8),
            child: InkWell(
              borderRadius: BorderRadius.circular(AppSize.r8),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: Text(
                  StringKeys.singleton.confrontations.tr,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorManager.instance.dashColor,
                      ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ConfrontationTeams(logic: logic),
          const SizedBox(height: 20),
          ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemCount: logic.matchConfrontations?.h2HComing?.length ?? 0,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return ConfrontationItem(
                  match: logic.matchConfrontations?.h2HComing?[index],
                  homeTeamID: logic.matchConfrontations?.homeTeam?.id,
                  isMatchComing: true,
                );
              }),
          const Divider(),
          ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemCount: (logic.matchConfrontations?.h2HEnded?.length ?? 0) >= 2
                  ? 2
                  : logic.matchConfrontations?.h2HEnded?.length ?? 0,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return ConfrontationItem(
                  match: logic.matchConfrontations?.h2HEnded?[index],
                  homeTeamID: logic.matchConfrontations?.homeTeam?.id,
                  isMatchComing: false,
                );
              }),
        ],
      ),
    );
  }
}
