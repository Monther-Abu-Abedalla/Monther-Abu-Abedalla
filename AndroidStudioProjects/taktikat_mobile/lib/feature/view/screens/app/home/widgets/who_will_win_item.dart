import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';
import 'package:taktikat/feature/view/screens/app/home/widgets/team_section.dart';
import 'package:taktikat/feature/view/screens/app/home/widgets/who_will_win_result.dart';
import 'package:taktikat/feature/view_model/match_view_model.dart';
import 'package:taktikat/utils/localization/string_keys.dart';
import 'package:taktikat/utils/shared/shared_prefs.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../../../../../../utils/date/date_time_util.dart';
import '../../../../../../utils/shimmer/who_will_win_skeleton.dart';
import '../../../../../core/theme/size/app_size.dart';
import '../../../../../core/theme/text_theme/text_font_size.dart';
import '../../../../../model/enums/border_types.dart';
import '../../../../../model/enums/competition_vote_types.dart';
import '../../../../../model/models/home/competition_model.dart';
import '../../../../global_widgets/custom_text_field.dart';
import '../../../../global_widgets/primary_button.dart';

class WhoWillWimItem extends StatelessWidget {
  const WhoWillWimItem({
    super.key,
    required this.competitions,
  });

  final List<Competition> competitions;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchViewModel>(builder: (logic) {
      if (logic.isLoading) {
        return const WhoWillWinSkeleton();
      }
      return Material(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(AppSize.r10),
        child: ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemCount: competitions.length,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            separatorBuilder: (context, index) => Divider(
                  indent: 4,
                  endIndent: 4,
                  thickness: 1,
                  color: ColorManager.instance.dividerColor,
                ),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TeamSection(
                          teamName:
                              '${Utils.instance.isArabic() ? competitions[index].homeTeam?.nameValues?.ar : competitions[index].homeTeam?.nameValues?.en}',
                          teamLogo: competitions[index].homeTeam?.logo ?? '',
                          isHome: true,
                        ),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              DateUtility.getHourAndMinute(
                                  dateTime: competitions[index].startAt),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(
                                    fontSize: FontSize.fontSize14,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                            const SizedBox(height: 4),
                          ],
                        ),
                        const SizedBox(width: 20),
                        TeamSection(
                          teamName:
                              '${Utils.instance.isArabic() ? competitions[index].awayTeam?.nameValues?.ar : competitions[index].awayTeam?.nameValues?.en}',
                          teamLogo: competitions[index].awayTeam?.logo ?? '',
                          isHome: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (SharedPrefs.instance.getIsVisiter()) ...[
                      WhoWillWinResult(
                        homeTeamName: Utils.instance.isArabic()
                            ? competitions[index].homeTeam?.nameValues?.ar ?? ''
                            : competitions[index].homeTeam?.nameValues?.en ??
                                '',
                        homeTeamWinPercentage: competitions[index]
                                .competitionResults
                                ?.homeVotedRate
                                ?.rate
                                ?.toDouble() ??
                            0,
                        homeTeamColors: competitions[index]
                                    .homeTeam
                                    ?.homeColor !=
                                ''
                            ? Utils.instance.getColorFromHex(
                                competitions[index].homeTeam?.homeColor ?? '')
                            : ColorManager.instance.possessionBlue,
                        awayTeamName: Utils.instance.isArabic()
                            ? competitions[index].awayTeam?.nameValues?.ar ?? ''
                            : competitions[index].awayTeam?.nameValues?.en ??
                                '',
                        awayTeamWinPercentage: competitions[index]
                                .competitionResults
                                ?.awayVotedRate
                                ?.rate
                                ?.toDouble() ??
                            0,
                        awayTeamColors: competitions[index]
                                    .awayTeam
                                    ?.homeColor !=
                                ''
                            ? Utils.instance.getColorFromHex(
                                competitions[index].awayTeam?.homeColor ?? '')
                            : ColorManager.instance.possessionRed,
                        drawPercentage: competitions[index]
                                .competitionResults
                                ?.drawVotedRate
                                ?.rate
                                ?.toDouble() ??
                            100,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            '${competitions[index].competitionResults?.total ?? 0} ${StringKeys.singleton.votes.tr}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const Spacer(),
                          if (competitions[index].isFinished ?? false) ...[
                            Text(
                              StringKeys.singleton.matchFinished.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: ColorManager.instance.dashColor),
                            )
                          ] else ...[
                            InkWell(
                              onTap: () {
                                Utils.instance.snackError(
                                    body: StringKeys.singleton
                                        .youMustBeLoggedInToPredictTheMatch.tr);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 7),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorManager.instance.primary),
                                child: Text(
                                  StringKeys.singleton.predict.tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: ColorManager.instance.white),
                                ),
                              ),
                            ),
                          ]
                        ],
                      )
                    ] else if (competitions[index].isFinished ?? false) ...[
                      WhoWillWinResult(
                        homeTeamName: Utils.instance.isArabic()
                            ? competitions[index].homeTeam?.nameValues?.ar ?? ''
                            : competitions[index].homeTeam?.nameValues?.en ??
                                '',
                        homeTeamWinPercentage: competitions[index]
                                .competitionResults
                                ?.homeVotedRate
                                ?.rate
                                ?.toDouble() ??
                            0,
                        homeTeamColors: competitions[index]
                                    .homeTeam
                                    ?.homeColor !=
                                ''
                            ? Utils.instance.getColorFromHex(
                                competitions[index].homeTeam?.homeColor ?? '')
                            : ColorManager.instance.possessionBlue,
                        awayTeamName: Utils.instance.isArabic()
                            ? competitions[index].awayTeam?.nameValues?.ar ?? ''
                            : competitions[index].awayTeam?.nameValues?.en ??
                                '',
                        awayTeamWinPercentage: competitions[index]
                                .competitionResults
                                ?.awayVotedRate
                                ?.rate
                                ?.toDouble() ??
                            0,
                        awayTeamColors: competitions[index]
                                    .awayTeam
                                    ?.homeColor !=
                                ''
                            ? Utils.instance.getColorFromHex(
                                competitions[index].awayTeam?.homeColor ?? '')
                            : ColorManager.instance.possessionRed,
                        drawPercentage: competitions[index]
                                .competitionResults
                                ?.drawVotedRate
                                ?.rate
                                ?.toDouble() ??
                            100,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            '${competitions[index].competitionResults?.total ?? 0} ${StringKeys.singleton.votes.tr}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const Spacer(),
                          Text(
                            StringKeys.singleton.matchFinished.tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.instance.dashColor),
                          )
                        ],
                      ),
                    ] else if (competitions[index].isExpected ?? false) ...[
                      WhoWillWinResult(
                        homeTeamName: Utils.instance.isArabic()
                            ? competitions[index].homeTeam?.nameValues?.ar ?? ''
                            : competitions[index].homeTeam?.nameValues?.en ??
                                '',
                        homeTeamWinPercentage: competitions[index]
                                .competitionResults
                                ?.homeVotedRate
                                ?.rate
                                ?.toDouble() ??
                            0,
                        homeTeamColors: competitions[index]
                                    .homeTeam
                                    ?.homeColor !=
                                ''
                            ? Utils.instance.getColorFromHex(
                                competitions[index].homeTeam?.homeColor ?? '')
                            : ColorManager.instance.possessionBlue,
                        awayTeamName: Utils.instance.isArabic()
                            ? competitions[index].awayTeam?.nameValues?.ar ?? ''
                            : competitions[index].awayTeam?.nameValues?.en ??
                                '',
                        awayTeamWinPercentage: competitions[index]
                                .competitionResults
                                ?.awayVotedRate
                                ?.rate
                                ?.toDouble() ??
                            0,
                        awayTeamColors: competitions[index]
                                    .awayTeam
                                    ?.homeColor !=
                                ''
                            ? Utils.instance.getColorFromHex(
                                competitions[index].awayTeam?.homeColor ?? '')
                            : ColorManager.instance.possessionRed,
                        drawPercentage: competitions[index]
                                .competitionResults
                                ?.drawVotedRate
                                ?.rate
                                ?.toDouble() ??
                            100,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            '${competitions[index].competitionResults?.total ?? 0} ${StringKeys.singleton.votes.tr}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const Spacer(),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(AppSize.r8),
                              onTap: () {
                                competitions[index].isExpected = false;
                                competitions[index].isReVote = true;

                                if (competitions[index]
                                        .myExpectationsCompetition !=
                                    null) {
                                  final MyExpectationsCompetition?
                                      myExpectations = competitions[index]
                                          .myExpectationsCompetition;
                                  competitions[index].homeScore = myExpectations
                                          ?.homeTeamScore
                                          .toString() ??
                                      '0';
                                  competitions[index].awayScore = myExpectations
                                          ?.awayTeamScore
                                          .toString() ??
                                      '0';
                                }

                                // ExpectationsCompetition? previousVote =
                                //     competitions[index]
                                //         .expectationsCompetition
                                //         ?.firstWhere((element) =>
                                //             element.id ==
                                //             SharedPrefs.instance
                                //                 .getUserData()
                                //                 ?.id);
                                // competitions[index].homeScore =
                                //     previousVote?.homeTeamScore.toString() ??
                                //         '0';
                                // competitions[index].awayScore =
                                //     previousVote?.awayTeamScore.toString() ??
                                //         '0';
                                logic.update();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      StringKeys.singleton.reVote.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: ColorManager
                                                  .instance.dashColor),
                                    ),
                                    const SizedBox(width: 4),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: FontSize.fontSize10,
                                      color: ColorManager.instance.dashColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ] else ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: AppSize.h40,
                            height: AppSize.h40,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(AppSize.r10),
                              border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                width: 1,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: CustomTextFormFiled(
                              hint: competitions[index].isReVote
                                  ? competitions[index].homeScore
                                  : '0',
                              borderType: BorderTypes.outline,
                              textStyle: Theme.of(context).textTheme.bodyLarge,
                              backgroundColor:
                                  Theme.of(context).colorScheme.background,
                              textAlign: TextAlign.center,
                              inputType: TextInputType.number,
                              borderRadius: AppSize.r10,
                              maxLength: 2,
                              onChanged: (val) {
                                competitions[index].homeScore = val!;
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          PrimaryButton(
                            text: competitions[index].isReVote
                                ? StringKeys.singleton.reVote.tr
                                : StringKeys.singleton.predict.tr,
                            onPressed: () {
                              logic.toggleCompetition(
                                competitionVoteTypes:
                                    CompetitionVoteTypes.withScores,
                                competition: competitions[index],
                                wining: logic.voteStatus(
                                    home: competitions[index].homeScore,
                                    away: competitions[index].awayScore),
                                homeTeamGoals: competitions[index].homeScore,
                                awayTeamGoals: competitions[index].awayScore,
                                isReVote: competitions[index].isReVote,
                              );
                            },
                          ),
                          const SizedBox(width: 16),
                          Container(
                            width: AppSize.h40,
                            height: AppSize.h40,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(AppSize.r10),
                              border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                width: 1,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: CustomTextFormFiled(
                              hint: competitions[index].isReVote
                                  ? competitions[index].awayScore
                                  : '0',
                              borderType: BorderTypes.outline,
                              maxLength: 2,
                              backgroundColor:
                                  Theme.of(context).colorScheme.background,
                              textAlign: TextAlign.center,
                              inputType: TextInputType.number,
                              borderRadius: AppSize.r10,
                              onChanged: (val) {
                                competitions[index].awayScore = val!;
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              );
            }),
      );
    });
  }
}
