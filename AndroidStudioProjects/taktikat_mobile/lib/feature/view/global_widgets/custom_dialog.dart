import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_font_size.dart';
import 'package:taktikat/feature/model/enums/border_types.dart';
import 'package:taktikat/feature/model/models/home/search_models/search_result.dart';
import 'package:taktikat/feature/view/global_widgets/app_loading.dart';
import 'package:taktikat/feature/view/global_widgets/primary_button.dart';
import 'package:taktikat/feature/view/screens/app/home/widgets/search/search_item.dart';
import 'package:taktikat/feature/view_model/home_view_model.dart';
import 'package:taktikat/feature/view_model/match_detail_view_model.dart';
import 'package:taktikat/utils/constants/const_svgs.dart';
import 'package:taktikat/utils/localization/string_keys.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../../core/theme/size/app_size.dart';
import 'custom_text_field.dart';
import 'my_network_image.dart';

class CustomDialog {
  CustomDialog._();

  static CustomDialog instance = CustomDialog._();

  Future searchDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppSize.r10),
            ),
          ),
          title: GetBuilder<HomeViewModel>(
            builder: (homeLogic) {
              return CustomTextFormFiled(
                controller: homeLogic.tdMainSearch,
                hint: StringKeys.singleton.search.tr,
                borderType: BorderTypes.outline,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                onChanged: (value) {
                  if ((value ?? '').length > 2) {
                    homeLogic.mainSearch(value.toString());
                  } else if ((value ?? '').isEmpty) {
                    homeLogic.clearSearch();
                  }
                  return null;
                },
                icon: Row(
                  children: [
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      ConstSvg.search,
                    ),
                  ],
                ),
              );
            },
          ),
          content: GetBuilder<HomeViewModel>(
            builder: (_) {
              if (_.isLoading) {
                return const AppLoading();
              }
              return SizedBox(
                width: Get.width,
                child: ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: [
                    SearchItem(
                      title: StringKeys.singleton.teams.tr,
                      searchItems: _.mainSearchResult.teams,
                      onTap: (SearchResult item) {
                        Logger().e(item.toJson());
                      },
                    ),
                    SearchItem(
                      title: StringKeys.singleton.matches.tr,
                      searchItems: _.mainSearchResult.matches,
                      onTap: (SearchResult item) {
                        Logger().e(item.toJson());
                      },
                    ),
                    SearchItem(
                      searchItems: _.mainSearchResult.news,
                      title: StringKeys.singleton.news.tr,
                      onTap: (SearchResult item) {
                        Logger().e(item.toJson());
                      },
                    ),
                    SearchItem(
                      searchItems: _.mainSearchResult.analytics,
                      title: StringKeys.singleton.analytics.tr,
                      onTap: (SearchResult item) {
                        Logger().e(item.toJson());
                      },
                    ),
                    SearchItem(
                      searchItems: _.mainSearchResult.nationalTeams,
                      title: StringKeys.singleton.nationalTeam.tr,
                      onTap: (SearchResult item) {
                        Logger().e(item.toJson());
                      },
                    ),
                    SearchItem(
                      searchItems: _.mainSearchResult.blogs,
                      title: StringKeys.singleton.blogs.tr,
                      onTap: (SearchResult item) {
                        Logger().e(item.toJson());
                      },
                    ),
                    SearchItem(
                      searchItems: _.mainSearchResult.reels,
                      title: StringKeys.singleton.reels.tr,
                      onTap: (SearchResult item) {
                        Logger().e(item.toJson());
                      },
                    ),

                    SearchItem(
                      searchItems: _.mainSearchResult.leagues,
                      title: StringKeys.singleton.leagues.tr,
                      onTap: (SearchResult item) {
                        Logger().e(item.toJson());
                      },
                    ),
                    SearchItem(
                      searchItems: _.mainSearchResult.championships,
                      title: StringKeys.singleton.championships.tr,
                      onTap: (SearchResult item) {
                        Logger().e(item.toJson());
                      },
                    ),

                    SearchItem(
                      title: StringKeys.singleton.players.tr,
                      searchItems: _.mainSearchResult.players,
                      onTap: (SearchResult item) {
                        Logger().e(item.toJson());
                      },
                    ),

                    // analytics

                    // blogs
                  ],
                ),
              );
            },
          ),
        ),
      );

  Future playerDialog({
    required BuildContext context,
    required String? teamLogo,
    required bool isHome,
  }) =>
      showDialog(
          context: context,
          builder: (BuildContext context) => GetBuilder<MatchDetailViewModel>(
                builder: (logic) => AlertDialog(
                  alignment: Alignment.center,
                  scrollable: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  title: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              logic.changeActivePlayer(
                                isHome: isHome,
                                isNext: false,
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: SvgPicture.asset(
                                Utils.instance.isArabic()
                                    ? ConstSvg.previous
                                    : ConstSvg.next,
                                colorFilter: ColorFilter.mode(
                                  ColorManager.instance.secondary,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: MyNetworkImage(
                                      url:
                                          logic.activeHomeLineup?.player?.image,
                                      width: AppSize.w74,
                                      height: AppSize.h74,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        logic.activeHomeLineup?.player?.name ??
                                            '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color:
                                                  ColorManager.instance.primary,
                                              fontSize: FontSize.fontSize12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        maxLines: 3,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        logic.activeHomeLineup?.player
                                                ?.position ??
                                            '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: ColorManager
                                                  .instance.secondary,
                                            ),
                                      ),
                                      const SizedBox(height: 5),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 2,
                                          horizontal: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: Utils.instance
                                              .getPlayerColorByRating(
                                            rating: logic.activeHomeLineup
                                                ?.playerMatchStatistics?.rating
                                                .toString(),
                                          ),
                                        ),
                                        child: Text(
                                          logic
                                                  .activeHomeLineup
                                                  ?.playerMatchStatistics
                                                  ?.rating
                                                  .toString() ??
                                              '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                fontSize: FontSize.fontSize11,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    ColorManager.instance.white,
                                              ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              logic.changeActivePlayer(
                                isHome: isHome,
                                isNext: false,
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: SvgPicture.asset(
                                Utils.instance.isArabic()
                                    ? ConstSvg.next
                                    : ConstSvg.previous,
                                colorFilter: ColorFilter.mode(
                                  ColorManager.instance.secondary,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorManager.instance.white,
                          ),
                          child: MyNetworkImage(
                            url: teamLogo,
                            width: AppSize.w24,
                            height: AppSize.h24,
                          ),
                        ),
                      )
                    ],
                  ),
                  content: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorManager.instance.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text(
                              StringKeys.singleton.topStats.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: ColorManager.instance.primary,
                                    fontSize: FontSize.fontSize11,
                                  ),
                            ),
                            const Spacer(),
                            PrimaryButton(
                              text: StringKeys.singleton.playerProfile.tr,
                              isLoading: false,
                              onPressed: () {},
                              fontSize: FontSize.fontSize9,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        MyNetworkImage(
                          width: Get.width,
                          url: logic.getPlayerHeatMapUrl(isHome: isHome),
                          height: AppSize.h150,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            statsBox(
                              context,
                              image: ConstSvg.timePlayed,
                              title: StringKeys.singleton.min.tr,
                              stat: logic.activeHomeLineup
                                      ?.playerMatchStatistics?.minutesPlayed ??
                                  '0',
                            ),
                            statsBox(
                              context,
                              image: ConstSvg.assets,
                              title: StringKeys.singleton.assets.tr,
                              stat:
                                  '''${logic.activeHomeLineup?.playerMatchStatistics?.assists ?? '0'}''',
                            ),
                            statsBox(
                              context,
                              image: ConstSvg.goalsScored,
                              title: StringKeys.singleton.goals.tr,
                              stat:
                                  '''${logic.activeHomeLineup?.playerMatchStatistics?.goals ?? '0'}''',
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Divider(
                          height: 2,
                          thickness: 1,
                          color: ColorManager.instance.dividerColor,
                        ),
                        const SizedBox(height: 15),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        StringKeys.singleton.defending.tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color:
                                                  ColorManager.instance.primary,
                                              fontSize: FontSize.fontSize12,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      statusItem(
                                        context: context,
                                        title: StringKeys
                                            .singleton.tacklesInterceptions.tr,
                                        value:
                                            '''${logic.activeHomeLineup?.playerMatchStatistics?.tacklesInterceptions ?? '0'}''',
                                      ),
                                      statusItem(
                                        context: context,
                                        title: StringKeys.singleton.blocks.tr,
                                        value:
                                            '''${logic.activeHomeLineup?.playerMatchStatistics?.blocks ?? '0'}''',
                                      ),
                                      statusItem(
                                        context: context,
                                        title:
                                            StringKeys.singleton.duelsTotal.tr,
                                        value:
                                            '''${logic.activeHomeLineup?.playerMatchStatistics?.duelsTotal ?? '0'}''',
                                      ),
                                      statusItem(
                                        title: StringKeys.singleton.duelsWon.tr,
                                        value:
                                            '''${logic.activeHomeLineup?.playerMatchStatistics?.duelsWon ?? '0'}''',
                                        context: context,
                                      ),
                                      statusItem(
                                        title: StringKeys
                                            .singleton.foulsCommitted.tr,
                                        value:
                                            '''${logic.activeHomeLineup?.playerMatchStatistics?.foulsCommitted ?? '0'}''',
                                        context: context,
                                      ),
                                      statusItem(
                                        title: StringKeys
                                            .singleton.penaltyCommitted.tr,
                                        value:
                                            '''${logic.activeHomeLineup?.playerMatchStatistics?.penaltyCommited ?? '0'}''',
                                        context: context,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            Divider(
                                height: 2,
                                thickness: 1,
                                color: ColorManager.instance.dividerColor),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        StringKeys.singleton.attacking.tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color:
                                                  ColorManager.instance.primary,
                                              fontSize: FontSize.fontSize12,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      statusItem(
                                        context: context,
                                        title: StringKeys.singleton.goals.tr,
                                        value:
                                            '''${logic.activeHomeLineup?.playerMatchStatistics?.goals ?? '0'}''',
                                      ),
                                      statusItem(
                                        context: context,
                                        title: StringKeys.singleton.assists.tr,
                                        value:
                                            '''${logic.activeHomeLineup?.playerMatchStatistics?.assists ?? '0'}''',
                                      ),
                                      statusItem(
                                        context: context,
                                        title: StringKeys
                                            .singleton.accuracyPasses.tr,
                                        value:
                                            '''${logic.activeHomeLineup?.playerMatchStatistics?.accuracyPasses ?? '0'}%''',
                                      ),
                                      statusItem(
                                        title:
                                            StringKeys.singleton.totalShots.tr,
                                        value:
                                            '''${logic.activeHomeLineup?.playerMatchStatistics?.totalShots ?? '0'}''',
                                        context: context,
                                      ),
                                      statusItem(
                                        title: StringKeys
                                            .singleton.totalShotsOn.tr,
                                        value:
                                            '${logic.activeHomeLineup?.playerMatchStatistics?.totalShotsOn ?? '0'}',
                                        context: context,
                                      ),
                                      statusItem(
                                        title: StringKeys
                                            .singleton.dribblesAttempts.tr,
                                        value:
                                            '${logic.activeHomeLineup?.playerMatchStatistics?.dribblesAttempts ?? '0'}',
                                        context: context,
                                      ),
                                      //Dribbles Past
                                      statusItem(
                                        title: StringKeys
                                            .singleton.dribblesPast.tr,
                                        value:
                                            '${logic.activeHomeLineup?.playerMatchStatistics?.dribblesPast ?? '0'}',
                                        context: context,
                                      ),
                                      //Dribbles Success
                                      statusItem(
                                        title: StringKeys
                                            .singleton.dribblesSuccess.tr,
                                        value:
                                            '${logic.activeHomeLineup?.playerMatchStatistics?.dribblesSuccess ?? '0'}',
                                        context: context,
                                      ),

                                      //Penalty Won
                                      statusItem(
                                        title:
                                            StringKeys.singleton.penaltyWon.tr,
                                        value:
                                            '${logic.activeHomeLineup?.playerMatchStatistics?.penaltyWon ?? '0'}',
                                        context: context,
                                      ),
                                      //Penalty Missed
                                      statusItem(
                                        title: StringKeys
                                            .singleton.penaltyMissed.tr,
                                        value:
                                            '${logic.activeHomeLineup?.playerMatchStatistics?.penaltyMissed ?? '0'}',
                                        context: context,
                                      ),
                                      //Penalty Scored
                                      statusItem(
                                        title: StringKeys
                                            .singleton.penaltyScored.tr,
                                        value:
                                            '${logic.activeHomeLineup?.playerMatchStatistics?.penaltyScored ?? '0'}',
                                        context: context,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ));

  Widget statsBox(
    BuildContext context, {
    required String image,
    required String title,
    required String stat,
  }) =>
      Row(
        children: [
          SvgPicture.asset(
            image,
            height: AppSize.h30,
            width: AppSize.w30,
          ),
          const SizedBox(
            width: 4,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stat,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorManager.instance.primary,
                      fontSize: FontSize.fontSize12,
                    ),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorManager.instance.secondary,
                      fontSize: FontSize.fontSize9,
                    ),
              )
            ],
          )
        ],
      );

  Widget statusItem({
    required String title,
    required String value,
    required BuildContext context,
  }) =>
      Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ColorManager.instance.secondary,
                    fontSize: FontSize.fontSize10,
                  ),
            ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ColorManager.instance.primary,
                  fontSize: FontSize.fontSize12,
                ),
          ),
          const SizedBox(width: 16),
        ],
      );
}
