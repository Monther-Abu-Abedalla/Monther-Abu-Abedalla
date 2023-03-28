import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/view_model/match_detail_view_model.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../../core/theme/color/color_manager.dart';
import '../../core/theme/size/app_size.dart';
import 'my_network_image.dart';

class CustomTabs extends StatelessWidget {
  const CustomTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchDetailViewModel>(builder: (logic) {
      return Center(
        child: Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.r10),
            border: Border.all(
              // width: 1,
              color: ColorManager.instance.unselectedText,
            ),
          ),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Material(
                    color: logic.isHome
                        ? Theme.of(context).primaryColor
                        : ColorManager.instance.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(AppSize.r10),
                      ),
                      onTap: () {
                        logic.isHome = true;
                        logic.update();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
                            MyNetworkImage(
                              url: logic.matchDetails?.homeTeam?.logo,
                              width: AppSize.w25,
                              height: AppSize.h24,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              flex: 10,
                              child: Text(
                                Utils.instance.isArabic()
                                    ? logic.matchDetails?.homeTeam?.nameValues
                                            ?.ar ??
                                        ''
                                    : logic.matchDetails?.homeTeam?.nameValues
                                            ?.en ??
                                        '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: logic.isHome
                                          ? ColorManager.instance.white
                                          : ColorManager.instance.dashColor,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // VerticalDivider(
                //     width: 2,
                //     thickness: 1,
                //     color: ColorManager.instance.secondary),
                Expanded(
                  child: Material(
                    color: logic.isHome
                        ? ColorManager.instance.transparent
                        : Theme.of(context).primaryColor,
                    child: InkWell(
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(AppSize.r10),
                      ),
                      onTap: () {
                        logic.isHome = false;
                        logic.update();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
                            Expanded(
                              flex: 10,
                              child: Text(
                                Utils.instance.isArabic()
                                    ? logic.matchDetails?.awayTeam?.nameValues
                                            ?.ar ??
                                        ''
                                    : logic.matchDetails?.awayTeam?.nameValues
                                            ?.en ??
                                        '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: logic.isHome
                                          ? ColorManager.instance.dashColor
                                          : ColorManager.instance.white,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(width: 4),
                            MyNetworkImage(
                              url: logic.matchDetails?.awayTeam?.logo,
                              width: AppSize.w25,
                              height: AppSize.h24,
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
      );
    });
  }
}
