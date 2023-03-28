import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/view/global_widgets/primary_button.dart';
import 'package:taktikat/utils/router/routes.dart';

import '../../../../../../utils/constants/const_images.dart';
import '../../../../../../utils/localization/string_keys.dart';
import '../../../../../../utils/shared/shared_prefs.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/theme/color/color_manager.dart';
import '../../../../../core/theme/size/app_size.dart';
import '../../../../../core/theme/text_theme/text_font_size.dart';
import '../../../../../view_model/home_view_model.dart';
import '../../../../global_widgets/my_network_image.dart';

class UserTheme extends StatelessWidget {
  const UserTheme({
    Key? key,
    this.isFromDrawer = false,
  }) : super(key: key);

  final bool isFromDrawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeViewModel>(builder: (logic) {
        return ListView(
          children: [
            Image.asset(
              ConstImages.theme,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        StringKeys.singleton.yourTheme.tr,
                        style:
                            Theme.of(context).textTheme.displayLarge?.copyWith(
                                  fontSize: FontSize.fontSize18,
                                  color: Theme.of(context).primaryColor,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  MyNetworkImage(
                    url: logic.selectedTheme?.image,
                    width: AppSize.w68,
                    height: AppSize.h64,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    logic.selectedTheme?.name ?? '',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: FontSize.fontSize12,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Divider(
                      height: 2,
                      thickness: 1,
                      color: ColorManager.instance.dividerColor),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: FontSize.fontSize48,
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: logic.themes.length,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 15),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              logic.selectedTheme = logic.themes[index];
                              logic.updateUserTheme();
                              SharedPrefs.instance.setUserTheme(
                                theme: logic.themes[index],
                              );
                              Get.changeTheme(AppTheme.instance.customTheme);
                              Get.changeThemeMode(ThemeMode.light);
                              logic.update();
                            },
                            child: MyNetworkImage(
                              url: logic.themes[index].image,
                              width: AppSize.w44,
                              height: AppSize.h44,
                            ),
                          );
                        }),
                  ),
                  const SizedBox(height: 10),
                  if (isFromDrawer) ...[
                    PrimaryButton(
                      text: StringKeys.singleton.save.tr,
                      onPressed: () {
                        Get.offAllNamed(Routes.homePlaceHolder);
                      },
                    )
                  ]
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
