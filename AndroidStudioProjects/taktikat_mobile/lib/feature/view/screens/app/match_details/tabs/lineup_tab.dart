import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';
import 'package:taktikat/feature/view/screens/app/match_details/widgets/bench_section/bench_section.dart';
import 'package:taktikat/utils/localization/string_keys.dart';

import '../../../../../model/enums/lineup_types.dart';
import '../../../../../view_model/match_detail_view_model.dart';
import '../../../../global_widgets/app_loading.dart';
import '../widgets/line_up_widgets/formation_widget.dart';

class LineUpTab extends StatelessWidget {
  const LineUpTab({
    Key? key,
    required this.logic,
  }) : super(key: key);

  final MatchDetailViewModel logic;

  @override
  Widget build(BuildContext context) {
    if (logic.isLineUpLoading) {
      return const AppLoading(isCenter: true);
    }
    if (logic.lineup == null) {
      return Center(
        child: Text(
          StringKeys.singleton.linUpNotAvailableForNow.tr,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ColorManager.instance.selectedTabDark,
              ),
        ),
      );
    }
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        const SizedBox(height: 30, width: double.infinity),
        if (logic.lineup != null) ...[
          if (logic.selectedTeamLineup == LineupTypes.away) ...[
            Lineup(
              isHomeTeam: false,
              lineup: logic.lineup?.away?.lineup ?? [],
              plan: logic.lineup?.away?.formation ?? '',
              awayFormation: logic.lineup?.away?.formation ?? '',
              awayTeamLogo: logic.lineup?.away?.team?.logo ?? '',
              homeFormation: logic.lineup?.home?.formation ?? '',
              homeTeamLogo: logic.lineup?.home?.team?.logo ?? '',
            ),
            const SizedBox(height: 20),
            BenchSection(
              logic: logic,
              home: logic.lineup?.away,
            ),
          ] else ...[
            Lineup(
              isHomeTeam: true,
              lineup: logic.lineup?.home?.lineup ?? [],
              plan: logic.lineup?.home?.formation ?? '',
              homeFormation: logic.lineup?.home?.formation ?? '',
              homeTeamLogo: logic.lineup?.home?.team?.logo ?? '',
              awayFormation: logic.lineup?.away?.formation ?? '',
              awayTeamLogo: logic.lineup?.away?.team?.logo ?? '',
            ),
            const SizedBox(height: 20),
            BenchSection(
              logic: logic,
              home: logic.lineup?.home,
            ),
          ],
        ],
        const SizedBox(height: 40),
      ],
    );
  }
}
