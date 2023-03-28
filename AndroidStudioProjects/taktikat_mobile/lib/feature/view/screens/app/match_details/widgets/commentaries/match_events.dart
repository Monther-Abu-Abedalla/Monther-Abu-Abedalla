import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/view_model/match_detail_view_model.dart';

import '../../../../../../../utils/constants/const_svgs.dart';
import '../../../../../../../utils/localization/string_keys.dart';
import '../../../../../../core/theme/color/color_manager.dart';
import '../../../../../../core/theme/size/app_size.dart';
import '../../../../../../core/theme/text_theme/text_font_size.dart';
import '../../../../../../model/models/match_details/half.dart';
import '../../../../../global_widgets/expandable_collapsed_widget.dart';
import '../../../../../global_widgets/my_network_image.dart';
import '../events_widgets/match_current_position_box.dart';
import '../events_widgets/match_penalties_box.dart';
import '../events_widgets/match_substitution_box.dart';

class MatchEvents extends StatelessWidget {
  const MatchEvents({Key? key, this.isLive = false}) : super(key: key);
  final bool isLive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(AppSize.r8),
      ),
      child: GetBuilder<MatchDetailViewModel>(
        builder: (logic) {
          return Column(children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(AppSize.r8),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyNetworkImage(
                                  url: logic.matchCommentaries?.homeTeam?.logo,
                                  height: AppSize.h20,
                                  width: AppSize.w20,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    logic.matchCommentaries?.homeTeam?.name ??
                                        '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: ColorManager.instance.primary,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const VerticalDivider(thickness: 1),
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(AppSize.r8),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    logic.matchCommentaries?.awayTeam?.name ??
                                        '',
                                    textAlign: TextAlign.end,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: ColorManager.instance.primary,
                                        ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                MyNetworkImage(
                                  url: logic.matchCommentaries?.awayTeam?.logo,
                                  height: AppSize.h20,
                                  width: AppSize.w20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (isLive) ...[
              liveMatchBox(logic, context),
            ] else ...[
              if (logic.matchCommentaries?.halfCommentaries?.penalties
                      .isNotEmpty ??
                  false) ...[
                penaltiesBox(logic, context)
              ] else if ((logic.matchCommentaries?.halfCommentaries
                              ?.extraSecondHalf ??
                          [])
                      .isNotEmpty &&
                  (logic.matchCommentaries?.halfCommentaries?.penalties ?? [])
                      .isNotEmpty) ...[
                extraTimeBox(logic, context),
              ] else ...[
                normalBox(logic, context),
              ],
            ],
          ]);
        },
      ),
    );
  }

  Widget liveMatchBox(MatchDetailViewModel logic, BuildContext context) =>
      Column(
        children: <Widget>[
          ///penalties
          if (logic.matchCommentaries?.halfCommentaries?.penalties.isNotEmpty ??
              false) ...[
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shrinkWrap: true,
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  logic.matchCommentaries?.halfCommentaries?.penalties.length ??
                      0,
              separatorBuilder: (ctx, index) => const SizedBox(height: 8),
              itemBuilder: (ctx, index) {
                final Half? item =
                    logic.matchCommentaries?.halfCommentaries?.penalties[index];
                return MatchPenaltiesBox(
                  isHome: item?.isHomeTeam ?? false,
                  name: item?.player?.name ?? '',
                  penaltyStatus: item?.event == 'penalty',
                  playerUrl: item?.player?.image ?? '',
                );
              },
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 8),
                Text(
                  StringKeys.singleton.penalties.tr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorManager.instance.secondary,
                      ),
                ),
                const SizedBox(width: 5),
                SvgPicture.asset(ConstSvg.triangle),
                const SizedBox(width: 8),
              ],
            ),
            Divider(
                height: 2,
                thickness: 1,
                color: ColorManager.instance.dividerColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 8),
                RotatedBox(
                    quarterTurns: 2,
                    child: SvgPicture.asset(ConstSvg.triangle)),
                const SizedBox(width: 5),
                Text(
                  StringKeys.singleton.secondExtraHalf.tr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorManager.instance.secondary,
                      ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 8),
          ],

          ///second extra half
          if (logic.matchCommentaries?.halfCommentaries?.extraSecondHalf
                  .isNotEmpty ??
              false) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 8),
                Text(
                  StringKeys.singleton.secondExtraHalf.tr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorManager.instance.secondary,
                      ),
                ),
                const SizedBox(width: 5),
                RotatedBox(
                    quarterTurns: 2,
                    child: SvgPicture.asset(ConstSvg.triangle)),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 5),
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shrinkWrap: true,
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: logic.matchCommentaries?.halfCommentaries
                      ?.extraSecondHalf.length ??
                  0,
              separatorBuilder: (ctx, index) => const SizedBox(height: 8),
              itemBuilder: (ctx, index) {
                final Half? item = logic.matchCommentaries?.halfCommentaries
                    ?.extraSecondHalf[index];
                if (logic.matchCommentaries?.halfCommentaries
                        ?.extraSecondHalf[index].assistPlayer !=
                    null) {
                  return MatchSubstitutionBox(
                    isHome: item?.isHomeTeam ?? false,
                    minute: item?.originalMinutes.toString() ?? '',
                    playerIn: item?.assistPlayer?.name ?? '',
                    playerInUrl: item?.assistPlayer?.image,
                    playerOut: item?.player?.name ?? '',
                    playerOutUrl: item?.player?.image,
                  );
                } else {
                  return MatchCurrentPositionBox(
                    isHome: item?.isHomeTeam ?? false,
                    name: item?.player?.name,
                    description: item?.description,
                    minute: item?.originalMinutes.toString() ?? '',
                    playerUrl: item?.player?.image ?? '',
                    eventIcon: item?.icon,
                  );
                }
              },
            ),
            const SizedBox(height: 8),
          ],

          ///first extra half
          if (logic.matchCommentaries?.halfCommentaries?.extraFirstHalf
                  .isNotEmpty ??
              false) ...[
            Divider(
                height: 2,
                thickness: 1,
                color: ColorManager.instance.dividerColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 8),
                Text(
                  StringKeys.singleton.firstExtraHalf.tr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorManager.instance.secondary,
                      ),
                ),
                const SizedBox(width: 5),
                RotatedBox(
                    quarterTurns: 2,
                    child: SvgPicture.asset(ConstSvg.triangle)),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 5),
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shrinkWrap: true,
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: logic.matchCommentaries?.halfCommentaries
                      ?.extraFirstHalf.length ??
                  0,
              separatorBuilder: (ctx, index) => const SizedBox(height: 8),
              itemBuilder: (ctx, index) {
                final Half? item = logic
                    .matchCommentaries?.halfCommentaries?.extraFirstHalf[index];
                if (logic.matchCommentaries?.halfCommentaries
                        ?.extraFirstHalf[index].assistPlayer !=
                    null) {
                  return MatchSubstitutionBox(
                    isHome: item?.isHomeTeam ?? false,
                    minute: item?.originalMinutes.toString() ?? '',
                    playerIn: item?.player?.name ?? '',
                    playerInUrl: item?.player?.image,
                    playerOut: item?.assistPlayer?.name ?? '',
                    playerOutUrl: item?.assistPlayer?.image,
                  );
                } else {
                  return MatchCurrentPositionBox(
                    isHome: item?.isHomeTeam ?? false,
                    name: item?.player?.name,
                    description: item?.description,
                    minute: item?.originalMinutes.toString() ?? '',
                    playerUrl: item?.player?.image ?? '',
                    eventIcon: item?.icon,
                  );
                }
              },
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 8),
                Text(
                  StringKeys.singleton.firstExtraHalf.tr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorManager.instance.secondary,
                      ),
                ),
                const SizedBox(width: 5),
                SvgPicture.asset(ConstSvg.triangle),
                const SizedBox(width: 8),
              ],
            ),
            Divider(
                height: 2,
                thickness: 1,
                color: ColorManager.instance.dividerColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 8),
                RotatedBox(
                    quarterTurns: 2,
                    child: SvgPicture.asset(ConstSvg.triangle)),
                const SizedBox(width: 5),
                Text(
                  StringKeys.singleton.secondHalf.tr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorManager.instance.secondary,
                      ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 8),
          ],

          ///second half
          if (logic
                  .matchCommentaries?.halfCommentaries?.secondHalf.isNotEmpty ??
              false) ...[
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shrinkWrap: true,
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: logic
                      .matchCommentaries?.halfCommentaries?.secondHalf.length ??
                  0,
              separatorBuilder: (ctx, index) => const SizedBox(height: 8),
              itemBuilder: (ctx, index) {
                final Half? item = logic
                    .matchCommentaries?.halfCommentaries?.secondHalf[index];
                if (item?.assistPlayer != null) {
                  return MatchSubstitutionBox(
                    isHome: item?.isHomeTeam ?? false,
                    minute: item?.originalMinutes.toString() ?? '',
                    playerIn: item?.assistPlayer?.name ?? '',
                    playerInUrl: item?.assistPlayer?.image,
                    playerOut: item?.player?.name ?? '',
                    playerOutUrl: item?.player?.image,
                  );
                } else {
                  return MatchCurrentPositionBox(
                    isHome: item?.isHomeTeam ?? false,
                    description: item?.description,
                    minute: item?.originalMinutes.toString() ?? '',
                    playerUrl: item?.player?.image ?? '',
                    name: item?.player?.name ?? '',
                    eventIcon: item?.icon,
                  );
                }
              },
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 8),
                SvgPicture.asset(ConstSvg.triangle),
                const SizedBox(width: 5),
                Text(
                  StringKeys.singleton.secondHalf.tr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorManager.instance.secondary,
                      ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 5),
            Divider(
                height: 2,
                thickness: 1,
                color: ColorManager.instance.dividerColor),
            const SizedBox(height: 8),
          ],

          ///first half
          if (logic.matchCommentaries?.halfCommentaries?.firstHalf.isNotEmpty ??
              false) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 8),
                Text(
                  StringKeys.singleton.firstHalf.tr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorManager.instance.secondary,
                      ),
                ),
                const SizedBox(width: 5),
                RotatedBox(
                    quarterTurns: 2,
                    child: SvgPicture.asset(ConstSvg.triangle)),
                const SizedBox(width: 8),
              ],
            ),
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shrinkWrap: true,
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  logic.matchCommentaries?.halfCommentaries?.firstHalf.length ??
                      0,
              separatorBuilder: (ctx, index) => const SizedBox(height: 8),
              itemBuilder: (ctx, index) {
                final Half? item =
                    logic.matchCommentaries?.halfCommentaries?.firstHalf[index];
                if (logic.matchCommentaries?.halfCommentaries?.firstHalf[index]
                        .assistPlayer !=
                    null) {
                  return MatchSubstitutionBox(
                    isHome: item?.isHomeTeam ?? false,
                    minute: item?.originalMinutes.toString() ?? '',
                    playerIn: item?.assistPlayer?.name ?? '',
                    playerInUrl: item?.assistPlayer?.image,
                    playerOut: item?.player?.name ?? '',
                    playerOutUrl: item?.player?.image,
                  );
                } else {
                  return MatchCurrentPositionBox(
                    isHome: item?.isHomeTeam ?? false,
                    name: item?.player?.name,
                    description: item?.description,
                    minute: item?.originalMinutes.toString() ?? '',
                    playerUrl: item?.player?.image ?? '',
                    eventIcon: item?.icon,
                  );
                }
              },
            ),
            const SizedBox(height: 8),
          ] else ...[
            Center(
                child: Text(
              StringKeys.singleton.noEvents.tr,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: ColorManager.instance.secondary),
            ))
          ],
        ],
      );

  Widget normalBox(MatchDetailViewModel logic, BuildContext context) =>
      ExpandableCollapsedWidget(
        logic: logic,
        preview: Column(
          children: <Widget>[
            ///second half
            Text(
              StringKeys.singleton.endOfMatch.tr,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: FontSize.fontSize12,
                    color: ColorManager.instance.primary,
                  ),
            ),
            const SizedBox(height: 5),
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shrinkWrap: true,
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: logic
                      .matchCommentaries?.halfCommentaries?.secondHalf.length ??
                  0,
              separatorBuilder: (ctx, index) => const SizedBox(height: 8),
              itemBuilder: (ctx, index) {
                final Half? item = logic
                    .matchCommentaries?.halfCommentaries?.secondHalf[index];
                if (item?.assistPlayer != null) {
                  return MatchSubstitutionBox(
                    isHome: item?.isHomeTeam ?? false,
                    minute: item?.originalMinutes.toString() ?? '',
                    playerIn: item?.assistPlayer?.name ?? '',
                    playerInUrl: item?.assistPlayer?.image,
                    playerOut: item?.player?.name ?? '',
                    playerOutUrl: item?.player?.image,
                  );
                } else {
                  return MatchCurrentPositionBox(
                    isHome: item?.isHomeTeam ?? false,
                    description: item?.description,
                    minute: item?.originalMinutes.toString() ?? '',
                    playerUrl: item?.player?.image ?? '',
                    name: item?.player?.name ?? '',
                    eventIcon: item?.icon,
                  );
                }
              },
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 8),
                SvgPicture.asset(ConstSvg.triangle),
                const SizedBox(width: 6),
                Text(
                  StringKeys.singleton.secondHalf.tr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorManager.instance.secondary,
                      ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 5),
            Divider(
                height: 2,
                thickness: 1,
                color: ColorManager.instance.dividerColor),
            ExpandableButton(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: ColorManager.instance.hintColor,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                  ),
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    StringKeys.singleton.showMore.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.instance.secondary,
                        ),
                  ))),
            )
          ],
        ),
        expanded: Column(
          children: <Widget>[
            Text(
              StringKeys.singleton.endOfMatch.tr,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: FontSize.fontSize12,
                    color: ColorManager.instance.primary,
                  ),
            ),
            const SizedBox(height: 5),
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shrinkWrap: true,
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: logic
                      .matchCommentaries?.halfCommentaries?.secondHalf.length ??
                  0,
              separatorBuilder: (ctx, index) => const SizedBox(height: 8),
              itemBuilder: (ctx, index) {
                final Half? item = logic
                    .matchCommentaries?.halfCommentaries?.secondHalf[index];
                if (item?.assistPlayer != null) {
                  return MatchSubstitutionBox(
                    isHome: item?.isHomeTeam ?? false,
                    minute: item?.originalMinutes.toString() ?? '',
                    playerIn: item?.assistPlayer?.name ?? '',
                    playerInUrl: item?.assistPlayer?.image,
                    playerOut: item?.player?.name ?? '',
                    playerOutUrl: item?.player?.image,
                  );
                } else {
                  return MatchCurrentPositionBox(
                    isHome: item?.isHomeTeam ?? false,
                    description: item?.description,
                    minute: item?.originalMinutes.toString() ?? '',
                    playerUrl: item?.player?.image ?? '',
                    name: item?.player?.name ?? '',
                    eventIcon: item?.icon,
                  );
                }
              },
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 8),
                SvgPicture.asset(ConstSvg.triangle),
                const SizedBox(width: 5),
                Text(
                  StringKeys.singleton.secondHalf.tr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorManager.instance.secondary,
                      ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 5),
            Divider(
                height: 2,
                thickness: 1,
                color: ColorManager.instance.dividerColor),

            ///first half
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 8),
                Text(
                  StringKeys.singleton.firstHalf.tr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorManager.instance.secondary,
                      ),
                ),
                const SizedBox(width: 5),
                RotatedBox(
                    quarterTurns: 2,
                    child: SvgPicture.asset(ConstSvg.triangle)),
                const SizedBox(width: 8),
              ],
            ),
            if (logic.matchCommentaries?.halfCommentaries?.firstHalf.isEmpty ??
                false) ...[
              Center(
                  child: Text(
                StringKeys.singleton.noEvents.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: ColorManager.instance.secondary),
              ))
            ] else ...[
              ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shrinkWrap: true,
                reverse: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: logic.matchCommentaries?.halfCommentaries?.firstHalf
                        .length ??
                    0,
                separatorBuilder: (ctx, index) => const SizedBox(height: 8),
                itemBuilder: (ctx, index) {
                  final Half? item = logic
                      .matchCommentaries?.halfCommentaries?.firstHalf[index];
                  if (logic.matchCommentaries?.halfCommentaries
                          ?.firstHalf[index].assistPlayer !=
                      null) {
                    return MatchSubstitutionBox(
                      isHome: item?.isHomeTeam ?? false,
                      minute: item?.originalMinutes.toString() ?? '',
                      playerIn: item?.assistPlayer?.name ?? '',
                      playerInUrl: item?.assistPlayer?.image,
                      playerOut: item?.player?.name ?? '',
                      playerOutUrl: item?.player?.image,
                    );
                  } else {
                    return MatchCurrentPositionBox(
                      isHome: item?.isHomeTeam ?? false,
                      name: item?.player?.name,
                      description: item?.description,
                      minute: item?.originalMinutes.toString() ?? '',
                      playerUrl: item?.player?.image ?? '',
                      eventIcon: item?.icon,
                    );
                  }
                },
              ),
            ],

            const SizedBox(height: 8),
            ExpandableButton(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: ColorManager.instance.hintColor,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                  ),
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    StringKeys.singleton.showLess.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.instance.secondary,
                        ),
                  ))),
            )
          ],
        ),
      );

  Widget extraTimeBox(MatchDetailViewModel logic, BuildContext context) =>
      ExpandableCollapsedWidget(
        logic: logic,
        preview: Column(
          children: <Widget>[
            ///second extra half
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 8),
                Text(
                  StringKeys.singleton.secondExtraHalf.tr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorManager.instance.secondary,
                      ),
                ),
                const SizedBox(width: 5),
                SvgPicture.asset(ConstSvg.triangle),
                const SizedBox(width: 8),
              ],
            ),
            if (logic.matchCommentaries?.halfCommentaries?.extraSecondHalf
                    .isEmpty ??
                false) ...[
              Center(
                  child: Text(
                StringKeys.singleton.noEvents.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: ColorManager.instance.secondary),
              ))
            ] else ...[
              ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shrinkWrap: true,
                reverse: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: logic.matchCommentaries?.halfCommentaries
                        ?.extraSecondHalf.length ??
                    0,
                separatorBuilder: (ctx, index) => const SizedBox(height: 8),
                itemBuilder: (ctx, index) {
                  final Half? item = logic.matchCommentaries?.halfCommentaries
                      ?.extraSecondHalf[index];
                  if (logic.matchCommentaries?.halfCommentaries
                          ?.extraSecondHalf[index].assistPlayer !=
                      null) {
                    return MatchSubstitutionBox(
                      isHome: item?.isHomeTeam ?? false,
                      minute: item?.originalMinutes.toString() ?? '',
                      playerIn: item?.assistPlayer?.name ?? '',
                      playerInUrl: item?.assistPlayer?.image,
                      playerOut: item?.player?.name ?? '',
                      playerOutUrl: item?.player?.image,
                    );
                  } else {
                    return MatchCurrentPositionBox(
                      isHome: item?.isHomeTeam ?? false,
                      description: item?.description,
                      minute: item?.originalMinutes.toString() ?? '',
                      playerUrl: item?.player?.image ?? '',
                      eventIcon: item?.icon,
                    );
                  }
                },
              ),
            ],
            const SizedBox(height: 5),
            Divider(
                height: 2,
                thickness: 1,
                color: ColorManager.instance.dividerColor),
            ExpandableButton(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: ColorManager.instance.hintColor,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                  ),
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    StringKeys.singleton.showMore.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.instance.secondary,
                        ),
                  ))),
            )
          ],
        ),
        expanded: Column(
          children: <Widget>[
            ///second extra half
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 8),
                Text(
                  StringKeys.singleton.secondExtraHalf.tr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorManager.instance.secondary,
                      ),
                ),
                const SizedBox(width: 5),
                SvgPicture.asset(ConstSvg.triangle),
                const SizedBox(width: 8),
              ],
            ),
            if (logic.matchCommentaries?.halfCommentaries?.extraSecondHalf
                    .isEmpty ??
                false) ...[
              Center(
                  child: Text(
                StringKeys.singleton.noEvents.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: ColorManager.instance.secondary),
              ))
            ] else ...[
              ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shrinkWrap: true,
                reverse: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (ctx, index) => const SizedBox(height: 8),
                itemCount: logic.matchCommentaries?.halfCommentaries
                        ?.extraSecondHalf.length ??
                    0,
                itemBuilder: (ctx, index) {
                  final Half? item = logic.matchCommentaries?.halfCommentaries
                      ?.extraSecondHalf[index];
                  if (logic.matchCommentaries?.halfCommentaries
                          ?.extraSecondHalf[index].assistPlayer !=
                      null) {
                    return MatchSubstitutionBox(
                      isHome: item?.isHomeTeam ?? false,
                      minute: item?.originalMinutes.toString() ?? '',
                      playerIn: item?.assistPlayer?.name ?? '',
                      playerInUrl: item?.assistPlayer?.image,
                      playerOut: item?.player?.name ?? '',
                      playerOutUrl: item?.player?.image,
                    );
                  } else {
                    return MatchCurrentPositionBox(
                      isHome: item?.isHomeTeam ?? false,
                      description: item?.description,
                      minute: item?.originalMinutes.toString() ?? '',
                      playerUrl: item?.player?.image ?? '',
                      eventIcon: item?.icon,
                    );
                  }
                },
              ),
            ],
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 8),
                SvgPicture.asset(ConstSvg.triangle),
                const SizedBox(width: 6),
                Text(
                  StringKeys.singleton.penalties.tr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorManager.instance.secondary,
                      ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 5),
            Divider(
                height: 2,
                thickness: 1,
                color: ColorManager.instance.dividerColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 8),
                Text(
                  StringKeys.singleton.firstExtraHalf.tr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorManager.instance.secondary,
                      ),
                ),
                const SizedBox(width: 5),
                RotatedBox(
                    quarterTurns: 2,
                    child: SvgPicture.asset(ConstSvg.triangle)),
                const SizedBox(width: 8),
              ],
            ),

            ///first extra half
            if (logic.matchCommentaries?.halfCommentaries?.extraFirstHalf
                    .isEmpty ??
                false) ...[
              Center(
                  child: Text(
                StringKeys.singleton.noEvents.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: ColorManager.instance.secondary),
              ))
            ] else ...[
              ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                separatorBuilder: (ctx, index) => const SizedBox(height: 8),
                shrinkWrap: true,
                reverse: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: logic.matchCommentaries?.halfCommentaries
                        ?.extraFirstHalf.length ??
                    0,
                itemBuilder: (ctx, index) {
                  final Half? item = logic.matchCommentaries?.halfCommentaries
                      ?.extraFirstHalf[index];
                  if (logic.matchCommentaries?.halfCommentaries
                          ?.extraFirstHalf[index].assistPlayer !=
                      null) {
                    return MatchSubstitutionBox(
                      isHome: item?.isHomeTeam ?? false,
                      minute: item?.originalMinutes.toString() ?? '',
                      playerIn: item?.assistPlayer?.name ?? '',
                      playerInUrl: item?.assistPlayer?.image,
                      playerOut: item?.player?.name ?? '',
                      playerOutUrl: item?.player?.image,
                    );
                  } else {
                    return MatchCurrentPositionBox(
                      isHome: item?.isHomeTeam ?? false,
                      description: item?.description,
                      minute: item?.originalMinutes.toString() ?? '',
                      playerUrl: item?.player?.image ?? '',
                      eventIcon: item?.icon,
                    );
                  }
                },
              ),
            ],
            const SizedBox(height: 8),

            ///second half

            if (logic.matchCommentaries?.halfCommentaries?.secondHalf.isEmpty ??
                false) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 8),
                  Text(
                    StringKeys.singleton.secondHalf.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorManager.instance.secondary,
                        ),
                  ),
                  const SizedBox(width: 5),
                  RotatedBox(
                      quarterTurns: 2,
                      child: SvgPicture.asset(ConstSvg.triangle)),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 5),
              Center(
                  child: Text(
                StringKeys.singleton.noEvents.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: ColorManager.instance.secondary),
              ))
            ] else ...[
              Divider(
                  height: 2,
                  thickness: 1,
                  color: ColorManager.instance.dividerColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 8),
                  Text(
                    StringKeys.singleton.secondHalf.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorManager.instance.secondary,
                        ),
                  ),
                  const SizedBox(width: 5),
                  RotatedBox(
                      quarterTurns: 2,
                      child: SvgPicture.asset(ConstSvg.triangle)),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 5),
              ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                separatorBuilder: (ctx, index) => const SizedBox(height: 8),
                shrinkWrap: true,
                reverse: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: logic.matchCommentaries?.halfCommentaries?.secondHalf
                        .length ??
                    0,
                itemBuilder: (ctx, index) {
                  final Half? item = logic
                      .matchCommentaries?.halfCommentaries?.secondHalf[index];
                  if (logic.matchCommentaries?.halfCommentaries
                          ?.secondHalf[index].assistPlayer !=
                      null) {
                    return MatchSubstitutionBox(
                      isHome: item?.isHomeTeam ?? false,
                      minute: item?.originalMinutes.toString() ?? '',
                      playerIn: item?.assistPlayer?.name ?? '',
                      playerInUrl: item?.assistPlayer?.image,
                      playerOut: item?.player?.name ?? '',
                      playerOutUrl: item?.player?.image,
                    );
                  } else {
                    return MatchCurrentPositionBox(
                      isHome: item?.isHomeTeam ?? false,
                      description: item?.description,
                      minute: item?.originalMinutes.toString() ?? '',
                      playerUrl: item?.player?.image ?? '',
                      eventIcon: item?.icon,
                    );
                  }
                },
              ),
            ],

            ///first half

            if (logic.matchCommentaries?.halfCommentaries?.firstHalf.isEmpty ??
                false) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 8),
                  Text(
                    StringKeys.singleton.firstHalf.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorManager.instance.secondary,
                        ),
                  ),
                  const SizedBox(width: 5),
                  RotatedBox(
                      quarterTurns: 2,
                      child: SvgPicture.asset(ConstSvg.triangle)),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 5),
              Center(
                  child: Text(
                StringKeys.singleton.noEvents.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: ColorManager.instance.secondary),
              ))
            ] else ...[
              Divider(
                  height: 2,
                  thickness: 1,
                  color: ColorManager.instance.dividerColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 8),
                  Text(
                    StringKeys.singleton.firstHalf.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorManager.instance.secondary,
                        ),
                  ),
                  const SizedBox(width: 5),
                  RotatedBox(
                      quarterTurns: 2,
                      child: SvgPicture.asset(ConstSvg.triangle)),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 5),
              ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                separatorBuilder: (ctx, index) => const SizedBox(height: 8),
                shrinkWrap: true,
                reverse: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: logic.matchCommentaries?.halfCommentaries?.firstHalf
                        .length ??
                    0,
                itemBuilder: (ctx, index) {
                  final Half? item = logic
                      .matchCommentaries?.halfCommentaries?.firstHalf[index];
                  if (logic.matchCommentaries?.halfCommentaries
                          ?.firstHalf[index].assistPlayer !=
                      null) {
                    return MatchSubstitutionBox(
                      isHome: item?.isHomeTeam ?? false,
                      minute: item?.originalMinutes.toString() ?? '',
                      playerIn: item?.assistPlayer?.name ?? '',
                      playerInUrl: item?.assistPlayer?.image,
                      playerOut: item?.player?.name ?? '',
                      playerOutUrl: item?.player?.image,
                    );
                  } else {
                    return MatchCurrentPositionBox(
                      isHome: item?.isHomeTeam ?? false,
                      description: item?.description,
                      minute: item?.originalMinutes.toString() ?? '',
                      playerUrl: item?.player?.image ?? '',
                      eventIcon: item?.icon,
                    );
                  }
                },
              ),
            ],
            ExpandableButton(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: ColorManager.instance.hintColor,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                  ),
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    StringKeys.singleton.showMore.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.instance.secondary,
                        ),
                  ))),
            )
          ],
        ),
      );

  Widget penaltiesBox(MatchDetailViewModel logic, BuildContext context) =>
      ExpandableCollapsedWidget(
        logic: logic,
        preview: Column(
          children: <Widget>[
            Text(
              StringKeys.singleton.penalties.tr,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorManager.instance.secondary,
                  ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: AppSize.w30,
                          mainAxisExtent: AppSize.h30,
                          crossAxisSpacing: AppSize.w4,
                          mainAxisSpacing: AppSize.h4,
                        ),
                        itemCount: logic.matchCommentaries?.homeTeamCommentaries
                                ?.penalties.length ??
                            0,
                        itemBuilder: (BuildContext ctx, index) {
                          final Half? item = logic.matchCommentaries
                              ?.homeTeamCommentaries?.penalties[index];
                          final bool isGoal = item?.event == 'penalty';
                          return Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isGoal
                                    ? ColorManager.instance.green
                                    : ColorManager.instance.red),
                            child: Center(
                              child: Text((index + 1).toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.instance.white,
                                      )),
                            ),
                          );
                        }),
                  ),
                  SizedBox(width: AppSize.w25),

                  Expanded(
                    child: GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: AppSize.w30,
                          mainAxisExtent: AppSize.h30,
                          crossAxisSpacing: AppSize.w4,
                          mainAxisSpacing: AppSize.h4,
                        ),
                        itemCount: logic.matchCommentaries?.awayTeamCommentaries
                                ?.penalties.length ??
                            0,
                        itemBuilder: (BuildContext ctx, index) {
                          final Half? item = logic.matchCommentaries
                              ?.awayTeamCommentaries?.penalties[index];
                          final bool isGoal = item?.event == 'penalty';
                          return Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isGoal
                                    ? ColorManager.instance.green
                                    : ColorManager.instance.red),
                            child: Center(
                              child: Text((index + 1).toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.instance.white,
                                      )),
                            ),
                          );
                        }),
                  ),
                  // Expanded(
                  //   child: SizedBox(
                  //     height: 40,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: [
                  //         ListView.separated(
                  //           shrinkWrap: true,
                  //           scrollDirection: Axis.horizontal,
                  //           itemCount: logic.matchCommentaries
                  //               ?.homeTeamCommentaries?.penalties.length ??
                  //               0,
                  //           separatorBuilder: (context, index) =>
                  //           const SizedBox(width: 4),
                  //           itemBuilder: (context, index) {
                  //             Half? item = logic.matchCommentaries
                  //                 ?.homeTeamCommentaries?.penalties[index];
                  //             bool isGoal = item?.event == 'penalty';
                  //             return Container(
                  //               padding: const EdgeInsets.all(10),
                  //               decoration: BoxDecoration(
                  //                   shape: BoxShape.circle,
                  //                   color: isGoal
                  //                       ? ColorManager.instance.green
                  //                       : ColorManager.instance.red),
                  //               child: Center(
                  //                 child: Text((index + 1).toString(),
                  //                     style: Theme.of(context)
                  //                         .textTheme
                  //                         .bodyMedium
                  //                         ?.copyWith(
                  //                       fontWeight: FontWeight.bold,
                  //                       color: ColorManager.instance.white,
                  //                     )),
                  //               ),
                  //             );
                  //           },
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Expanded(
                  //   child: SizedBox(
                  //     height: 40,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.end,
                  //       children: [
                  //         ListView.separated(
                  //           shrinkWrap: true,
                  //           scrollDirection: Axis.horizontal,
                  //           itemCount: logic.matchCommentaries
                  //               ?.awayTeamCommentaries?.penalties.length ??
                  //               0,
                  //           itemBuilder: (context, index) {
                  //             Half? item = logic.matchCommentaries
                  //                 ?.awayTeamCommentaries?.penalties[index];
                  //             bool isGoal = item?.event == 'penalty';
                  //             return Container(
                  //               padding: const EdgeInsets.all(10),
                  //               decoration: BoxDecoration(
                  //                   shape: BoxShape.circle,
                  //                   color: isGoal
                  //                       ? ColorManager.instance.green
                  //                       : ColorManager.instance.red),
                  //               child: Center(
                  //                 child: Text((index + 1).toString(),
                  //                     style: Theme.of(context)
                  //                         .textTheme
                  //                         .bodyMedium
                  //                         ?.copyWith(
                  //                       fontWeight: FontWeight.bold,
                  //                       color: ColorManager.instance.white,
                  //                     )),
                  //               ),
                  //             );
                  //           },
                  //           separatorBuilder: (context, index) =>
                  //           const SizedBox(width: 4),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Expanded(
                  //   child: Wrap(
                  //     direction: Axis.horizontal,
                  //     runSpacing: 5,
                  //     children: List.generate(
                  //         logic.matchCommentaries?.homeTeamCommentaries
                  //                 ?.penalties.length ??
                  //             0, (index) {
                  //       Half? item = logic.matchCommentaries
                  //           ?.homeTeamCommentaries?.penalties[index];
                  //       bool isGoal = item?.event == 'penalty';
                  //       return Container(
                  //         padding: const EdgeInsets.all(10),
                  //         decoration: BoxDecoration(
                  //             shape: BoxShape.circle,
                  //             color: isGoal
                  //                 ? ColorManager.instance.green
                  //                 : ColorManager.instance.red),
                  //         child: Center(
                  //           child: Text((index + 1).toString(),
                  //               style: Theme.of(context)
                  //                   .textTheme
                  //                   .bodyMedium
                  //                   ?.copyWith(
                  //                     fontWeight: FontWeight.bold,
                  //                     color: ColorManager.instance.white,
                  //                   )),
                  //         ),
                  //       );
                  //     }),
                  //   ),
                  // ),
                  // Spacer(),
                  // Wrap(
                  //   children: List.generate(
                  //       logic.matchCommentaries?.awayTeamCommentaries
                  //           ?.penalties.length ??
                  //           0, (index) {
                  //     Half? item = logic.matchCommentaries
                  //         ?.awayTeamCommentaries?.penalties[index];
                  //     bool isGoal = item?.event == 'penalty';
                  //     return Container(
                  //       padding: const EdgeInsets.all(10),
                  //       decoration: BoxDecoration(
                  //           shape: BoxShape.circle,
                  //           color: isGoal
                  //               ? ColorManager.instance.green
                  //               : ColorManager.instance.red),
                  //       child: Center(
                  //         child: Text((index + 1).toString(),
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .bodyMedium
                  //                 ?.copyWith(
                  //               fontWeight: FontWeight.bold,
                  //               color: ColorManager.instance.white,
                  //             )),
                  //       ),
                  //     );
                  //   }),
                  // ),
                  //
                ],
              ),
            ),
            const SizedBox(height: 5),

            ///penalties
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shrinkWrap: true,
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  logic.matchCommentaries?.halfCommentaries?.penalties.length ??
                      0,
              separatorBuilder: (ctx, index) => const SizedBox(height: 8),
              itemBuilder: (ctx, index) {
                final Half? item =
                    logic.matchCommentaries?.halfCommentaries?.penalties[index];
                return MatchPenaltiesBox(
                  isHome: item?.isHomeTeam ?? false,
                  name: item?.player?.name ?? '',
                  penaltyStatus: item?.event == 'penalty',
                  playerUrl: item?.player?.image ?? '',
                );
              },
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 8),
                SvgPicture.asset(ConstSvg.triangle),
                const SizedBox(width: 6),
                Text(
                  StringKeys.singleton.penalties.tr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorManager.instance.secondary,
                      ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 5),
            Divider(
                height: 2,
                thickness: 1,
                color: ColorManager.instance.dividerColor),
            ExpandableButton(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: ColorManager.instance.hintColor,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                  ),
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    StringKeys.singleton.showMore.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.instance.secondary,
                        ),
                  ))),
            )
          ],
        ),
        expanded: Column(
          children: <Widget>[
            Text(
              StringKeys.singleton.penalties.tr,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorManager.instance.secondary,
                  ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: AppSize.w30,
                          mainAxisExtent: AppSize.h30,
                          crossAxisSpacing: AppSize.w4,
                          mainAxisSpacing: AppSize.h4,
                        ),
                        itemCount: logic.matchCommentaries?.homeTeamCommentaries
                                ?.penalties.length ??
                            0,
                        itemBuilder: (BuildContext ctx, index) {
                          final Half? item = logic.matchCommentaries
                              ?.homeTeamCommentaries?.penalties[index];
                          final bool isGoal = item?.event == 'penalty';
                          return Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isGoal
                                    ? ColorManager.instance.green
                                    : ColorManager.instance.red),
                            child: Center(
                              child: Text((index + 1).toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.instance.white,
                                      )),
                            ),
                          );
                        }),
                  ),
                  SizedBox(width: AppSize.w25),

                  Expanded(
                    child: GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: AppSize.w30,
                          mainAxisExtent: AppSize.h30,
                          crossAxisSpacing: AppSize.w4,
                          mainAxisSpacing: AppSize.h4,
                        ),
                        itemCount: logic.matchCommentaries?.awayTeamCommentaries
                                ?.penalties.length ??
                            0,
                        itemBuilder: (BuildContext ctx, index) {
                          final Half? item = logic.matchCommentaries
                              ?.awayTeamCommentaries?.penalties[index];
                          final bool isGoal = item?.event == 'penalty';
                          return Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isGoal
                                    ? ColorManager.instance.green
                                    : ColorManager.instance.red),
                            child: Center(
                              child: Text((index + 1).toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.instance.white,
                                      )),
                            ),
                          );
                        }),
                  ),
                  // Expanded(
                  //   child: SizedBox(
                  //     height: 40,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: [
                  //         ListView.separated(
                  //           shrinkWrap: true,
                  //           scrollDirection: Axis.horizontal,
                  //           itemCount: logic.matchCommentaries
                  //               ?.homeTeamCommentaries?.penalties.length ??
                  //               0,
                  //           separatorBuilder: (context, index) =>
                  //           const SizedBox(width: 4),
                  //           itemBuilder: (context, index) {
                  //             Half? item = logic.matchCommentaries
                  //                 ?.homeTeamCommentaries?.penalties[index];
                  //             bool isGoal = item?.event == 'penalty';
                  //             return Container(
                  //               padding: const EdgeInsets.all(10),
                  //               decoration: BoxDecoration(
                  //                   shape: BoxShape.circle,
                  //                   color: isGoal
                  //                       ? ColorManager.instance.green
                  //                       : ColorManager.instance.red),
                  //               child: Center(
                  //                 child: Text((index + 1).toString(),
                  //                     style: Theme.of(context)
                  //                         .textTheme
                  //                         .bodyMedium
                  //                         ?.copyWith(
                  //                       fontWeight: FontWeight.bold,
                  //                       color: ColorManager.instance.white,
                  //                     )),
                  //               ),
                  //             );
                  //           },
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Expanded(
                  //   child: SizedBox(
                  //     height: 40,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.end,
                  //       children: [
                  //         ListView.separated(
                  //           shrinkWrap: true,
                  //           scrollDirection: Axis.horizontal,
                  //           itemCount: logic.matchCommentaries
                  //               ?.awayTeamCommentaries?.penalties.length ??
                  //               0,
                  //           itemBuilder: (context, index) {
                  //             Half? item = logic.matchCommentaries
                  //                 ?.awayTeamCommentaries?.penalties[index];
                  //             bool isGoal = item?.event == 'penalty';
                  //             return Container(
                  //               padding: const EdgeInsets.all(10),
                  //               decoration: BoxDecoration(
                  //                   shape: BoxShape.circle,
                  //                   color: isGoal
                  //                       ? ColorManager.instance.green
                  //                       : ColorManager.instance.red),
                  //               child: Center(
                  //                 child: Text((index + 1).toString(),
                  //                     style: Theme.of(context)
                  //                         .textTheme
                  //                         .bodyMedium
                  //                         ?.copyWith(
                  //                       fontWeight: FontWeight.bold,
                  //                       color: ColorManager.instance.white,
                  //                     )),
                  //               ),
                  //             );
                  //           },
                  //           separatorBuilder: (context, index) =>
                  //           const SizedBox(width: 4),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Expanded(
                  //   child: Wrap(
                  //     direction: Axis.horizontal,
                  //     runSpacing: 5,
                  //     children: List.generate(
                  //         logic.matchCommentaries?.homeTeamCommentaries
                  //                 ?.penalties.length ??
                  //             0, (index) {
                  //       Half? item = logic.matchCommentaries
                  //           ?.homeTeamCommentaries?.penalties[index];
                  //       bool isGoal = item?.event == 'penalty';
                  //       return Container(
                  //         padding: const EdgeInsets.all(10),
                  //         decoration: BoxDecoration(
                  //             shape: BoxShape.circle,
                  //             color: isGoal
                  //                 ? ColorManager.instance.green
                  //                 : ColorManager.instance.red),
                  //         child: Center(
                  //           child: Text((index + 1).toString(),
                  //               style: Theme.of(context)
                  //                   .textTheme
                  //                   .bodyMedium
                  //                   ?.copyWith(
                  //                     fontWeight: FontWeight.bold,
                  //                     color: ColorManager.instance.white,
                  //                   )),
                  //         ),
                  //       );
                  //     }),
                  //   ),
                  // ),
                  // Spacer(),
                  // Wrap(
                  //   children: List.generate(
                  //       logic.matchCommentaries?.awayTeamCommentaries
                  //           ?.penalties.length ??
                  //           0, (index) {
                  //     Half? item = logic.matchCommentaries
                  //         ?.awayTeamCommentaries?.penalties[index];
                  //     bool isGoal = item?.event == 'penalty';
                  //     return Container(
                  //       padding: const EdgeInsets.all(10),
                  //       decoration: BoxDecoration(
                  //           shape: BoxShape.circle,
                  //           color: isGoal
                  //               ? ColorManager.instance.green
                  //               : ColorManager.instance.red),
                  //       child: Center(
                  //         child: Text((index + 1).toString(),
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .bodyMedium
                  //                 ?.copyWith(
                  //               fontWeight: FontWeight.bold,
                  //               color: ColorManager.instance.white,
                  //             )),
                  //       ),
                  //     );
                  //   }),
                  // ),
                  //
                ],
              ),
            ),
            const SizedBox(height: 5),

            ///penalties
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shrinkWrap: true,
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  logic.matchCommentaries?.halfCommentaries?.penalties.length ??
                      0,
              separatorBuilder: (ctx, index) => const SizedBox(height: 8),
              itemBuilder: (ctx, index) {
               final Half? item =
                    logic.matchCommentaries?.halfCommentaries?.penalties[index];
                return MatchPenaltiesBox(
                  isHome: item?.isHomeTeam ?? false,
                  name: item?.player?.name ?? '',
                  penaltyStatus: item?.event == 'penalty',
                  playerUrl: item?.player?.image ?? '',
                );
              },
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 8),
                SvgPicture.asset(ConstSvg.triangle),
                const SizedBox(width: 6),
                Text(
                  StringKeys.singleton.penalties.tr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorManager.instance.secondary,
                      ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 5),
            Divider(
                height: 2,
                thickness: 1,
                color: ColorManager.instance.dividerColor),

            ///second extra half

            if (logic.matchCommentaries?.halfCommentaries?.extraSecondHalf
                    .isEmpty ??
                false) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 8),
                  Text(
                    StringKeys.singleton.secondExtraHalf.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorManager.instance.secondary,
                        ),
                  ),
                  const SizedBox(width: 5),
                  RotatedBox(
                      quarterTurns: 2,
                      child: SvgPicture.asset(ConstSvg.triangle)),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 5),
              Center(
                  child: Text(
                StringKeys.singleton.noEvents.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: ColorManager.instance.secondary),
              ))
            ] else ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 8),
                  Text(
                    StringKeys.singleton.secondExtraHalf.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorManager.instance.secondary,
                        ),
                  ),
                  const SizedBox(width: 5),
                  RotatedBox(
                      quarterTurns: 2,
                      child: SvgPicture.asset(ConstSvg.triangle)),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 5),
              ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shrinkWrap: true,
                reverse: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: logic.matchCommentaries?.halfCommentaries
                        ?.extraSecondHalf.length ??
                    0,
                separatorBuilder: (ctx, index) => const SizedBox(height: 8),
                itemBuilder: (ctx, index) {
                 final Half? item = logic.matchCommentaries?.halfCommentaries
                      ?.extraSecondHalf[index];
                  if (logic.matchCommentaries?.halfCommentaries
                          ?.extraSecondHalf[index].assistPlayer !=
                      null) {
                    return MatchSubstitutionBox(
                      isHome: item?.isHomeTeam ?? false,
                      minute: item?.originalMinutes.toString() ?? '',
                      playerIn: item?.assistPlayer?.name ?? '',
                      playerInUrl: item?.assistPlayer?.image,
                      playerOut: item?.player?.name ?? '',
                      playerOutUrl: item?.player?.image,
                    );
                  } else {
                    return MatchCurrentPositionBox(
                      isHome: item?.isHomeTeam ?? false,
                      name: item?.player?.name,
                      description: item?.description,
                      minute: item?.originalMinutes.toString() ?? '',
                      playerUrl: item?.player?.image ?? '',
                      eventIcon: item?.icon,
                    );
                  }
                },
              ),
            ],

            ///first extra half

            if (logic.matchCommentaries?.halfCommentaries?.extraFirstHalf
                    .isEmpty ??
                false) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 8),
                  Text(
                    StringKeys.singleton.firstExtraHalf.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorManager.instance.secondary,
                        ),
                  ),
                  const SizedBox(width: 5),
                  RotatedBox(
                      quarterTurns: 2,
                      child: SvgPicture.asset(ConstSvg.triangle)),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 5),
              Center(
                  child: Text(
                StringKeys.singleton.noEvents.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: ColorManager.instance.secondary),
              ))
            ] else ...[
              Divider(
                  height: 2,
                  thickness: 1,
                  color: ColorManager.instance.dividerColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 8),
                  Text(
                    StringKeys.singleton.firstExtraHalf.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorManager.instance.secondary,
                        ),
                  ),
                  const SizedBox(width: 5),
                  RotatedBox(
                      quarterTurns: 2,
                      child: SvgPicture.asset(ConstSvg.triangle)),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 5),
              ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shrinkWrap: true,
                reverse: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: logic.matchCommentaries?.halfCommentaries
                        ?.extraFirstHalf.length ??
                    0,
                separatorBuilder: (ctx, index) => const SizedBox(height: 8),
                itemBuilder: (ctx, index) {
                 final Half? item = logic.matchCommentaries?.halfCommentaries
                      ?.extraFirstHalf[index];
                  if (logic.matchCommentaries?.halfCommentaries
                          ?.extraFirstHalf[index].assistPlayer !=
                      null) {
                    return MatchSubstitutionBox(
                      isHome: item?.isHomeTeam ?? false,
                      minute: item?.originalMinutes.toString() ?? '',
                      playerIn: item?.assistPlayer?.name ?? '',
                      playerInUrl: item?.assistPlayer?.image,
                      playerOut: item?.player?.name ?? '',
                      playerOutUrl: item?.player?.image,
                    );
                  } else {
                    return MatchCurrentPositionBox(
                      isHome: item?.isHomeTeam ?? false,
                      name: item?.player?.name,
                      description: item?.description,
                      minute: item?.originalMinutes.toString() ?? '',
                      playerUrl: item?.player?.image ?? '',
                      eventIcon: item?.icon,
                    );
                  }
                },
              ),
            ],
            const SizedBox(height: 8),

            ///second half
            if (logic.matchCommentaries?.halfCommentaries?.secondHalf.isEmpty ??
                false) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 8),
                  Text(
                    StringKeys.singleton.secondHalf.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorManager.instance.secondary,
                        ),
                  ),
                  const SizedBox(width: 5),
                  RotatedBox(
                      quarterTurns: 2,
                      child: SvgPicture.asset(ConstSvg.triangle)),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 5),
              Center(
                  child: Text(
                StringKeys.singleton.noEvents.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: ColorManager.instance.secondary),
              ))
            ] else ...[
              Divider(
                  height: 2,
                  thickness: 1,
                  color: ColorManager.instance.dividerColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 8),
                  Text(
                    StringKeys.singleton.secondHalf.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorManager.instance.secondary,
                        ),
                  ),
                  const SizedBox(width: 5),
                  RotatedBox(
                      quarterTurns: 2,
                      child: SvgPicture.asset(ConstSvg.triangle)),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 5),
              ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shrinkWrap: true,
                reverse: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: logic.matchCommentaries?.halfCommentaries?.secondHalf
                        .length ??
                    0,
                separatorBuilder: (ctx, index) => const SizedBox(height: 8),
                itemBuilder: (ctx, index) {
                 final Half? item = logic
                      .matchCommentaries?.halfCommentaries?.secondHalf[index];
                  if (logic.matchCommentaries?.halfCommentaries
                          ?.secondHalf[index].assistPlayer !=
                      null) {
                    return MatchSubstitutionBox(
                      isHome: item?.isHomeTeam ?? false,
                      minute: item?.originalMinutes.toString() ?? '',
                      playerIn: item?.assistPlayer?.name ?? '',
                      playerInUrl: item?.assistPlayer?.image,
                      playerOut: item?.player?.name ?? '',
                      playerOutUrl: item?.player?.image,
                    );
                  } else {
                    return MatchCurrentPositionBox(
                      isHome: item?.isHomeTeam ?? false,
                      name: item?.player?.name,
                      description: item?.description,
                      minute: item?.originalMinutes.toString() ?? '',
                      playerUrl: item?.player?.image ?? '',
                      eventIcon: item?.icon,
                    );
                  }
                },
              ),
            ],
            const SizedBox(height: 8),

            ///first half

            if (logic.matchCommentaries?.halfCommentaries?.firstHalf.isEmpty ??
                false) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 8),
                  Text(
                    StringKeys.singleton.firstHalf.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorManager.instance.secondary,
                        ),
                  ),
                  const SizedBox(width: 5),
                  RotatedBox(
                      quarterTurns: 2,
                      child: SvgPicture.asset(ConstSvg.triangle)),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 5),
              Center(
                  child: Text(
                StringKeys.singleton.noEvents.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: ColorManager.instance.secondary),
              ))
            ] else ...[
              Divider(
                  height: 2,
                  thickness: 1,
                  color: ColorManager.instance.dividerColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 8),
                  Text(
                    StringKeys.singleton.firstHalf.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorManager.instance.secondary,
                        ),
                  ),
                  const SizedBox(width: 5),
                  RotatedBox(
                      quarterTurns: 2,
                      child: SvgPicture.asset(ConstSvg.triangle)),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 5),
              ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shrinkWrap: true,
                reverse: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: logic.matchCommentaries?.halfCommentaries?.firstHalf
                        .length ??
                    0,
                separatorBuilder: (ctx, index) => const SizedBox(height: 8),
                itemBuilder: (ctx, index) {
                 final Half? item = logic
                      .matchCommentaries?.halfCommentaries?.firstHalf[index];
                  if (logic.matchCommentaries?.halfCommentaries
                          ?.firstHalf[index].assistPlayer !=
                      null) {
                    return MatchSubstitutionBox(
                      isHome: item?.isHomeTeam ?? false,
                      minute: item?.originalMinutes.toString() ?? '',
                      playerIn: item?.assistPlayer?.name ?? '',
                      playerInUrl: item?.assistPlayer?.image,
                      playerOut: item?.player?.name ?? '',
                      playerOutUrl: item?.player?.image,
                    );
                  } else {
                    return MatchCurrentPositionBox(
                      isHome: item?.isHomeTeam ?? false,
                      name: item?.player?.name,
                      description: item?.description,
                      minute: item?.originalMinutes.toString() ?? '',
                      playerUrl: item?.player?.image ?? '',
                      eventIcon: item?.icon,
                    );
                  }
                },
              ),
            ],

            const SizedBox(height: 10),
            ExpandableButton(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: ColorManager.instance.hintColor,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                  ),
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    StringKeys.singleton.showLess.tr,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.instance.secondary,
                        ),
                  ))),
            )
          ],
        ),
      );
}
