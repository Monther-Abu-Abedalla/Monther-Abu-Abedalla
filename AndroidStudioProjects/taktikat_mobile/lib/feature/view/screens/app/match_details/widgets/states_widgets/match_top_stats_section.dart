import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/view/screens/app/match_details/widgets/states_widgets/possession_circle.dart';
import 'package:taktikat/feature/view/screens/app/match_details/widgets/states_widgets/top_stats_item.dart';
import 'package:taktikat/utils/localization/string_keys.dart';

import '../../../../../../core/theme/color/color_manager.dart';
import '../../../../../../core/theme/size/app_size.dart';
import '../../../../../../view_model/match_detail_view_model.dart';
import 'stats_item.dart';

class MatchTopStatsSection extends StatelessWidget {
  const MatchTopStatsSection(
      {super.key, required this.isTopStats, required this.logic});

  final MatchDetailViewModel logic;
  final bool isTopStats;

  @override
  Widget build(BuildContext context) {
    // logic.matchStatistics?.awayTeam.homeColor
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
                  StringKeys.singleton.topStats.tr,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorManager.instance.dashColor,
                      ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              PossessionCircle(
                homePercent: logic.statisticsPossession?.homePercentageValue
                        ?.toDouble() ??
                    0,
                homeLogo: logic.matchStatistics?.homeTeam?.logo ?? '',
                awayPercent: logic.statisticsPossession?.awayPercentageValue
                        ?.toDouble() ??
                    0,
                awayLogo: logic.matchStatistics?.awayTeam?.logo ?? '',
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: [
                    TopStatsItem(
                      homeTeamStats:
                          logic.statisticsExpectedGoals?.homeValue.toString() ??
                              '',
                      awayTeamStats:
                          logic.statisticsExpectedGoals?.awayValue.toString() ??
                              '',
                      statsName: StringKeys.singleton.expectedGoals.tr,
                    ),
                    const SizedBox(height: 6),
                    TopStatsItem(
                        homeTeamStats: logic.statisticsShotsOnTarget?.homeValue
                                .toString() ??
                            '',
                        awayTeamStats: logic.statisticsShotsOnTarget?.awayValue
                                .toString() ??
                            '',
                        statsName: StringKeys.singleton.shotsOnTarget.tr),
                    const SizedBox(height: 6),
                    TopStatsItem(
                        homeTeamStats:
                            logic.statisticsTotalShots?.homeValue.toString() ??
                                '',
                        awayTeamStats:
                            logic.statisticsTotalShots?.awayValue.toString() ??
                                '',
                        statsName: StringKeys.singleton.totalShots.tr),
                    const SizedBox(height: 6),
                    TopStatsItem(
                        homeTeamStats: logic.statisticsAccuratePasses?.homeValue
                                .toString() ??
                            '',
                        awayTeamStats: logic.statisticsAccuratePasses?.awayValue
                                .toString() ??
                            '',
                        statsName: StringKeys.singleton.accuratePasses.tr),
                  ],
                ),
              )
            ],
          ),
          if (!isTopStats) ...[
            const SizedBox(height: 20),
            const Divider(),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: logic.matchStatistics?.statistics?.length ?? 0,
              itemBuilder: (context, index) {
                return StatsItem(
                  homeScore:
                      logic.matchStatistics?.statistics?[index].homeValue ?? 0,
                  awayScore:
                      logic.matchStatistics?.statistics?[index].awayValue ?? 0,
                  title: logic.matchStatistics?.statistics?[index].title ?? '',
                  homePercentage: logic.matchStatistics?.statistics?[index]
                          .homePercentageValue ??
                      0,
                  awayPercentage: logic.matchStatistics?.statistics?[index]
                          .awayPercentageValue ??
                      0,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 20),
            ),
          ],
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
