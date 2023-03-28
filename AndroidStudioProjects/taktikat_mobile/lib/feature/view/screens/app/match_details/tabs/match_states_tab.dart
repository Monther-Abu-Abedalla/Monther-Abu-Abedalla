import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/view_model/match_detail_view_model.dart';

import '../../../../../../utils/localization/string_keys.dart';
import '../../../../../core/theme/color/color_manager.dart';
import '../../../../../model/enums/match_status.dart';
import '../../../../global_widgets/app_loading.dart';
import '../widgets/states_widgets/match_top_stats_section.dart';

class MatchStatesTab extends StatelessWidget {
  const MatchStatesTab({Key? key, required this.logic}) : super(key: key);

  final MatchDetailViewModel logic;

  @override
  Widget build(BuildContext context) {
    if (logic.isLoading) {
      return const AppLoading(isCenter: true);
    }
    if (logic.matchStatistics == null) {
      return Center(
        child: Text(
          StringKeys.singleton.statesNotAvailableForNow.tr,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ColorManager.instance.selectedTabDark,
              ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          const SizedBox(height: 10),
          if (logic.matchDetails?.statusValue ==
                  MatchStatus.matchFinished.value ||
              logic.matchDetails?.isLive == true) ...[
            MatchTopStatsSection(logic: logic, isTopStats: false),
          ] else ...[
            const SizedBox(height: 250),
            Center(
              child: Text(
                StringKeys.singleton.statesNotAvailableForNow.tr,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorManager.instance.selectedTabDark,
                    ),
              ),
            )
          ],
        ],
      ),
    );
  }
}
