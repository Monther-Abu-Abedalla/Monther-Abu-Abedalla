import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_font_size.dart';
import 'package:taktikat/feature/view/screens/app/match_details/widgets/appbar_widgets/sliver_appbar_delegate.dart';
import 'package:taktikat/utils/constants/const_svgs.dart';
import 'package:taktikat/utils/date/date_time_util.dart';
import 'package:taktikat/utils/localization/string_keys.dart';

import '../../../../../../core/theme/size/app_size.dart';
import '../../../../../../model/enums/match_status.dart';
import '../../../../../../model/models/match_details/match_details_model.dart';
import '../../../../../global_widgets/my_network_image.dart';
import 'team_header.dart';
import 'custom_flexible_space.dart';

class SliverCustomAppBar extends StatelessWidget {
  const SliverCustomAppBar({
    Key? key,
    this.maxHeight,
    this.minHeight,
    required this.scrollController,
    required this.profileAvatarShift,
    required this.profileAvatarDiameter,
    required this.matchDetails,
  }) : super(key: key);

  final MatchDetails? matchDetails;
  final double? maxHeight;
  final double? minHeight;
  final ScrollController scrollController;
  final double profileAvatarDiameter;
  final double profileAvatarShift;

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    final maxAppBarHeight = maxHeight ??
        MediaQuery.of(context).size.height * (isPortrait ? 0.27 : 0.45);

