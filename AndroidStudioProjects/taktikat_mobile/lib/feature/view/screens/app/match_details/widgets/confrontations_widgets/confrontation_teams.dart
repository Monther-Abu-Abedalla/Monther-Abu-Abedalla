import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../utils/localization/string_keys.dart';
import '../../../../../../core/theme/color/color_manager.dart';
import '../../../../../../view_model/match_detail_view_model.dart';
import 'confrontation_away_team.dart';
import 'confrontation_home_team.dart';

class ConfrontationTeams extends StatelessWidget {
  const ConfrontationTeams({Key? key, required this.logic}) : super(key: key);

  final MatchDetailViewModel logic;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(child: ConfrontationHomeTeam(logic: logic)),
          const VerticalDivider(
            indent: 12,
            endIndent: 12,
            thickness: 2,
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              Text(
                StringKeys.singleton.draw.tr,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorManager.instance.dashColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 14),
              Text(
                logic.matchConfrontations?.statistics?.draws.toString() ?? '',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorManager.instance.dashColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          const VerticalDivider(
            indent: 12,
            endIndent: 12,
            thickness: 2,
          ),
          Expanded(child: ConfrontationAwayTeam(logic: logic)),
        ],
      ),
    );
  }
}
