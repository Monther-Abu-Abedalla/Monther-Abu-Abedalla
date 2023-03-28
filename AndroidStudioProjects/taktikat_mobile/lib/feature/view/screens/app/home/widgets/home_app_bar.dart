import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_font_size.dart';
import 'package:taktikat/feature/model/enums/home_tabs.dart';
import 'package:taktikat/feature/view/global_widgets/my_network_image.dart';
import 'package:taktikat/feature/view_model/home_view_model.dart';
import 'package:taktikat/feature/view_model/match_view_model.dart';
import 'package:taktikat/utils/constants/const_svgs.dart';

import '../../../../../../utils/date/date_time_util.dart';
import '../../../../../../utils/localization/string_keys.dart';
import '../../../../../../utils/shared/shared_prefs.dart';
import '../../../../../../utils/utils/utils.dart';
import '../../../../../core/theme/color/color_manager.dart';
import '../../../../../core/theme/size/app_size.dart';
import '../../../../../model/enums/border_types.dart';
import '../../../../global_widgets/custom_dialog.dart';
import '../../../../global_widgets/custom_text_field.dart';
import '../../../../global_widgets/svg_ink_well.dart';
import '../../../../global_widgets/text_button_with_point.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
    this.title,
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.backgroundColor,
    this.elevation = 4,
    this.bottom,
  }) : super(key: key);

  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final Color? backgroundColor;
  final double elevation;
  final PreferredSizeWidget? bottom;

  static MatchViewModel matchViewModel = Get.find<MatchViewModel>();

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(AppSize.h150);
}