    final minAppBarHeight = minHeight ??
        MediaQuery.of(context).padding.top +
            MediaQuery.of(context).size.height * (isPortrait ? 0.15 : 0.28);
    return AnimatedBuilder(
      animation: scrollController,
      builder: ((context, child) {
        return SliverPersistentHeader(
          pinned: true,
          delegate: SliverAppBarDelegate(
            maxHeight: maxAppBarHeight,
            minHeight: minAppBarHeight,
            builder: (context, shrinkOffset) {
              // final double shrinkToMaxAppBarHeightRatio =
              //     shrinkOffset / maxAppBarHeight;
              final double maxHeightBottomEdgeToMinHeightAppbarHitRatio =
                  (shrinkOffset / (maxAppBarHeight - minAppBarHeight))
                      .clamp(0, 1);

              final isAppbarActive =
                  maxHeightBottomEdgeToMinHeightAppbarHitRatio >= 1;
              final double minHeightBottomEdgeToTopHit = isAppbarActive
                  ? (maxAppBarHeight - shrinkOffset) / minAppBarHeight
                  : 0;
              isAppbarActive ? 1 - minHeightBottomEdgeToTopHit : 0;

              final offset = scrollController.offset;
              final double appbarTitleToTopratio = (1 -
                      ((maxAppBarHeight +

                              /// adjusted offset to make the title appear when the profile name and userid are almost at the
                              /// bottom edge of the app bar in min-height state
                              profileAvatarDiameter / 2 +
                              profileAvatarShift -
                              (offset)) /
                          minAppBarHeight))
                  .clamp(-1, 1.0);
              final isAppbarTitleActive = appbarTitleToTopratio >= 0;
              final double appbarTitleOpacity =
                  isAppbarTitleActive ? appbarTitleToTopratio : 0;
              // log(minHeightBottomEdgeToTopHit.toString());
              // Logger().i(appbarTitleToTopratio.abs());
              final childrens = [
                CustomFlexibleSpace(
                    titleOpacity: appbarTitleOpacity,
                    matchDetails: matchDetails),
                Opacity(
                  opacity: (appbarTitleToTopratio.abs() - 0.1).abs(),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                //todo refactor this code
                                // Expanded(
                                //   child: Column(
                                //     children: [
                                //       TeamHeader(
                                //         teamName: matchDetails
                                //             ?.homeTeam?.name ??
                                //             StringKeys.singleton.homeTeam.tr,
                                //         teamLogo:
                                //         matchDetails?.homeTeam?.logo ?? '',
                                //       ),
                                //       SizedBox(
                                //         height: AppSize.h65,
                                //         child: ListView.separated(
                                //           shrinkWrap: true,
                                //           itemCount: matchDetails
                                //               ?.homePlayersGoals?.length ??
                                //               0,
                                //           separatorBuilder: (context, index) =>
                                //           const SizedBox(height: 4),
                                //           itemBuilder: (context, index) =>
                                //               GoalsStatsBox(
                                //                   name: matchDetails
                                //                       ?.homePlayersGoals?[
                                //                   index]
                                //                       .name ??
                                //                       '',
                                //                   minutes: matchDetails
                                //                       ?.homePlayersGoals?[
                                //                   index]
                                //                       .minutes ??
                                //                       []),
                                //         ),
                                //       )
                                //     ],
                                //   ),
                                // ),
                                Expanded(
                                  child: TeamHeader(
                                    teamName: matchDetails?.homeTeam?.name ??
                                        StringKeys.singleton.homeTeam.tr,
                                    teamLogo:
                                        matchDetails?.homeTeam?.logo ?? '',
                                  ),
                                ),
                                if (matchDetails?.isLive == true) ...[
                                  Text(matchDetails?.homeScore ?? '0',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontSize: FontSize.fontSize30,
                                            color: ColorManager.instance.white,
                                          ))
                                ],
                                const SizedBox(width: 25),
                                if (matchDetails?.statusValue ==
                                    MatchStatus.notStarted.value) ...[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MyNetworkImage(
                                        url: matchDetails?.league?.logo,
                                        width: AppSize.w56,
                                        height: AppSize.h56,
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 3),
                                        decoration: BoxDecoration(
                                            color: ColorManager.instance.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Text(
                                            matchDetails?.status ??
                                                MatchStatus.notStarted.value,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: ColorManager
                                                      .instance.black,
                                                )),
                                      ),
                                    ],
                                  )
                                ] else if (matchDetails?.isLive == true) ...[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MyNetworkImage(
                                        url: matchDetails?.league?.logo,
                                        width: AppSize.w56,
                                        height: AppSize.h56,
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 7, horizontal: 8),
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primaryContainer,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                StringKeys.singleton.live.tr,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: ColorManager
                                                            .instance.black,
                                                        fontSize: FontSize
                                                            .fontSize10),
                                              ),
                                              const SizedBox(width: 7),
                                              Container(
                                                height: 8,
                                                width: 8,
                                                decoration: BoxDecoration(
                                                    color: ColorManager
                                                        .instance.onPrimary,
                                                    shape: BoxShape.circle),
                                              ),
                                            ],
                                          )),
                                      const SizedBox(height: 8),
                                      Text(
                                          '${matchDetails?.elapsed}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge
                                              ?.copyWith(
                                                color:
                                                    ColorManager.instance.white,
                                              )),
                                    ],
                                  )
                                ] else ...[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MyNetworkImage(
                                        url: matchDetails?.league?.logo,
                                        width: AppSize.w56,
                                        height: AppSize.h56,
                                      ),
                                      const SizedBox(height: 5),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: ColorManager.instance.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Text(matchDetails?.status ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: ColorManager
                                                      .instance.black,
                                                )),
                                      ),
                                    ],
                                  )
                                ],
                                const SizedBox(width: 25),
                                if (matchDetails?.isLive == true) ...[
                                  Text(matchDetails?.awayScore ?? '0',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontSize: FontSize.fontSize30,
                                            color: ColorManager.instance.white,
                                          ))
                                ],
                                Expanded(
                                  child: TeamHeader(
                                    teamName: matchDetails?.awayTeam?.name ??
                                        StringKeys.singleton.awayTeam.tr,
                                    teamLogo:
                                        matchDetails?.awayTeam?.logo ?? '',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text(
                                        '${DateUtility.getDateDayWithMonthNameAndDate(date: matchDetails?.startAt)} | ${matchDetails?.time} | ${matchDetails?.stadium?.title}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              fontSize: FontSize.fontSize10,
                                              color:
                                                  ColorManager.instance.white,
                                            )),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                      PositionedDirectional(
                        start: 10,
                        top: 4,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(AppSize.r8),
                            onTap: () {
                              Get.back();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    decoration: BoxDecoration(
                                        color: ColorManager
                                            .instance.textBorderColor,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Row(
                                      children: [
                                        RotatedBox(
                                            quarterTurns: 2,
                                            child: SvgPicture.asset(
                                                ConstSvg.backArrow)),
                                        const SizedBox(width: 5),
                                        Text(StringKeys.singleton.back.tr,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: ColorManager
                                                      .instance.white,
                                                )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ];

              return Stack(
                alignment: Alignment.topCenter,
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children:
                    isAppbarActive ? childrens.reversed.toList() : childrens,
              );
            },
          ),
        );
      }),
    );
  }
}

