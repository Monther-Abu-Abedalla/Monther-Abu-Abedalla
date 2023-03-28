import 'package:flutter/material.dart';
import 'package:taktikat/feature/model/enums/match_status.dart';
import 'package:taktikat/feature/view/screens/app/match_details/widgets/commentaries/match_events.dart';
import 'package:taktikat/feature/view/screens/app/match_details/widgets/prediction_slider.dart';
import 'package:taktikat/utils/constants/constants.dart';
import '../../../../../view_model/match_detail_view_model.dart';
import '../widgets/confrontations_widgets/confrontations.dart';
import '../widgets/events_widgets/live_match_events_section.dart';
import '../widgets/events_widgets/match_info_section.dart';
import '../widgets/events_widgets/match_standings_comparison_section.dart';
import '../widgets/prediction_result.dart';
import '../widgets/states_widgets/match_top_stats_section.dart';
import '../widgets/top_rated_widgets/top_rated.dart';

class MatchEventTab extends StatelessWidget {
  const MatchEventTab({Key? key, required this.logic}) : super(key: key);

  final MatchDetailViewModel logic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: logic.matchDetails?.isLive == true
            ? [
                ///live
                const SizedBox(height: 10),
                const MatchEvents(isLive: true),
                const SizedBox(height: 10),
                LiveMatchEventsSection(
                    statistics: logic.matchDetails?.statistics),
                const SizedBox(height: 10),
                if (logic.matchDetails?.matchTypeValue !=
                    Constants.matchTypeChampionship) ...[
                  const MatchStandingsComparisonSection(),
                ],
                const SizedBox(height: 10),
                MatchInfoSection(logic: logic),
                const SizedBox(height: 10),
              ]
            : logic.matchDetails?.statusValue == MatchStatus.matchFinished.value
                ? [
                    ///Match Finished
                    const SizedBox(height: 10),
                    const MatchEvents(),
                    const SizedBox(height: 10),
                    const PredictionResult(isFinished: true),
                    const SizedBox(height: 10),
                    MatchTopStatsSection(logic: logic, isTopStats: true),
                    const SizedBox(height: 10),
                    if (logic.matchDetails?.matchTypeValue !=
                        Constants.matchTypeChampionship) ...[
                      const MatchStandingsComparisonSection(),
                    ],
                    const SizedBox(height: 10),
                    MatchInfoSection(logic: logic),
                    const SizedBox(height: 10),
                  ]
                : logic.matchDetails?.statusValue ==
                        MatchStatus.notStarted.value
                    ? [
                        ///Match not Started
                        const SizedBox(height: 10),
                        const PredictionSlider(),
                        const SizedBox(height: 10),
                        TopRatedSection(logic: logic),
                        const SizedBox(height: 10),
                        Confrontations(logic: logic),
                        const SizedBox(height: 10),
                        if (logic.matchDetails?.matchTypeValue !=
                            Constants.matchTypeChampionship) ...[
                          const MatchStandingsComparisonSection(),
                        ],
                        const SizedBox(height: 10),
                        MatchInfoSection(logic: logic),
                        const SizedBox(height: 10),
                      ]
                    : logic.matchDetails?.statusValue ==
                            MatchStatus.matchPostponed.value
                        ? [
                            ///Match Postponed
                            const SizedBox(height: 10),
                            TopRatedSection(logic: logic),
                            const SizedBox(height: 10),
                            if (logic.matchDetails?.matchTypeValue !=
                                Constants.matchTypeChampionship) ...[
                              const MatchStandingsComparisonSection(),
                            ],
                            const SizedBox(height: 10),
                            MatchInfoSection(logic: logic),
                            const SizedBox(height: 10),
                          ]
                        : [
                            ///else

                            const SizedBox(height: 10),
                            if (logic.matchDetails?.matchTypeValue !=
                                Constants.matchTypeChampionship) ...[
                              const MatchStandingsComparisonSection(),
                            ],
                            const SizedBox(height: 10),
                            MatchInfoSection(logic: logic),
                            const SizedBox(height: 10),
                          ],
      ),
    );
  }
}

// Standing - Prediction .
