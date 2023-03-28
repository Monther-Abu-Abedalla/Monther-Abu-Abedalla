import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/feature/view_model/home_view_model.dart';
import 'package:taktikat/utils/constants/const_svgs.dart';
import 'package:taktikat/utils/localization/string_keys.dart';

import '../../core/theme/text_theme/text_font_size.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (logic) {
        return Container(
          decoration: BoxDecoration(
              color: ColorManager.instance.primaryContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              boxShadow: const [
                BoxShadow(
                    color: Color(0x33000000),
                    offset: Offset(0, 2),
                    spreadRadius: 2,
                    blurRadius: 4),
              ]),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BottomNavItem(
                onTap: () {
                  logic.changeBottomNavIndex(4);
                  Scaffold.of(context).openDrawer();
                },
                logic: logic,
                icon: ConstSvg.menu,
                title: StringKeys.singleton.more.tr,
                index: 4,
              ),
              BottomNavItem(
                onTap: () {},
                logic: logic,
                icon: ConstSvg.analysis,
                title: StringKeys.singleton.analysis.tr,
                index: 3,
              ),
              BottomNavItem(
                onTap: () {},
                logic: logic,
                icon: ConstSvg.championships,
                title: StringKeys.singleton.championships.tr,
                index: 2,
              ),
              BottomNavItem(
                onTap: () {},
                logic: logic,
                icon: ConstSvg.news,
                title: StringKeys.singleton.news.tr,
                index: 1,
              ),
              BottomNavItem(
                onTap: () {
                  logic.changeBottomNavIndex(0);
                },
                logic: logic,
                icon: ConstSvg.playground,
                title: StringKeys.singleton.match.tr,
                index: 0,
              ),
            ],
          ),
        );
      },
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String title;
  final String icon;
  final int index;
  final HomeViewModel logic;
  final Function() onTap;

  const BottomNavItem({
    Key? key,
    required this.logic,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        height: AppSize.h60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   width: 10,
            //   height: 8,
            //   decoration: BoxDecoration(
            //     color: _.bottomNavIndex == 4
            //         ? Theme.of(context).colorScheme.primary
            //         : ColorManager.instance.transparent,
            //     borderRadius: const BorderRadius.only(
            //       bottomLeft: Radius.circular(100),
            //       bottomRight: Radius.circular(100),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 6),
            SvgPicture.asset(
              icon,
              height: AppSize.h16,
              width: AppSize.w16,
              colorFilter: logic.bottomNavIndex == index
                  ? ColorFilter.mode(
                      Theme.of(context).colorScheme.primary,
                      BlendMode.srcIn,
                    )
                  : null,
            ),
            const SizedBox(height: 7),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: FontSize.fontSize10,
                    color: logic.bottomNavIndex == index
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).hintColor,
                  ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
