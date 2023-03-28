import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_font_size.dart';
import 'package:taktikat/feature/view/screens/app/home/widgets/team_section.dart';
import 'package:taktikat/feature/view_model/match_view_model.dart';
import 'package:taktikat/utils/date/date_time_util.dart';
import 'package:taktikat/utils/localization/string_keys.dart';
import 'package:taktikat/utils/shared/shared_prefs.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../../../../../../utils/constants/const_svgs.dart';
import '../../../../../core/theme/size/app_size.dart';
import '../../../../../model/enums/match_status.dart';
import '../../../../../model/models/match/match_model.dart';
import '../../../../global_widgets/swipe_button.dart';
import '../../../../global_widgets/swipe_menu.dart';
import 'league_continer.dart';

class MatchItem extends StatelessWidget {
  const MatchItem({
    super.key,
    required this.matches,
    required this.onClick,
  });

  final List<Matches> matches;
  final Function(Matches) onClick;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchViewModel>(builder: (logic) {
      return ListView.separated(
          shrinkWrap: true,
          primary: false,
          itemCount: matches.length,
          separatorBuilder: (context, index) => Divider(
                indent: 12,
                endIndent: 12,
                thickness: 1,
                color: ColorManager.instance.dividerColor,
              ),
          itemBuilder: (context, index) {
            return SwipeMenu(
              offset: 0.15,
              menuItems: [
                SwipeButton(
                  title: '',
                  iconPath: ConstSvg.star,
                  backgroundColor: matches[index].isFavorite
                      ? Theme.of(context).primaryColor
                      : ColorManager.instance.unselectedText,
                  onTap: () {
                    if (SharedPrefs.instance.getIsVisiter()) {
                      Utils.instance.snackError(
                          body: StringKeys.singleton
                              .youMustBeLoggedInToFavoriteTheMatch.tr);
                    } else {
                      logic.toggleFavoriteMatch(match: matches[index]);
                    }
                  },
                )
              ],
              child: InkWell(
                borderRadius: BorderRadius.circular(AppSize.r10),
                onTap: () {
                  onClick(matches[index]);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 10,
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const LeagueContainer(),
                        TeamSection(
                          teamName: Utils.instance.isArabic()
                              ? matches[index].homeTeam?.nameValues?.ar ?? ''
                              : matches[index].homeTeam?.nameValues?.en ?? '',
                          teamLogo: matches[index].homeTeam?.logo ?? '',
                          isHome: true,
                        ),
                        if (matches[index].isLive == true) ...[
                          Row(
                            children: [
                              const SizedBox(width: 15),
                              Column(
                                children: [
                                  Text(
                                    '${matches[index].timeElapsed}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.copyWith(
                                          fontSize: FontSize.fontSize10,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                        ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        matches[index].homeScore ?? '0',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge
                                            ?.copyWith(
                                              fontSize: FontSize.fontSize20,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                            ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '-',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge
                                            ?.copyWith(
                                              fontSize: FontSize.fontSize20,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                            ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        matches[index].awayScore ?? '0',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge
                                            ?.copyWith(
                                              fontSize: FontSize.fontSize20,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(width: 15),
                            ],
                          )
                        ] else if (matches[index].statusValue ==
                            MatchStatus.notStarted.value) ...[
                          Row(
                            children: [
                              const SizedBox(width: 15),
                              Column(
                                children: [
                                  Text(
                                    '${matches[index].status}',
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.copyWith(
                                          fontSize: FontSize.fontSize10,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                        ),
                                  ),
                                  Text(
                                    DateUtility.getHourAndMinute(
                                        dateTime: matches[index].startAt),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.copyWith(
                                          fontSize: FontSize.fontSize14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                  ),
                                  if (logic.isSearchExpand) ...[
                                    Text(
                                      DateUtility.getDayNumberAndMonthName(
                                          dateTime: matches[index].startAt),
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge
                                          ?.copyWith(
                                            fontSize: FontSize.fontSize10,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                    )
                                  ],
                                ],
                              ),
                              const SizedBox(width: 15),
                            ],
                          )
                        ] else if (matches[index].statusValue ==
                            MatchStatus.matchFinished.value) ...[
                          Row(
                            children: [
                              const SizedBox(width: 15),
                              Column(
                                children: [
                                  if (logic.isSearchExpand) ...[
                                    Text(
                                      DateUtility.getDayNumberAndMonthName(
                                          dateTime: matches[index].startAt),
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge
                                          ?.copyWith(
                                            fontSize: FontSize.fontSize10,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                    )
                                  ],
                                  Row(
                                    children: [
                                      Text(
                                        matches[index].homeScore ?? '0',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge
                                            ?.copyWith(
                                              fontSize: FontSize.fontSize20,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                            ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '-',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge
                                            ?.copyWith(
                                              fontSize: FontSize.fontSize20,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                            ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        matches[index].awayScore ?? '0',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge
                                            ?.copyWith(
                                              fontSize: FontSize.fontSize20,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(width: 15),
                            ],
                          ),
                        ] else if (matches[index].statusValue ==
                            MatchStatus.matchPostponed.value) ...[
                          Row(
                            children: [
                              const SizedBox(width: 15),
                              Column(
                                children: [
                                  if (logic.isSearchExpand) ...[
                                    Text(
                                      DateUtility.getDayNumberAndMonthName(
                                          dateTime: matches[index].startAt),
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge
                                          ?.copyWith(
                                            fontSize: FontSize.fontSize10,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                    )
                                  ],
                                  Text(
                                    '${matches[index].status}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.copyWith(
                                          fontSize: FontSize.fontSize8,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                        ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 15),
                            ],
                          )
                        ] else if (matches[index].statusValue ==
                            MatchStatus.timeToBeDefined.value) ...[
                          Row(
                            children: [
                              const SizedBox(width: 15),
                              Column(
                                children: [
                                  if (logic.isSearchExpand) ...[
                                    Text(
                                      DateUtility.getDayNumberAndMonthName(
                                          dateTime: matches[index].startAt),
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge
                                          ?.copyWith(
                                            fontSize: FontSize.fontSize10,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                    )
                                  ],
                                  Text(
                                    '${matches[index].status}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.copyWith(
                                          fontSize: FontSize.fontSize8,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                        ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 15),
                            ],
                          )
                        ] else ...[
                          Row(
                            children: [
                              const SizedBox(width: 15),
                              Column(
                                children: [
                                  if (logic.isSearchExpand) ...[
                                    Text(
                                      DateUtility.getDayNumberAndMonthName(
                                          dateTime: matches[index].startAt),
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge
                                          ?.copyWith(
                                            fontSize: FontSize.fontSize10,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                    )
                                  ],
                                  Text(
                                    '${matches[index].status}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.copyWith(
                                          fontSize: FontSize.fontSize8,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                        ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 15),
                            ],
                          ),
                        ],
                        TeamSection(
                          teamName: Utils.instance.isArabic()
                              ? matches[index].awayTeam?.nameValues?.ar ?? ''
                              : matches[index].awayTeam?.nameValues?.en ?? '',
                          teamLogo: matches[index].awayTeam?.logo ?? '',
                          isHome: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
    });
  }
}
