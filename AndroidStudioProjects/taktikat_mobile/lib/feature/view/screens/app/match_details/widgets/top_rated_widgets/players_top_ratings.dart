import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/view/screens/app/match_details/widgets/top_rated_widgets/top_rated_player_item.dart';
import 'package:taktikat/utils/localization/string_keys.dart';

import '../../../../../../../utils/constants/const_svgs.dart';
import '../../../../../../../utils/utils/utils.dart';
import '../../../../../../core/theme/color/color_manager.dart';
import '../../../../../../model/models/match_details/top_rated_model.dart';
import '../states_widgets/top_stats_item.dart';

class PlayerTopRatings extends StatelessWidget {
  const PlayerTopRatings(
      {super.key, required this.topRated, required this.controller});
  final TopRated? topRated;
  final CarouselSliderController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (Utils.instance.isArabic()) ...[
          InkWell(
            onTap: () => controller.previousPage(),
            child: SvgPicture.asset(
              ConstSvg.previous,
              colorFilter: ColorFilter.mode(
                ColorManager.instance.secondary,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ] else ...[
          const SizedBox(width: 30),
        ],
        Expanded(
          child: Column(
            children: [
              Text(
                StringKeys.singleton.topRating.tr,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorManager.instance.dashColor,
                    ),
              ),
              const SizedBox(height: 2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TopRatedPlayerSection(
                      player: topRated?.homeTeam?.topRating?.player,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TopStatsItem(
                          homeTeamStats: topRated
                                  ?.homeTeam?.topRating?.games?.rating
                                  ?.substring(0, 3) ??
                              '0',
                          awayTeamStats: topRated
                                  ?.awayTeam?.topRating?.games?.rating
                                  ?.substring(0, 3) ??
                              '0',
                          statsName: StringKeys.singleton.ratings.tr,
                        ),
                        const SizedBox(height: 12),
                        TopStatsItem(
                          homeTeamStats: topRated
                                  ?.homeTeam?.topRating?.goals?.total
                                  .toString() ??
                              '0',
                          awayTeamStats: topRated
                                  ?.awayTeam?.topRating?.goals?.total
                                  .toString() ??
                              '0',
                          statsName: StringKeys.singleton.goals.tr,
                        ),
                        const SizedBox(height: 12),
                        TopStatsItem(
                          homeTeamStats: topRated
                                  ?.homeTeam?.topRating?.games?.appearences
                                  ?.toString() ??
                              '0',
                          awayTeamStats: topRated
                                  ?.awayTeam?.topRating?.games?.appearences
                                  ?.toString() ??
                              '0',
                          statsName: StringKeys.singleton.appearances.tr,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                      child: TopRatedPlayerSection(
                    player: topRated?.awayTeam?.topRating?.player,
                  )),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        if (!Utils.instance.isArabic()) ...[
          InkWell(
            onTap: () => controller.previousPage(),
            child: SvgPicture.asset(
              ConstSvg.previous,
              colorFilter: ColorFilter.mode(
                ColorManager.instance.secondary,
                BlendMode.srcIn,
              ),
            ),
          )
        ],
      ],
    );
  }
}
