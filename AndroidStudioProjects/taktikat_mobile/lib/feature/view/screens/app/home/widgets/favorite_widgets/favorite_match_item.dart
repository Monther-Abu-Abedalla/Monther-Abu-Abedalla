import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_font_size.dart';
import 'package:taktikat/feature/view/screens/app/home/widgets/team_section.dart';
import 'package:taktikat/feature/view_model/match_view_model.dart';
import 'package:taktikat/utils/date/date_time_util.dart';
import 'package:taktikat/utils/shared/shared_prefs.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../../../../../../../utils/constants/const_svgs.dart';
import '../../../../../../core/theme/size/app_size.dart';
import '../../../../../../model/enums/match_status.dart';
import '../../../../../../model/enums/preferences_types.dart';
import '../../../../../../model/models/match/match_model.dart';
import '../../../../../global_widgets/swipe_button.dart';
import '../../../../../global_widgets/swipe_menu.dart';
import '../league_continer.dart';

class FavoriteMatchItem extends StatelessWidget {
  const FavoriteMatchItem({
    super.key,
    required this.matches,
    required this.onClick,
    this.isSwappable = false,
    required this.preferencesTypes,
  });

  final List<Matches> matches;
  final Function(Matches) onClick;
  final bool isSwappable;
  final PreferencesTypes preferencesTypes;

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
              offset: !SharedPrefs.instance.getIsVisiter() && isSwappable
                  ? 0.15
                  : 0.0,
              menuItems: [
                if (!SharedPrefs.instance.getIsVisiter()) ...[
                  SwipeButton(
                    title: '',
                    iconPath: ConstSvg.delete,
                    backgroundColor: matches[index].isFavorite
                        ? ColorManager.instance.primary
                        : ColorManager.instance.unselectedText,
                    onTap: () {
                      if (preferencesTypes == PreferencesTypes.team) {
                        logic.removePreferencesFromFavorite(
                            preferenceType: preferencesTypes,
                            id: matches[index].favoriteTeam ?? -1);
                        logic.getFavoriteMatches(date: logic.date);
                      } else {
                        logic.toggleFavoriteMatch(match: matches[index]);
                        logic.getFavoriteMatches(date: logic.date);
                      }
                    },
                  )
                ]
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
                        if (matches[index].statusValue ==
                            MatchStatus.notStarted.value) ...[
                          Row(
                            children: [
                              const SizedBox(width: 20),
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
                                ],
                              ),
                              const SizedBox(width: 20),
                            ],
                          )
                        ] else if (matches[index].statusValue ==
                            MatchStatus.matchFinished.value) ...[
                          Row(
                            children: [
                              const SizedBox(width: 15),
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
                              const SizedBox(width: 10),
                            ],
                          )
                        ] else if (matches[index].statusValue ==
                            MatchStatus.matchPostponed.value) ...[
                          Row(
                            children: [
                              const SizedBox(width: 10),
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
                              const SizedBox(width: 10),
                            ],
                          )
                        ] else if (matches[index].statusValue ==
                            MatchStatus.timeToBeDefined.value) ...[
                          Row(
                            children: [
                              const SizedBox(width: 10),
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
                              const SizedBox(width: 10),
                            ],
                          )
                        ] else ...[
                          Row(
                            children: [
                              const SizedBox(width: 20),
                              Column(
                                children: [
                                  Text(
                                    '${matches[index].elapsed}',
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
                                    '${matches[index].status}',
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
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10),
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