// class SliverCustomAppBar extends StatefulWidget {
//   const SliverCustomAppBar({
//     Key? key,
//     this.maxHeight,
//     this.minHeight,
//     required this.scrollController,
//     required this.profileAvatarShift,
//     required this.profileAvatarDiameter,
//     required this.matchDetails,
//   }) : super(key: key);
//
//   final MatchDetails? matchDetails;
//   final double? maxHeight;
//   final double? minHeight;
//   final ScrollController scrollController;
//   final double profileAvatarDiameter;
//   final double profileAvatarShift;
//
//   @override
//   State<SliverCustomAppBar> createState() => _SliverCustomAppBarState();
// }
//
// class _SliverCustomAppBarState extends State<SliverCustomAppBar> {
//   static final ScrollController _homeScrollController = ScrollController();
//   static final ScrollController _awayScrollController = ScrollController();
//   double minScrollExtent = 0;
//   double maxScrollExtent = 0;
//
//   @override
//   void dispose() {
//     _homeScrollController.dispose();
//     _awayScrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     if (_homeScrollController.hasClients) {
//       minScrollExtent = _homeScrollController.position.minScrollExtent;
//       maxScrollExtent = _homeScrollController.position.maxScrollExtent;
//     }
//     Future.delayed(Duration.zero, () {
//       animateToMaxAndBounce(bounce: minScrollExtent);
//     });
//   }
//
//   animateToMaxAndBounce({required double bounce}) {
//     _homeScrollController
//         .animateTo(100,
//             duration: const Duration(seconds: 5), curve: Curves.linear)
//         .then((value) {
//       bounce = bounce == minScrollExtent ? maxScrollExtent : minScrollExtent;
//       _homeScrollController.animateTo(bounce,
//           duration: const Duration(seconds: 6), curve: Curves.linear);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
//
//     final maxAppBarHeight = widget.maxHeight ??
//         MediaQuery.of(context).size.height * (isPortrait ? 0.30 : 0.49);
//
//     final minAppBarHeight = widget.minHeight ??
//         MediaQuery.of(context).padding.top +
//             MediaQuery.of(context).size.height * (isPortrait ? 0.15 : 0.21);
//
//     return AnimatedBuilder(
//       animation: widget.scrollController,
//       builder: ((context, child) {
//         return SliverPersistentHeader(
//           pinned: true,
//           delegate: SliverAppBarDelegate(
//             maxHeight: maxAppBarHeight,
//             minHeight: minAppBarHeight,
//             builder: (context, shrinkOffset) {
//               // final double shrinkToMaxAppBarHeightRatio =
//               //     shrinkOffset / maxAppBarHeight;
//               final double maxHeightBottomEdgeToMinHeightAppbarHitRatio =
//                   (shrinkOffset / (maxAppBarHeight - minAppBarHeight))
//                       .clamp(0, 1);
//
//               final isAppbarActive =
//                   maxHeightBottomEdgeToMinHeightAppbarHitRatio >= 1;
//               final double minHeightBottomEdgeToTopHit = isAppbarActive
//                   ? (maxAppBarHeight - shrinkOffset) / minAppBarHeight
//                   : 0;
//               isAppbarActive ? 1 - minHeightBottomEdgeToTopHit : 0;
//
//               final offset = widget.scrollController.offset;
//               final double appbarTitleToTopratio = (1 -
//                       ((maxAppBarHeight +
//
//                               /// adjusted offset to make the title appear when the profile name and userid are almost at the
//                               /// bottom edge of the app bar in min-height state
//                               widget.profileAvatarDiameter / 2 +
//                               widget.profileAvatarShift
//                               //
//                               -
//                               (offset)) /
//                           minAppBarHeight))
//                   .clamp(-1, 1.0);
//               final isAppbarTitleActive = appbarTitleToTopratio >= 0;
//               final double appbarTitleOpacity =
//                   isAppbarTitleActive ? appbarTitleToTopratio : 0;
//               // log(minHeightBottomEdgeToTopHit.toString());
//               // Logger().i(appbarTitleToTopratio.abs());
//               final childrens = [
//                 CustomFlexibleSpace(
//                     titleOpacity: appbarTitleOpacity,
//                     matchDetails: widget.matchDetails),
//                 Opacity(
//                   opacity: (appbarTitleToTopratio.abs() - 0.1).abs(),
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         left: 0,
//                         right: 0,
//                         bottom: 0,
//                         child: Column(
//                           children: [
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Expanded(
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       TeamHeader(
//                                         teamName: widget
//                                                 .matchDetails?.homeTeam?.name ??
//                                             StringKeys.singleton.homeTeam.tr,
//                                         teamLogo: widget
//                                                 .matchDetails?.homeTeam?.logo ??
//                                             '',
//                                       ),
//                                       if (widget.matchDetails?.status ==
//                                           MatchStatus.matchFinished.value) ...[
//                                         SizedBox(
//                                           height: AppSize.h65,
//                                           child: ListView.separated(
//                                             controller: _awayScrollController,
//                                             shrinkWrap: true,
//                                             itemCount: widget
//                                                     .matchDetails
//                                                     ?.homePlayersGoals
//                                                     ?.length ??
//                                                 0,
//                                             separatorBuilder:
//                                                 (context, index) =>
//                                                     const SizedBox(height: 4),
//                                             itemBuilder: (context, index) =>
//                                                 GoalsStatsBox(
//                                                     name: widget
//                                                             .matchDetails
//                                                             ?.homePlayersGoals?[
//                                                                 index]
//                                                             .name ??
//                                                         '',
//                                                     minutes: widget
//                                                             .matchDetails
//                                                             ?.homePlayersGoals?[
//                                                                 index]
//                                                             .minutes
//                                                             ?.first ??
//                                                         0),
//                                           ),
//                                         )
//                                       ]
//                                     ],
//                                   ),
//                                 ),
//                                 const SizedBox(width: 10),
//                                 if (widget.matchDetails?.status ==
//                                     MatchStatus.notStarted.value) ...[
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       MyNetworkImage(
//                                         url: widget.matchDetails?.league?.image,
//                                         width: AppSize.w56,
//                                         height: AppSize.h56,
//                                       ),
//                                       const SizedBox(height: 8),
//                                       Container(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 8, vertical: 3),
//                                         decoration: BoxDecoration(
//                                             color: ColorManager.instance.white,
//                                             borderRadius:
//                                                 BorderRadius.circular(15)),
//                                         child: Text(
//                                             widget.matchDetails?.status ??
//                                                 MatchStatus.notStarted.value,
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .bodySmall
//                                                 ?.copyWith(
//                                                   color: ColorManager
//                                                       .instance.black,
//                                                 )),
//                                       ),
//                                     ],
//                                   )
//                                 ] else if (widget.matchDetails?.status ==
//                                     MatchStatus.matchFinished.value) ...[
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       MyNetworkImage(
//                                         url: widget.matchDetails?.league?.image,
//                                         width: AppSize.w30,
//                                         height: AppSize.h30,
//                                       ),
//                                       const SizedBox(height: 5),
//                                       Container(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 8, vertical: 3),
//                                         decoration: BoxDecoration(
//                                             color: ColorManager.instance.white,
//                                             borderRadius:
//                                                 BorderRadius.circular(15)),
//                                         child: Text(
//                                             widget.matchDetails?.status ??
//                                                 MatchStatus.matchFinished.value,
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .bodySmall
//                                                 ?.copyWith(
//                                                   color: ColorManager
//                                                       .instance.black,
//                                                 )),
//                                       ),
//                                       const SizedBox(height: 8),
//                                       Row(
//                                         children: [
//                                           Text(
//                                               widget.matchDetails?.homeScore ??
//                                                   '0',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .bodyMedium
//                                                   ?.copyWith(
//                                                     fontSize:
//                                                         FontSize.fontSize30,
//                                                     color: ColorManager
//                                                         .instance.white,
//                                                   )),
//                                           const SizedBox(width: 10),
//                                           Text('-',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .bodySmall
//                                                   ?.copyWith(
//                                                     fontSize:
//                                                         FontSize.fontSize24,
//                                                     color: ColorManager
//                                                         .instance.white,
//                                                   )),
//                                           const SizedBox(width: 10),
//                                           Text(
//                                               widget.matchDetails?.awayScore ??
//                                                   '0',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .bodySmall
//                                                   ?.copyWith(
//                                                     fontSize:
//                                                         FontSize.fontSize30,
//                                                     color: ColorManager
//                                                         .instance.white,
//                                                   ))
//                                         ],
//                                       ),
//                                     ],
//                                   )
//                                 ] else ...[
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       SvgPicture.asset(ConstSvg.laLaiga),
//                                       const SizedBox(height: 5),
//                                       Container(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 8, vertical: 5),
//                                         decoration: BoxDecoration(
//                                             color: ColorManager.instance.white,
//                                             borderRadius:
//                                                 BorderRadius.circular(15)),
//                                         child: Text('status',
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .bodySmall
//                                                 ?.copyWith(
//                                                   color: ColorManager
//                                                       .instance.black,
//                                                 )),
//                                       ),
//                                       const SizedBox(height: 8),
//                                       Row(
//                                         children: [
//                                           Text('3',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .bodyMedium
//                                                   ?.copyWith(
//                                                     fontSize:
//                                                         FontSize.fontSize30,
//                                                     color: ColorManager
//                                                         .instance.white,
//                                                   )),
//                                           const SizedBox(width: 10),
//                                           Text('-',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .bodySmall
//                                                   ?.copyWith(
//                                                     fontSize:
//                                                         FontSize.fontSize24,
//                                                     color: ColorManager
//                                                         .instance.white,
//                                                   )),
//                                           const SizedBox(width: 10),
//                                           Text('1',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .bodySmall
//                                                   ?.copyWith(
//                                                     fontSize:
//                                                         FontSize.fontSize30,
//                                                     color: ColorManager
//                                                         .instance.white,
//                                                   ))
//                                         ],
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                                 const SizedBox(width: 10),
//                                 Expanded(
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       TeamHeader(
//                                         teamName: widget
//                                                 .matchDetails?.awayTeam?.name ??
//                                             StringKeys.singleton.awayTeam.tr,
//                                         teamLogo: widget
//                                                 .matchDetails?.awayTeam?.logo ??
//                                             '',
//                                       ),
//                                       if (widget.matchDetails?.status ==
//                                           MatchStatus.matchFinished.value) ...[
//                                         SizedBox(
//                                           height: AppSize.h65,
//                                           child: ListView.separated(
//                                               controller: _homeScrollController,
//                                               shrinkWrap: true,
//                                               itemCount: widget
//                                                       .matchDetails
//                                                       ?.awayPlayersGoals
//                                                       ?.length ??
//                                                   0,
//                                               separatorBuilder:
//                                                   (context, index) =>
//                                                       const SizedBox(height: 3),
//                                               itemBuilder: (context, index) =>
//                                                   GoalsStatsBox(
//                                                       name:
//                                                           widget.matchDetails?.awayPlayersGoals?[index].name ??
//                                                               '',
//                                                       minutes: widget
//                                                               .matchDetails
//                                                               ?.awayPlayersGoals?[index]
//                                                               .minutes
//                                                               ?.first ??
//                                                           0)),
//                                         )
//                                       ]
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 8),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Expanded(
//                                   child: Center(
//                                     child: Text(
//                                         '${DateUtility.getDateDayWithMonthNameAndDate(date: widget.matchDetails?.startAt)} | ${widget.matchDetails?.time} | ${widget.matchDetails?.stadium?.title}',
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodySmall
//                                             ?.copyWith(
//                                               fontSize: FontSize.fontSize10,
//                                               color:
//                                                   ColorManager.instance.white,
//                                             )),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 8),
//                           ],
//                         ),
//                       ),
//                       Positioned(
//                         left: 0,
//                         top: 5,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 10, top: 10),
//                           child: Row(
//                             children: [
//                               Container(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 8, vertical: 6),
//                                 decoration: BoxDecoration(
//                                     color:
//                                         ColorManager.instance.textBorderColor,
//                                     borderRadius: BorderRadius.circular(15)),
//                                 child: Row(
//                                   children: [
//                                     RotatedBox(
//                                         quarterTurns: 2,
//                                         child: SvgPicture.asset(
//                                             ConstSvg.backArrow)),
//                                     const SizedBox(width: 5),
//                                     InkWell(
//                                       onTap: () {
//                                         Get.back();
//                                       },
//                                       child: Text(StringKeys.singleton.back.tr,
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .bodySmall
//                                               ?.copyWith(
//                                                 color:
//                                                     ColorManager.instance.white,
//                                               )),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ];
//
//               return Stack(
//                 alignment: Alignment.topCenter,
//                 fit: StackFit.expand,
//                 clipBehavior: Clip.none,
//                 children:
//                     isAppbarActive ? childrens.reversed.toList() : childrens,
//               );
//             },
//           ),
//         );
//       }),
//     );
//   }
// }

class Insets {
  static double scale = 1;
  static double offsetScale = 1;

  // Regular paddings
  // static double get xs => 4 * scale;
  static double get sm => 5 * scale;

  static double get med => 10 * scale;

  static double get lg => 20 * scale;

  // static double get xl => 32 * scale;
  // Offset, used for the edge of the window, or to separate large sections in the app
  static double get offset => 40 * offsetScale;
}
