import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/model/enums/vote_status.dart';
import 'package:taktikat/feature/view_model/match_detail_view_model.dart';

import '../../../../../../utils/localization/string_keys.dart';
import '../../../../../../utils/utils/utils.dart';
import '../../../../../core/theme/color/color_manager.dart';
import '../../../../../core/theme/size/app_size.dart';
import '../../../../../core/theme/text_theme/text_font_size.dart';
import '../../../../global_widgets/my_network_image.dart';
import '../../../../global_widgets/primary_button.dart';
import 'draggble_widget.dart';

class PredictionSliderSection extends StatelessWidget {
  const PredictionSliderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchDetailViewModel>(
      builder: (matchLogic) {
        return Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: AppSize.w30,
                                  left: AppSize.w30,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.r8),
                                  gradient: LinearGradient(
                                    colors: [
                                      Utils.instance.getColorFromHex(
                                        matchLogic
                                            .matchDetails?.homeTeam?.homeColor,
                                      ),
                                      Utils.instance
                                          .getColorFromHex(
                                            matchLogic.matchDetails?.homeTeam
                                                ?.homeColor,
                                          )
                                          .withOpacity(0.6),
                                      Utils.instance
                                          .getColorFromHex(
                                            matchLogic.matchDetails?.homeTeam
                                                ?.awayColor,
                                          )
                                          .withOpacity(0.6),
                                      Utils.instance.getColorFromHex(
                                        matchLogic
                                            .matchDetails?.homeTeam?.awayColor,
                                      ),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: AppSize.r18,
                                  backgroundColor:
                                      ColorManager.instance.transparent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Utils.instance.isArabic()
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: InkWell(
                                  onTap: () {
                                    matchLogic.setWinner(
                                      voteState: VoteStates.home
                                    );
                                  },
                                  child: CircleAvatar(
                                    radius: AppSize.r24,
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    child: MyNetworkImage(
                                      url: matchLogic
                                          .matchDetails?.homeTeam?.logo,
                                      height: AppSize.h50,
                                      width: AppSize.w50,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Utils.instance.isArabic()
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    matchLogic.setWinner(
                                      voteState: VoteStates.away
                                    );
                                  },
                                  child: CircleAvatar(
                                    radius: AppSize.r24,
                                    backgroundColor:
                                        Theme.of(context).colorScheme.background,
                                    child: MyNetworkImage(
                                      url:
                                          matchLogic.matchDetails?.awayTeam?.logo,
                                      height: AppSize.h50,
                                      width: AppSize.w50,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: AppSize.w60,
                        right: AppSize.w60,
                        bottom: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.arrow_left_outlined,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background
                                        .withOpacity(0.5),
                                    size: FontSize.fontSize20,
                                  ),
                                  Text(
                                    StringKeys.singleton.winner.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background
                                              .withOpacity(
                                                0.5,
                                              ),
                                        ),
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: AppSize.h60,
                              width: AppSize.w60,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    StringKeys.singleton.winner.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background
                                              .withOpacity(0.5),
                                        ),
                                    textAlign: TextAlign.start,
                                  ),
                                  Icon(
                                    Icons.arrow_right_outlined,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background
                                        .withOpacity(0.5),
                                    size: FontSize.fontSize20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Center(
                        child: DraggableWidget(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryButton(
                        text: StringKeys.singleton.reVote.tr,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                          matchLogic.initDrag();
                        },
                      ),
                      const SizedBox(width: 8),
                      PrimaryButton(
                        text: StringKeys.singleton.save.tr,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                          matchLogic.saveCompetition(
                            competitionId: matchLogic.matchDetails?.id ?? 0,
                          );
                          matchLogic.getMatchDetails(
                              matchId: matchLogic.matchDetails?.id ?? 0);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
