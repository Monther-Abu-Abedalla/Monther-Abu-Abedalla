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
import 'goals_stats_box.dart';
import 'team_header.dart';
import 'custom_flexible_space.dart';

class MatchWithResultAppBar extends StatefulWidget {
  const MatchWithResultAppBar({
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
  State<MatchWithResultAppBar> createState() => _MatchWithResultAppBar();
}

class _MatchWithResultAppBar extends State<MatchWithResultAppBar> {
  static final ScrollController _homeScrollController = ScrollController();
  static final ScrollController _awayScrollController = ScrollController();
  double minScrollExtentHome = 0;
  double maxScrollExtentHome = 0;
  double minScrollExtentAway = 0;
  double maxScrollExtentAway = 0;


  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_homeScrollController.hasClients) {
        minScrollExtentHome = _homeScrollController.position.minScrollExtent;
        maxScrollExtentHome = _homeScrollController.position.maxScrollExtent;
      }
      if (_homeScrollController.hasClients) {
        minScrollExtentAway = _awayScrollController.position.minScrollExtent;
        maxScrollExtentAway = _awayScrollController.position.maxScrollExtent;
      }
      Future.delayed(const Duration(seconds: 1), () {
        animateToMaxAndBounceHome();

        animateToMaxAndBounceAway();
      });
    });
  }

  animateToMaxAndBounceHome() {
    _homeScrollController
        .animateTo(100,
            duration: const Duration(seconds: 5), curve: Curves.linear)
        .then((value) {
      _homeScrollController.animateTo(minScrollExtentHome,
          duration: const Duration(seconds: 6), curve: Curves.linear);
    });
  }

  animateToMaxAndBounceAway() {
    _awayScrollController
        .animateTo(100,
            duration: const Duration(seconds: 5), curve: Curves.linear)
        .then((value) {
      _awayScrollController.animateTo(minScrollExtentAway,
          duration: const Duration(seconds: 6), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    final maxAppBarHeight = widget.maxHeight ??
        MediaQuery.of(context).size.height * (isPortrait ? 0.35 : 0.53);

    final minAppBarHeight = widget.minHeight ??
        MediaQuery.of(context).padding.top +
            MediaQuery.of(context).size.height * (isPortrait ? 0.15 : 0.27);

    return AnimatedBuilder(
      animation: widget.scrollController,
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

              final offset = widget.scrollController.offset;
              final double appbarTitleToTopratio = (1 -
                      ((maxAppBarHeight +

                              /// adjusted offset to make the title appear when the profile name and userid are almost at the
                              /// bottom edge of the app bar in min-height state
                              widget.profileAvatarDiameter / 2 +
                              widget.profileAvatarShift
                              //
                              -
                              (offset)) /
                          minAppBarHeight))
                  .clamp(-1, 1.0);
              final isAppbarTitleActive = appbarTitleToTopratio >= 0;
              final double appbarTitleOpacity =
                  isAppbarTitleActive ? appbarTitleToTopratio : 0;
              final childrens = [
                CustomFlexibleSpace(
                    titleOpacity: appbarTitleOpacity,
                    matchDetails: widget.matchDetails),
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
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 8),
                                      TeamHeader(
                                        teamName: widget
                                                .matchDetails?.homeTeam?.name ??
                                            StringKeys.singleton.homeTeam.tr,
                                        teamLogo: widget
                                                .matchDetails?.homeTeam?.logo ??
                                            '',
                                      ),
                                      SizedBox(
                                        height: AppSize.h65,
                                        child: ListView.separated(
                                          controller: _homeScrollController,
                                          shrinkWrap: true,
                                          itemCount: widget.matchDetails
                                                  ?.homePlayersGoals?.length ??
                                              0,
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(height: 4),
                                          itemBuilder: (context, index) =>
                                              GoalsStatsBox(
                                                  name: widget
                                                          .matchDetails
                                                          ?.homePlayersGoals?[
                                                              index]
                                                          .name ??
                                                      '',
                                                  minutes: widget
                                                          .matchDetails
                                                          ?.homePlayersGoals?[
                                                              index]
                                                          .minutes ??
                                                      []),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MyNetworkImage(
                                      url: widget.matchDetails?.league?.logo,
                                      width: AppSize.w50,
                                      height: AppSize.h50,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 7, vertical: 3),
                                      decoration: BoxDecoration(
                                          color: ColorManager.instance.white,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Text(
                                          widget.matchDetails?.status ??
                                              MatchStatus.matchFinished.value,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                fontSize: FontSize.fontSize9,
                                                color:
                                                    ColorManager.instance.black,
                                              )),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text(
                                            widget.matchDetails?.homeScore ??
                                                '0',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  fontSize: FontSize.fontSize30,
                                                  color: ColorManager
                                                      .instance.white,
                                                )),
                                        const SizedBox(width: 10),
                                        Text('-',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  fontSize: FontSize.fontSize24,
                                                  color: ColorManager
                                                      .instance.white,
                                                )),
                                        const SizedBox(width: 10),
                                        Text(
                                            widget.matchDetails?.awayScore ??
                                                '0',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  fontSize: FontSize.fontSize30,
                                                  color: ColorManager
                                                      .instance.white,
                                                ))
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 8),
                                      TeamHeader(
                                        teamName: widget
                                                .matchDetails?.awayTeam?.name ??
                                            StringKeys.singleton.awayTeam.tr,
                                        teamLogo: widget
                                                .matchDetails?.awayTeam?.logo ??
                                            '',
                                      ),
                                      SizedBox(
                                        height: AppSize.h65,
                                        child: ListView.separated(
                                            controller: _awayScrollController,
                                            shrinkWrap: true,
                                            itemCount: widget
                                                    .matchDetails
                                                    ?.awayPlayersGoals
                                                    ?.length ??
                                                0,
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(height: 4),
                                            itemBuilder: (context, index) =>
                                                GoalsStatsBox(
                                                    name:
                                                        widget.matchDetails?.awayPlayersGoals?[index].name ??
                                                            '',
                                                    minutes: widget
                                                            .matchDetails
                                                            ?.awayPlayersGoals?[index]
                                                            .minutes ??
                                                        [])),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text(
                                        '${DateUtility.getDateDayWithMonthNameAndDate(date: widget.matchDetails?.startAt)} | ${widget.matchDetails?.time} | ${widget.matchDetails?.stadium?.title}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              fontSize: FontSize.fontSize11,
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
                        child: InkWell(
                          borderRadius: BorderRadius.circular(AppSize.r8),
                          onTap: () {
                            Get.back();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16),
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
