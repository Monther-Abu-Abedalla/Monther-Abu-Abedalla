import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/model/shared_models.dart';
import 'package:taktikat/utils/localization/string_keys.dart';

import '../../../../../../core/theme/size/app_size.dart';
import '../../../../../../model/enums/stats_keys.dart';
import '../../../../../../view_model/match_detail_view_model.dart';
import '../../../../../global_widgets/custom_tabs.dart';
import 'game_info_box.dart';

class LiveMatchEventsSection extends StatelessWidget {
  const LiveMatchEventsSection({Key? key, required this.statistics})
      : super(key: key);

  final List<Stats>? statistics;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchDetailViewModel>(builder: (logic) {
      final Stats? totalShots = statistics?.firstWhereOrNull(
          (element) => element.key == StatsKeys.totalShots.value);
      final Stats? shotsOnTarget = statistics?.firstWhereOrNull(
          (element) => element.key == StatsKeys.shotsOnTarget.value);
      final Stats? bigChances = statistics?.firstWhereOrNull(
          (element) => element.key == StatsKeys.bigChances.value);
      final Stats? missedGoals = statistics?.firstWhereOrNull(
          (element) => element.key == StatsKeys.missedGoals.value);
      final Stats? accuratePasses = statistics?.firstWhereOrNull(
          (element) => element.key == StatsKeys.accuratePasses.value);
      final Stats? fouls = statistics
          ?.firstWhereOrNull((element) => element.key == StatsKeys.fouls.value);
      final Stats? corners = statistics?.firstWhereOrNull(
          (element) => element.key == StatsKeys.corners.value);
      final Stats? offsides = statistics?.firstWhereOrNull(
          (element) => element.key == StatsKeys.offsides.value);
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(AppSize.r8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Material(
            //   color: ColorManager.instance.hintColor,
            //   borderRadius: BorderRadius.circular(AppSize.r8),
            //   child: InkWell(
            //     borderRadius: BorderRadius.circular(AppSize.r8),
            //     onTap: () {},
            //     child: Padding(
            //       padding: const EdgeInsets.symmetric(
            //         horizontal: 8.0,
            //         vertical: 4,
            //       ),
            //       child: Text(
            //         'Game Info',
            //         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            //               fontWeight: FontWeight.bold,
            //               color: ColorManager.instance.dashColor,
            //             ),
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 15),
            const CustomTabs(),
            const SizedBox(height: 20),
            GameInfoBox(
                title: StringKeys.singleton.totalShots.tr,
                isHome: logic.isHome,
                states: totalShots),
            const SizedBox(height: 10),
            GameInfoBox(
                title: StringKeys.singleton.shotsOnTarget.tr,
                isHome: logic.isHome,
                states: shotsOnTarget),
            const SizedBox(height: 10),
            GameInfoBox(
                title: StringKeys.singleton.bigChances.tr,
                isHome: logic.isHome,
                states: bigChances),
            const SizedBox(height: 10),
            GameInfoBox(
                title: StringKeys.singleton.missedGoals.tr,
                isHome: logic.isHome,
                states: missedGoals),
            const SizedBox(height: 10),
            GameInfoBox(
                title: StringKeys.singleton.accuratePasses.tr,
                isHome: logic.isHome,
                states: accuratePasses),
            const SizedBox(height: 10),
            GameInfoBox(
                title: StringKeys.singleton.fouls.tr,
                isHome: logic.isHome,
                states: fouls),

            const SizedBox(height: 10),
            GameInfoBox(
                title: StringKeys.singleton.corners.tr,
                isHome: logic.isHome,
                states: corners),
            const SizedBox(height: 10),
            GameInfoBox(
                title: StringKeys.singleton.offsides.tr,
                isHome: logic.isHome,
                states: offsides),
            const SizedBox(height: 10),
          ],
        ),
      );
    });
  }
}
