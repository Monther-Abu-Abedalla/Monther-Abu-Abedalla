import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/feature/view/screens/app/match_details/widgets/prediction_result.dart';
import 'package:taktikat/feature/view/screens/app/match_details/widgets/prediction_slider_section.dart';
import 'package:taktikat/feature/view_model/match_detail_view_model.dart';

import '../../../../global_widgets/my_network_image.dart';
import 'match_counter.dart';

class PredictionSlider extends StatelessWidget {
  const PredictionSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchDetailViewModel>(
      builder: (matchLogic) {
        if (matchLogic.matchDetails?.hasCompetition != true) {
          return const SizedBox.shrink();
        }
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(AppSize.r8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(children: [
            Row(
              children: [
                MyNetworkImage(
                    url: matchLogic.matchDetails?.league?.logo,
                    height: AppSize.h30,
                    width: AppSize.w30),
                Expanded(
                  child: MatchCounter(
                    matchDate:
                        matchLogic.matchDetails?.startAt ?? DateTime.now(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            if (matchLogic.matchDetails?.isExpected == true) ...[
              const PredictionResult()
            ] else if (matchLogic.matchDetails?.isCompetitionFinished !=
                true) ...[
              const PredictionSliderSection(),
            ],
          ]),
        );
      },
    );
  }
}
