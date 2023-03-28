import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/feature/view_model/home_view_model.dart';
import 'package:taktikat/feature/view_model/match_view_model.dart';
import 'package:taktikat/feature/view_model/profile_view_model.dart';
import 'package:taktikat/utils/constants/const_images.dart';
import 'package:taktikat/utils/constants/const_svgs.dart';
import 'package:taktikat/utils/constants/constants.dart';
import 'package:taktikat/utils/localization/string_keys.dart';

import '../../../utils/router/routes.dart';
import '../../../utils/shared/shared_prefs.dart';
import '../../../utils/utils/utils.dart';
import '../../core/theme/color/color_manager.dart';
import '../../core/theme/text_theme/text_font_size.dart';
import 'drawer_item.dart';
import 'expandable_widget.dart';
import 'my_network_image.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  static MatchViewModel matchViewModel = Get.find<MatchViewModel>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: GetBuilder<HomeViewModel>(builder: (logic) {
        return ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: AppSize.h220,
                ),
                MyNetworkImage(
                  height: AppSize.h200,
                  width: double.infinity,
                  url: SharedPrefs.instance.getUserTheme()?.bgImage,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(AppSize.r20),
                  ),
                ),
                PositionedDirectional(
                  bottom: 0,
                  start: 30,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: ColorManager.instance.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,
                        color: ColorManager.instance.unselectedText,
                      ),
                    ),
                    child: GetBuilder<ProfileViewModel>(
                      init: ProfileViewModel(),
                      builder: (_) {
                        return MyNetworkImage(
                          url: SharedPrefs.instance.getUserData()?.image ??
                              ConstImages.defaultUserImage,
                          width: AppSize.w60,
                          height: AppSize.h60,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 10),
            GetBuilder<ProfileViewModel>(
              init: ProfileViewModel(),
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    SharedPrefs.instance.getUserData()?.username ??
                        SharedPrefs.instance.getUserData()?.email ??
                        '',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: FontSize.fontSize14,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                );
              },
            ),

            if (SharedPrefs.instance.getIsUserLoggedIn() &&
                !SharedPrefs.instance.getIsVisiter()) ...[
              const SizedBox(height: 20),
              DrawerItem(
                onTap: () {
                  Get.toNamed(Routes.userProfile);
                },
                title: StringKeys.singleton.profile.tr,
                icon: ConstSvg.profile,
              ),
            ],

        // DrawerItem(onTap: () {}, title: 'All News', icon: ConstSvg.allNews),
        // DrawerItem(
        //     onTap: () {},
        //     title: 'Champions and leagues',
        //     icon: ConstSvg.championsAndLeagues),
        // DrawerItem(onTap: () {}, title: 'Favorite', icon: ConstSvg.favorite),
        // DrawerItem(
        //     onTap: () {},
        //     title: 'Notifications',
        //     icon: ConstSvg.notifications),
        // DrawerItem(onTap: () {}, title: 'Blogs', icon: ConstSvg.blogs),
        // DrawerItem(onTap: () {}, title: 'Reels', icon: ConstSvg.reels),
        // DrawerItem(onTap: () {}, title: 'Stadiums', icon: ConstSvg.stadiums),
        // DrawerItem(onTap: () {}, title: 'Referees', icon: ConstSvg.referees),
            ExpandableDrawerItem(
              title: StringKeys.singleton.languages.tr,
              icon: ConstSvg.languages,
              expanded: Container(
                decoration: BoxDecoration(
                  color: ColorManager.instance.hintColor,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Material(
                            color: ColorManager.instance.hintColor,
                            child: InkWell(
                              onTap: () {
                                logic.changeLanguage(
                                    language: Constants.arLangCode);
                                matchViewModel.getMatchesByDate(
                                    date: matchViewModel.date);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                child: Text(
                                  StringKeys.singleton.arabic.tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontSize: FontSize.fontSize12,
                                        color: ColorManager.instance.secondary,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                        height: 2,
                        thickness: 1,
                        color: ColorManager.instance.dividerColor),
                    Row(
                      children: [
                        Expanded(
                          child: Material(
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            color: ColorManager.instance.hintColor,
                            child: InkWell(
                              onTap: () {
                                logic.changeLanguage(
                                    language: Constants.enLangCode);
                                matchViewModel.getMatchesByDate(
                                    date: matchViewModel.date);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                child: Text(
                                  StringKeys.singleton.english.tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontSize: FontSize.fontSize12,
                                        color: ColorManager.instance.secondary,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            DrawerItem(
              onTap: () {
                if (SharedPrefs.instance.getIsUserLoggedIn() &&
                    !SharedPrefs.instance.getIsVisiter()) {
                  Get.offNamed(Routes.userPreferences, arguments: false);
                  Future.delayed(const Duration(milliseconds: 500), () {
                    Utils.instance
                        .getController(HomeViewModel())
                        .changeCurrentPage(index: 3);
                  });
                } else {
                  Utils.instance.getController(HomeViewModel()).getThemes();
                  Get.offNamed(Routes.userTheme, arguments: true);
                }
              },
              title: StringKeys.singleton.theme.tr,
              icon: ConstSvg.theme,
              trailing: MyNetworkImage(
                url: SharedPrefs.instance.getUserTheme()?.image,
                width: AppSize.w24,
                height: AppSize.h24,
              ),
            ),
            if (SharedPrefs.instance.getIsUserLoggedIn() &&
                !SharedPrefs.instance.getIsVisiter()) ...[
              DrawerItem(
                onTap: () {
                  SharedPrefs.instance.clearPrefs();
                  logic.currentPreferencesPage = 0;
                  Get.offAllNamed(Routes.signUp);
                },
                title: StringKeys.singleton.logout.tr,
                icon: ConstSvg.logout,
              ),
            ] else if (SharedPrefs.instance.getIsVisiter()) ...[
              DrawerItem(
                onTap: () {
                  SharedPrefs.instance.clearPrefs();
                  logic.currentPreferencesPage = 0;
                  Get.back();
                  Get.offAllNamed(Routes.signUp);
                },
                title: StringKeys.singleton.signUp.tr,
                icon: ConstSvg.logout,
              ),
            ]
          ],
        );
      }),
    );
  }
}

class ExpandableDrawerItem extends StatelessWidget {
  final String title;
  final String icon;
  final Widget expanded;

  const ExpandableDrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.expanded,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableWidget(
      logic: HomeViewModel(),
      preview: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            ListTile(
              title: Row(
                children: [
                  SvgPicture.asset(icon,
                      colorFilter: ColorFilter.mode(
                        ColorManager.instance.unselectedText,
                        BlendMode.srcIn,
                      ),
                      height: AppSize.h16),
                  const SizedBox(width: 20),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: FontSize.fontSize12,
                          color: ColorManager.instance.secondary,
                        ),
                  )
                ],
              ),
              trailing: SvgPicture.asset(
                ConstSvg.down,
                colorFilter: ColorFilter.mode(
                  ColorManager.instance.unselectedText,
                  BlendMode.srcIn,
                ),
                height: AppSize.h16,
              ),
            ),
            Divider(
                height: 2,
                thickness: 1,
                color: ColorManager.instance.dividerColor)
          ],
        ),
      ),
      expanded: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: expanded,
      ),
    );
  }
}
