import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';
import 'package:taktikat/feature/view/screens/app/match_details/Tabs/match_event_tab.dart';
import 'package:taktikat/feature/view/screens/app/match_details/Tabs/ranking_tab.dart';
import 'package:taktikat/feature/view/screens/app/match_details/widgets/appbar_widgets/match_with_result_appbar.dart';
import 'package:taktikat/feature/view/screens/app/match_details/widgets/appbar_widgets/sliver_custom_appbar.dart';
import 'package:taktikat/feature/view/screens/app/match_details/widgets/circle_tabbar_indicator.dart';
import 'package:taktikat/feature/view_model/match_detail_view_model.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../../../../../utils/constants/const_svgs.dart';
import '../../../../../utils/constants/custome_svg.dart';
import '../../../../../utils/shimmer/match_details_screen_skeleton.dart';
import '../../../../core/theme/size/app_size.dart';
import '../../../../model/enums/match_status.dart';
import 'Tabs/confrontations_tab.dart';
import 'Tabs/lineup_tab.dart';
import 'Tabs/match_states_tab.dart';

class MatchDetailsScreen extends StatefulWidget {
  const MatchDetailsScreen({
    super.key,
    required this.matchId,
  });

  final int matchId;

  @override
  State<MatchDetailsScreen> createState() => _MatchDetailsScreenState();
}

class _MatchDetailsScreenState extends State<MatchDetailsScreen>
    with SingleTickerProviderStateMixin {
  MatchDetailViewModel matchDetailViewModel = Get.find<MatchDetailViewModel>();
  static final ScrollController scrollController = ScrollController();
  late TabController tabController;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      tabController = matchDetailViewModel.isMatchFinished
          ? TabController(
              length: 5,
              vsync: this,
              initialIndex: 4,
            )
          : TabController(
              length: 4,
              vsync: this,
              initialIndex: 3,
            );
      await matchDetailViewModel.getMatchDetails(matchId: widget.matchId);
      matchDetailViewModel.getMatchCommentaries(matchId: widget.matchId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: ColorManager.instance.white,
        statusBarColor: ColorManager.instance.black,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: GetBuilder<MatchDetailViewModel>(
            init: MatchDetailViewModel(),
            builder: (logic) {
              if (logic.matchDetailsLoading) {
                return const MatchDetailsScreenSkeleton();
              }
              return NestedScrollView(
                controller: scrollController,
                headerSliverBuilder: (context, value) {
                  const double miniAppBarDiameter = 50;
                  const double miniAppBarShift = 0;
                  return [
                    if (logic.matchDetails?.statusValue ==
                        MatchStatus.matchFinished.value) ...[
                      MatchWithResultAppBar(
                        matchDetails: logic.matchDetails,
                        scrollController: scrollController,
                        profileAvatarDiameter: miniAppBarDiameter,
                        profileAvatarShift: miniAppBarShift,
                      )
                    ] else ...[
                      SliverCustomAppBar(
                        matchDetails: logic.matchDetails,
                        scrollController: scrollController,
                        profileAvatarDiameter: miniAppBarDiameter,
                        profileAvatarShift: miniAppBarShift,
                      )
                    ],
                  ];
                },
                body: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorManager.instance.primaryContainer,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x33000000),
                              offset: Offset(0, 2),
                              spreadRadius: 1,
                              blurRadius: 1),
                        ],
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: TabBar(
                        controller: tabController,
                        onTap: (index) {
                          logic.changeBottomNavIndex(index);
                        },
                        automaticIndicatorColorAdjustment: false,
                        labelPadding: const EdgeInsets.symmetric(vertical: 10),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: TabIndicator(),
                        tabs: logic.isMatchFinished
                            ? [
                                SvgPicture.asset(
                                  ConstSvg.stats,
                                  height: AppSize.h20,
                                  colorFilter: tabController.index == 0
                                      ? ColorFilter.mode(
                                          tabController.index == 0
                                              ? Theme.of(context).primaryColor
                                              : ColorManager
                                                  .instance.unselectedText,
                                          BlendMode.srcIn,
                                        )
                                      : null,
                                ),
                                SvgPicture.asset(
                                  ConstSvg.menu,
                                  height: AppSize.h16,
                                  colorFilter: tabController.index == 1
                                      ? ColorFilter.mode(
                                          tabController.index == 1
                                              ? Theme.of(context).primaryColor
                                              : ColorManager
                                                  .instance.unselectedText,
                                          BlendMode.srcIn,
                                        )
                                      : null,
                                ),
                                SvgPicture.string(
                                  CustomSvg.instance.confrontations(
                                      colorId: tabController.index == 2
                                          ? Utils.instance.convertColorToHex(
                                              Theme.of(context).primaryColor)
                                          : CustomSvg.instance.iconNotSelected),
                                  height: AppSize.h20,
                                ),
                                SvgPicture.string(
                                  CustomSvg.instance.lineUp(
                                      colorId: tabController.index == 3
                                          ? Utils.instance.convertColorToHex(
                                              Theme.of(context).primaryColor)
                                          : CustomSvg.instance.iconNotSelected),
                                  height: AppSize.h20,
                                ),
                                SvgPicture.asset(
                                  ConstSvg.playground,
                                  height: AppSize.h20,
                                  colorFilter: tabController.index == 4
                                      ? ColorFilter.mode(
                                          tabController.index == 4
                                              ? Theme.of(context).primaryColor
                                              : ColorManager
                                                  .instance.unselectedText,
                                          BlendMode.srcIn,
                                        )
                                      : null,
                                ),
                              ]
                            : [
                                SvgPicture.asset(
                                  ConstSvg.menu,
                                  height: AppSize.h16,
                                  colorFilter: tabController.index == 0
                                      ? ColorFilter.mode(
                                          tabController.index == 0
                                              ? Theme.of(context).primaryColor
                                              : ColorManager
                                                  .instance.unselectedText,
                                          BlendMode.srcIn,
                                        )
                                      : null,
                                ),
                                SvgPicture.string(
                                  CustomSvg.instance.confrontations(
                                      colorId: tabController.index == 1
                                          ? Utils.instance.convertColorToHex(
                                              Theme.of(context).primaryColor)
                                          : CustomSvg.instance.iconNotSelected),
                                  height: AppSize.h20,
                                ),
                                SvgPicture.string(
                                  CustomSvg.instance.lineUp(
                                      colorId: tabController.index == 2
                                          ? Utils.instance.convertColorToHex(
                                              Theme.of(context).primaryColor)
                                          : CustomSvg.instance.iconNotSelected),
                                  height: AppSize.h20,
                                ),
                                SvgPicture.asset(
                                  ConstSvg.playground,
                                  height: AppSize.h20,
                                  colorFilter: tabController.index == 3
                                      ? ColorFilter.mode(
                                          tabController.index == 3
                                              ? Theme.of(context).primaryColor
                                              : ColorManager
                                                  .instance.unselectedText,
                                          BlendMode.srcIn,
                                        )
                                      : null,
                                ),
                              ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          if (logic.isMatchFinished) ...[
                            MatchStatesTab(logic: logic)
                          ],
                          RankingTab(logic: logic),
                          ConfrontationsTab(logic: logic),
                          LineUpTab(logic: logic),
                          MatchEventTab(logic: logic),
                        ],
                      ),
                    ),
                    // _.getBottomSelectedPage(),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
