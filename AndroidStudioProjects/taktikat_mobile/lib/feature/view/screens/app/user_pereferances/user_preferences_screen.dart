import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taktikat/feature/view_model/home_view_model.dart';
import 'package:taktikat/utils/router/routes.dart';
import 'package:taktikat/utils/utils/utils.dart';
import '../../../../../utils/localization/string_keys.dart';
import '../../../../core/theme/color/color_manager.dart';
import '../../../../core/theme/size/app_size.dart';
import '../../../../core/theme/text_theme/text_font_size.dart';
import '../../../../model/enums/preferences_types.dart';
import '../../../global_widgets/my_network_image.dart';
import '../../../global_widgets/primary_button.dart';

class UserPreferencesScreen extends StatelessWidget {
  const UserPreferencesScreen({
    Key? key,
    this.isFromProfile = false,
  }) : super(key: key);

  final bool isFromProfile;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<HomeViewModel>(
          init: HomeViewModel(),
          builder: (logic) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: PageView.builder(
                      controller: logic.pageController,
                      onPageChanged: (index) {
                        logic.currentPreferencesPage = index;
                        logic.update();
                        if (logic.isSearchResult) {
                          logic.isSearchResult = false;
                          logic.getUserPreferences();
                        }
                      },
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return logic.userPreferencesScreen(index);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      ///todo refactor thi section

                      if (logic
                              .userPreferencesSelectedLists(
                                  logic.currentPreferencesPage)
                              ?.isNotEmpty ??
                          false) ...[
                        if (logic
                                .userPreferencesSelectedLists(
                                    logic.currentPreferencesPage)
                                ?.first
                                .id !=
                            -1) ...[
                          const SizedBox(height: 20),
                          Divider(
                            height: 2,
                            thickness: 1,
                            color: ColorManager.instance.dividerColor,
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            height: FontSize.fontSize48,
                            child: ListView.separated(
                                shrinkWrap: true,
                                itemCount: logic
                                        .userPreferencesSelectedLists(
                                            logic.currentPreferencesPage)
                                        ?.length ??
                                    0,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(width: 15),
                                itemBuilder: (context, index) {
                                  if (logic
                                          .userPreferencesSelectedLists(logic
                                              .currentPreferencesPage)?[index]
                                          .id ==
                                      -1) {
                                    return const SizedBox.shrink();
                                  }
                                  return InkWell(
                                    onTap: () {
                                      if (logic.isLoading) {
                                        return;
                                      }
                                      logic.togglePreferences(
                                          preferenceType: PreferencesTypesExtension
                                              .fromInt(logic
                                                      .userPreferencesSelectedLists(
                                                          logic
                                                              .currentPreferencesPage)?[
                                                          index]
                                                      .preferenceId ??
                                                  0),
                                          id: logic
                                                  .userPreferencesSelectedLists(
                                                      logic
                                                          .currentPreferencesPage)?[
                                                      index]
                                                  .model
                                                  ?.id ??
                                              0);
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 2,
                                                  color: ColorManager
                                                      .instance.primary)),
                                          child: MyNetworkImage(
                                            url: logic
                                                .userPreferencesSelectedLists(
                                                    logic
                                                        .currentPreferencesPage)?[
                                                    index]
                                                .model
                                                ?.image,
                                            width: AppSize.w34,
                                            height: AppSize.h34,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          left: 0,
                                          child: Container(
                                            padding: const EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            child: Icon(
                                              Icons.close,
                                              color:
                                                  ColorManager.instance.white,
                                              size: 10,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          )
                        ]
                      ],
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                Utils.instance.isArabic()
                                    ? '''الخطوة ${Utils.instance.convertToArabicNumber((logic.currentPreferencesPage + 1).toString())} من ${Utils.instance.convertToArabicNumber(4.toString())}'''
                                    : '''Step ${logic.currentPreferencesPage + 1} from 4''',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: ColorManager.instance.secondary,
                                    ),
                              ),
                              const SizedBox(height: 5),
                              SmoothPageIndicator(
                                controller: logic.pageController,
                                count: 4,
                                effect: SwapEffect(
                                  dotHeight: 10,
                                  dotWidth: 10,
                                  dotColor:
                                      ColorManager.instance.unselectedText,
                                  activeDotColor:
                                      Theme.of(context).primaryColor,
                                  type: SwapType.zRotation,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          if (isFromProfile) ...[
                            PrimaryButton(
                              onPressed: () {
                                Get.offAllNamed(Routes.homePlaceHolder);
                              },
                              text: StringKeys.singleton.save.tr,
                              fontSize: FontSize.fontSize12,
                              colorText: ColorManager.instance.white,
                              colorBtn: Theme.of(context).primaryColor,
                            ),
                          ] else ...[
                            PrimaryButton(
                              onPressed: () {
                                if (logic.currentPreferencesPage == 3) {
                                  Get.offAllNamed(Routes.homePlaceHolder);
                                } else {
                                  logic.pageController.animateToPage(
                                      logic.currentPreferencesPage + 1,
                                      duration:
                                          const Duration(milliseconds: 800),
                                      curve: const FlippedCurve(Curves.easeIn));
                                }
                              },
                              text: StringKeys.singleton.skip.tr,
                              width: 30,
                              fontSize: FontSize.fontSize12,
                              colorText: ColorManager.instance.white,
                              colorBtn: Theme.of(context).primaryColor,
                            ),
                            if (logic.currentPreferencesPage == 3) ...[
                              const SizedBox(width: 15),
                              PrimaryButton(
                                onPressed: () {
                                  Get.offAllNamed(Routes.homePlaceHolder);
                                },
                                text: StringKeys.singleton.save.tr,
                                fontSize: FontSize.fontSize11,
                                colorText: ColorManager.instance.white,
                                colorBtn: Theme.of(context).primaryColor,
                              )
                            ]
                          ],
                        ],
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
