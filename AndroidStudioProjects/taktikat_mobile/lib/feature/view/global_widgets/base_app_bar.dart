import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_font_size.dart';
import 'package:taktikat/feature/model/enums/border_types.dart';
import 'package:taktikat/feature/view_model/home_view_model.dart';
import 'package:taktikat/utils/constants/const_svgs.dart';

import '../../../utils/localization/string_keys.dart';
import '../../../utils/utils/utils.dart';
import '../../core/theme/color/color_manager.dart';
import '../../core/theme/size/app_size.dart';
import 'custom_text_field.dart';
import 'text_button_with_point.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
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

  static HomeViewModel homeViewModel = Get.find<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(builder: (logic) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    SvgPicture.asset(
                      Utils.instance.isArabic()
                          ? ConstSvg.logo
                          : ConstSvg.logoEn,
                      height: AppSize.h24,
                      width: AppSize.w24,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        // Get.to(() => const DrawerScreen());
                      },
                      radius: 15,
                      child: SvgPicture.asset(
                        ConstSvg.notification,
                      ),
                    ),
                    const SizedBox(width: 18),
                    InkWell(
                      onTap: () {
                        // Get.to(() => const DrawerScreen());
                      },
                      radius: 15,
                      child: SvgPicture.asset(
                        ConstSvg.search,
                      ),
                    ),
                    const SizedBox(width: 18),
                    InkWell(
                      onTap: () {
                        // Get.to(() => const DrawerScreen());
                      },
                      radius: 15,
                      child: SvgPicture.asset(
                        ConstSvg.share,
                      ),
                    ),
                    const SizedBox(width: 18),
                    InkWell(
                      onTap: () {
                        // Get.to(() => const DrawerScreen());
                      },
                      radius: 15,
                      child: SvgPicture.asset(
                        ConstSvg.more,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButtonWithPoint(
                      isActive: true,
                      onPressed: () {},
                      text: StringKeys.singleton.allMatch.tr,
                    ),
                    TextButtonWithPoint(
                      isActive: false,
                      onPressed: () {},
                      text: StringKeys.singleton.favorite.tr,
                    ),
                    TextButtonWithPoint(
                      isActive: false,
                      onPressed: () {},
                      text: StringKeys.singleton.whoWillWin.tr,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 350),
                  firstCurve: Curves.easeIn,
                  secondCurve: Curves.easeInBack,
                  excludeBottomFocus: true,
                  crossFadeState: logic.isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  secondChild: InkWell(
                      onTap: () {
                        logic.searchExpand();
                      },
                      child: SizedBox(
                        width: 65,
                        child: Icon(Icons.clear,
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            size: 25),
                      )),
                  firstChild: InkWell(
                    onTap: () {
                      logic.isLive = !logic.isLive;
                      logic.update();
                    },
                    child: Container(
                      width: 65,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 9, vertical: 5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: logic.isLive
                          ? Row(
                              children: [
                                Container(
                                  height: 18,
                                  width: 18,
                                  decoration: BoxDecoration(
                                      color: ColorManager.instance.error,
                                      shape: BoxShape.circle),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  StringKeys.singleton.live.tr,
                                  style: Utils.instance.getTextTheme.bodySmall
                                      ?.copyWith(
                                          color: ColorManager.instance.black),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                Text(
                                  StringKeys.singleton.live.tr,
                                  style: Utils.instance.getTextTheme.bodySmall
                                      ?.copyWith(
                                          color:
                                              ColorManager.instance.secondary),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  height: 18,
                                  width: 18,
                                  decoration: BoxDecoration(
                                      color: ColorManager.instance.white,
                                      shape: BoxShape.circle),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 350),
                  crossFadeState: logic.isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  secondChild: const SizedBox.shrink(),
                  firstChild: Row(
                    children: [
                      SvgPicture.asset(ConstSvg.next),
                      const SizedBox(width: 30),
                      Text(
                        'Today',
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  color: ColorManager.instance.yellowTextColor,
                                ),
                      ),
                      const SizedBox(width: 30),
                      SvgPicture.asset(ConstSvg.previous),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: logic.isExpanded ? 200 : 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: logic.isExpanded
                            ? CustomTextFormFiled(
                                hint: StringKeys.singleton.signupHint.tr,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                textInputAction: TextInputAction.done,
                                borderType: BorderTypes.none,
                                borderColor: ColorManager.instance.dividerColor,
                              )
                            : const SizedBox.shrink(),
                      ),
                      InkWell(
                          onTap: () {
                            logic.searchExpand();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.search,
                                color: Theme.of(context).colorScheme.secondary,
                                size: FontSize.fontSize14,
                              ),
                            ),
                          )),
                    ],
                  ),
                )
              
              
              ],
            ),
          ),
        ],
      );
    });
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSize.h145);
}
