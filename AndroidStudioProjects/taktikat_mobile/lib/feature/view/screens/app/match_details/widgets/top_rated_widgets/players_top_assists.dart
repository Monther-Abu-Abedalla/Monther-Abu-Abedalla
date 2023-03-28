import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/view/screens/app/match_details/widgets/top_rated_widgets/top_rated_player_item.dart';
import 'package:taktikat/utils/localization/string_keys.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../../../../../../../utils/constants/const_svgs.dart';
import '../../../../../../core/theme/color/color_manager.dart';
import '../../../../../../model/models/match_details/top_rated_model.dart';
import '../states_widgets/top_stats_item.dart';

class PlayerTopAssists extends StatelessWidget {
  const PlayerTopAssists(
      {super.key, required this.topRated, required this.controller});
  final TopRated? topRated;
  final CarouselSliderController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Utils.instance.isArabic()
              ? controller.previousPage()
              : controller.nextPage(),
          child: SvgPicture.asset(
            Utils.instance.isArabic() ? ConstSvg.previous : ConstSvg.next,
            colorFilter: ColorFilter.mode(
              ColorManager.instance.secondary,
              BlendMode.srcIn,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            children: [
              Text(
                StringKeys.singleton.topAssist.tr,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorManager.instance.dashColor,
                    ),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Expanded(
                    child: TopRatedPlayerSection(
                      player: topRated?.homeTeam?.topAssist?.player,
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
                                  ?.homeTeam?.topAssist?.goals?.assists
                                  .toString() ??
                              '0',
                          awayTeamStats: topRated
                                  ?.awayTeam?.topAssist?.goals?.assists
                                  .toString() ??
                              '0',
                          statsName: StringKeys.singleton.assist.tr,
                        ),
                        const SizedBox(height: 12),
                        TopStatsItem(
                          homeTeamStats: topRated
                                  ?.homeTeam?.topAssist?.passes?.total
                                  .toString() ??
                              '0',
                          awayTeamStats: topRated
                                  ?.awayTeam?.topAssist?.passes?.total
                                  .toString() ??
                              '0',
                          statsName: StringKeys.singleton.totalPasses.tr,
                        ),
                        const SizedBox(height: 12),
                        TopStatsItem(
                          homeTeamStats: topRated
                                  ?.homeTeam?.topAssist?.games?.rating
                                  ?.substring(0, 3) ??
                              '0',
                          awayTeamStats: topRated
                                  ?.awayTeam?.topAssist?.games?.rating
                                  ?.substring(0, 3) ??
                              '0',
                          statsName: StringKeys.singleton.ratings.tr,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: TopRatedPlayerSection(
                      player: topRated?.awayTeam?.topAssist?.player,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: () => Utils.instance.isArabic()
              ? controller.nextPage()
              : controller.previousPage(),
          child: SvgPicture.asset(
              Utils.instance.isArabic() ? ConstSvg.next : ConstSvg.previous,
              colorFilter: ColorFilter.mode(
                ColorManager.instance.secondary,
                BlendMode.srcIn,
              )),
        ),
      ],
    );
  }
}