class _HomeAppBarState extends State<HomeAppBar> {
  static Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _debounce = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchViewModel>(builder: (logic) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Column(
              children: [
                const SizedBox(height: 10),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        Utils.instance.isArabic()
                            ? ConstSvg.logo
                            : ConstSvg.logoEn,
                        height: AppSize.h24,
                        width: AppSize.w24,
                      ),
                      if (SharedPrefs.instance.getUserTheme()?.image !=
                          null) ...[
                        const SizedBox(width: 2),
                        VerticalDivider(
                          endIndent: AppSize.h8,
                        ),
                        MyNetworkImage(
                          url: SharedPrefs.instance.getUserTheme()?.image,
                          width: AppSize.w24,
                          height: AppSize.h24,
                        )
                      ],
                      const Spacer(),
                      SvgInkWell(
                        onTap: () {},
                        svgPath: ConstSvg.notification,
                        height: AppSize.h18,
                        width: AppSize.w18,
                      ),
                      GetBuilder<HomeViewModel>(
                        builder: (_) => SvgInkWell(
                          onTap: () {
                            _.clearSearch();
                            CustomDialog.instance.searchDialog(context);
                          },
                          svgPath: ConstSvg.search,
                          height: AppSize.h18,
                          width: AppSize.w18,
                        ),
                      ),
                      SvgInkWell(
                        onTap: () {
                          // Get.to(() => const DrawerScreen());
                        },
                        svgPath: ConstSvg.share,
                        height: AppSize.h18,
                        width: AppSize.w18,
                      ),
                      SvgInkWell(
                        onTap: () {
                          Utils.instance.changeStatusBarColor(
                            color: Colors.transparent,
                            brightness: Brightness.dark,
                          );
                          Scaffold.of(context).openDrawer();
                        },
                        svgPath: ConstSvg.more,
                        height: AppSize.h18,
                        width: AppSize.w18,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButtonWithPoint(
                      isActive: logic.getHomeActiveTab() == HomeTabs.allMatch,
                      onPressed: () {
                        logic.setHomeActiveTab(HomeTabs.allMatch);
                        logic.getMatchesByDate(date: logic.date);
                      },
                      text: StringKeys.singleton.allMatch.tr,
                    ),
                    TextButtonWithPoint(
                      isActive: logic.getHomeActiveTab() == HomeTabs.favorite,
                      onPressed: () {
                        logic.setHomeActiveTab(HomeTabs.favorite);
                        if (!SharedPrefs.instance.getIsVisiter()) {
                          logic.matches.clear();
                          logic.getFavoriteMatches(date: logic.date);
                        }
                      },
                      text: StringKeys.singleton.favorite.tr,
                    ),
                    TextButtonWithPoint(
                      isActive: logic.getHomeActiveTab() == HomeTabs.whoWillWin,
                      onPressed: () {
                        logic.setHomeActiveTab(HomeTabs.whoWillWin);
                        logic.getCompetitions(date: logic.date);
                      },
                      text: StringKeys.singleton.whoWillWin.tr,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (logic.getHomeActiveTab() == HomeTabs.allMatch) {
                        logic.isLive = !logic.isLive;
                        logic.update();

                        logic.getMatchesByDate(
                            date: Utils.instance.todayDate(),
                            isLive: logic.isLive);
                      } else if (logic.getHomeActiveTab() ==
                          HomeTabs.favorite) {
                        logic.isLive = !logic.isLive;
                        logic.update();
                        logic.getFavoriteMatches(
                            date: Utils.instance.todayDate(),
                            isLive: logic.isLive);
                      }
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              StringKeys.singleton.live.tr,
                              style: Utils.instance.getTextTheme.bodySmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: logic.isLive
                                          ? ColorManager.instance.black
                                          : ColorManager.instance.secondary,
                                      fontSize: FontSize.fontSize10),
                            ),
                            const SizedBox(width: 7),
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 400),
                              opacity: logic.isLive ? 1 : 0,
                              child: Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                    color: logic.isLive
                                        ? ColorManager.instance.onPrimary
                                        : ColorManager.instance.transparent,
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(width: AppSize.w2),
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 350),
                    crossFadeState: logic.isSearchExpand
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    secondChild: const SizedBox.shrink(),
                    firstChild: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              logic.date =
                                  logic.date.subtract(const Duration(days: 1));
                              // logic.date = Utils.instance.isArabic()
                              //     ? logic.date.add(const Duration(days: 1))
                              //     : logic.date.subtract(const Duration(days: 1));
                              if (logic.getHomeActiveTab() ==
                                  HomeTabs.allMatch) {
                                logic.getMatchesByDate(
                                    date: logic.date, isLive: logic.isLive);
                              } else if (logic.getHomeActiveTab() ==
                                  HomeTabs.favorite) {
                                logic.getFavoriteMatches(
                                    date: logic.date, isLive: logic.isLive);
                              } else if (logic.getHomeActiveTab() ==
                                  HomeTabs.whoWillWin) {
                                logic.getCompetitions(date: logic.date);
                              }
                            },
                            radius: 15,
                            child: Utils.instance.isArabic()
                                ? SvgPicture.asset(ConstSvg.previous)
                                : SvgPicture.asset(ConstSvg.next),
                          ),
                          const SizedBox(width: 15),
                          InkWell(
                            onTap: () {
                              DateUtility.selectDate(
                                  ctx: context,
                                  initialDate: logic.date,
                                  onChoose: (value) {
                                    logic.date = value!;
                                    Logger().i(value);
                                    logic.getMatchesByDate(date: value);
                                  });
                            },
                            child: Text(
                              DateUtility.isDatesEquals(
                                      firstDate: logic.date,
                                      secondDate: DateTime.now())
                                  ? StringKeys.singleton.today.tr
                                  : DateUtility.isDateTomorrow(date: logic.date)
                                      ? StringKeys.singleton.tomorrow.tr
                                      : DateUtility.isDateYesterday(
                                              date: logic.date)
                                          ? StringKeys.singleton.yesterday.tr
                                          : DateUtility
                                              .getDayNumberAndMonthName(
                                                  dateTime: logic.date),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    color:
                                        ColorManager.instance.yellowTextColor,
                                  ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          InkWell(
                            onTap: () {
                              logic.date =
                                  logic.date.add(const Duration(days: 1));
                              // Utils.instance.isArabic()
                              //     ? logic.date.subtract(const Duration(days: 1))
                              //     : logic.date.add(const Duration(days: 1));

                              if (logic.getHomeActiveTab() ==
                                  HomeTabs.allMatch) {
                                logic.getMatchesByDate(
                                    date: logic.date, isLive: logic.isLive);
                              } else if (logic.getHomeActiveTab() ==
                                  HomeTabs.favorite) {
                                logic.getFavoriteMatches(
                                    date: logic.date, isLive: logic.isLive);
                              } else if (logic.getHomeActiveTab() ==
                                  HomeTabs.whoWillWin) {
                                logic.getCompetitions(date: logic.date);
                              }
                            },
                            child: Utils.instance.isArabic()
                                ? SvgPicture.asset(ConstSvg.next)
                                : SvgPicture.asset(ConstSvg.previous),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: AppSize.w14),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    width: logic.isSearchExpand ? 250 : 26,
                    height: AppSize.h26,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: logic.isSearchExpand
                          ? Theme.of(context).colorScheme.primaryContainer
                          : ColorManager.instance.transparent,
                    ),
                    child: Row(
                      children: [
                        logic.isSearchExpand
                            ? Expanded(
                                child: CustomTextFormFiled(
                                hint: StringKeys.singleton.search.tr,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: ColorManager.instance.black),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                textInputAction: TextInputAction.done,
                                borderType: BorderTypes.none,
                                borderColor: ColorManager.instance.dividerColor,
                                onChanged: (value) {
                                  if (_debounce?.isActive ?? false) {
                                    _debounce?.cancel();
                                  }
                                  _debounce = Timer(
                                      const Duration(milliseconds: 500), () {
                                    if (logic.getHomeActiveTab() ==
                                        HomeTabs.allMatch) {
                                      logic.getMatchesByDate(
                                        search: value ?? '',
                                        date: logic.date,
                                        isLive: logic.isLive,
                                        isHaveLoading: true,
                                      );
                                    } else if (logic.getHomeActiveTab() ==
                                        HomeTabs.favorite) {
                                      logic.getFavoriteMatches(
                                          search: value ?? '',
                                          date: logic.date,
                                          isLive: logic.isLive);
                                    }
                                  });
                                  return;
                                },
                              ))
                            : const SizedBox.shrink(),
                        InkWell(
                          onTap: () {
                            if (logic.getHomeActiveTab() !=
                                HomeTabs.whoWillWin) {
                              logic.searchExpand();
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: logic.isSearchExpand
                                ? Icon(
                                    Icons.close,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    size: 15,
                                  )
                                : RotatedBox(
                                    quarterTurns: 3,
                                    child: SvgPicture.asset(
                                      ConstSvg.search,
                                      colorFilter: ColorFilter.mode(
                                        ColorManager.instance.white,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget deletedWidget(MatchViewModel logic) => AnimatedPadding(
        padding: EdgeInsets.only(left: logic.isLive ? 0 : 10),
        duration: const Duration(milliseconds: 900),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedCrossFade(
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 900),
              crossFadeState: logic.isLive
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  StringKeys.singleton.live.tr,
                  style: Utils.instance.getTextTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: logic.isLive
                          ? ColorManager.instance.black
                          : ColorManager.instance.secondary,
                      fontSize: FontSize.fontSize8),
                ),
              ),
              secondChild: const SizedBox.shrink(),
            ),
            const SizedBox(width: 8),
            Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                  color: logic.isLive
                      ? ColorManager.instance.primary
                      : ColorManager.instance.white,
                  shape: BoxShape.circle),
            ),
            const SizedBox(width: 8),
            AnimatedCrossFade(
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 700),
              crossFadeState: logic.isLive
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    StringKeys.singleton.live.tr,
                    style: Utils.instance.getTextTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: logic.isLive
                          ? ColorManager.instance.black
                          : ColorManager.instance.secondary,
                      fontSize: FontSize.fontSize8,
                    ),
                  )),
              secondChild: const SizedBox.shrink(),
            ),
          ],
        ),
      );
}
