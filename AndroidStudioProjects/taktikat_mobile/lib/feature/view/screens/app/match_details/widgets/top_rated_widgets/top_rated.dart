import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/view/screens/app/match_details/widgets/top_rated_widgets/players_top_assists.dart';
import 'package:taktikat/feature/view/screens/app/match_details/widgets/top_rated_widgets/players_top_ratings.dart';
import 'package:taktikat/feature/view/screens/app/match_details/widgets/top_rated_widgets/players_top_scorer.dart';

import '../../../../../../../utils/localization/string_keys.dart';
import '../../../../../../core/theme/color/color_manager.dart';
import '../../../../../../core/theme/size/app_size.dart';
import '../../../../../../view_model/match_detail_view_model.dart';

class TopRatedSection extends StatelessWidget {
  const TopRatedSection({Key? key, required this.logic}) : super(key: key);

  final MatchDetailViewModel logic;

  static final CarouselSliderController controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    if (logic.topRated?.homeTeam?.topScorer == null) {
      return const SizedBox.shrink();
    }
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  StringKeys.singleton.topRated.tr,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorManager.instance.dashColor,
                      ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: AppSize.h174,
            child: CarouselSlider(
              controller: controller,
              // slideTransform: const TabletTransform(),
              slideTransform: const ForegroundToBackgroundTransform(),
              children: [
                PlayerTopScorer(
                    topRated: logic.topRated, controller: controller),
                PlayerTopAssists(
                    topRated: logic.topRated, controller: controller),
                PlayerTopRatings(
                    topRated: logic.topRated, controller: controller),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
