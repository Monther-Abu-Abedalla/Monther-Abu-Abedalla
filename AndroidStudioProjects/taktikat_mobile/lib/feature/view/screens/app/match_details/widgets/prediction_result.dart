import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/feature/view/global_widgets/my_network_image.dart';
import 'package:taktikat/feature/view/global_widgets/primary_button.dart';
import 'package:taktikat/feature/view_model/match_detail_view_model.dart';
import 'package:taktikat/utils/localization/string_keys.dart';
import 'package:taktikat/utils/utils/utils.dart';

class PredictionResult extends StatelessWidget {
  const PredictionResult({super.key, this.isFinished = false});

  final bool isFinished;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchDetailViewModel>(
      builder: (matchLogic) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(AppSize.r8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isFinished) ...[
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
                        StringKeys.singleton.matchPredictions.tr,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: ColorManager.instance.dashColor,
                            ),
                      ),
                    ),
                  ),
                )
              ],
              const SizedBox(height: 15),
              ///todo refactor code
              /// ui refactor - components is not aligned properly
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        MyNetworkImage(
                          url: matchLogic.matchDetails?.homeTeam?.logo,
                          height: AppSize.h40,
                          width: AppSize.w40,
                          fit: BoxFit.cover,
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Text(
                                Utils.instance.getPredictionInDigits(
                                    prediction: matchLogic
                                        .matchDetails
                                        ?.competitionResults
                                        ?.homeVotedRate
                                        ?.rate),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        ColorManager.instance.possessionBlue),
                              ),
                              Text(
                                matchLogic.matchDetails?.homeTeam?.name ?? '',
                                style: TextStyle(
                                  color: ColorManager.instance.possessionBlue,
                                ),
                              ),
                              Text(StringKeys.singleton.wins.tr,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          Utils.instance.getPredictionInDigits(
                              prediction: matchLogic.matchDetails
                                  ?.competitionResults?.drawVotedRate?.rate),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.instance.dashColor),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          StringKeys.singleton.draw.tr,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.instance.dashColor),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Text(
                                Utils.instance.getPredictionInDigits(
                                    prediction: matchLogic
                                        .matchDetails
                                        ?.competitionResults
                                        ?.awayVotedRate
                                        ?.rate),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.instance.possessionRed),
                              ),
                              Text(
                                matchLogic.matchDetails?.awayTeam?.name ?? '',
                                style: TextStyle(
                                  color: ColorManager.instance.possessionRed,
                                ),
                              ),
                              Text(StringKeys.singleton.wins.tr,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                        ),
                        const Spacer(),
                        MyNetworkImage(
                          url: matchLogic.matchDetails?.awayTeam?.logo,
                          height: AppSize.h40,
                          width: AppSize.w40,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (!isFinished) ...[
                Center(
                  child: PrimaryButton(
                    text: StringKeys.singleton.reVote.tr,
                    onPressed: () {
                      matchLogic.localReVote();
                    },
                  ),
                )
              ],
            ],
          ),
        );
      },
    );
  }
}
