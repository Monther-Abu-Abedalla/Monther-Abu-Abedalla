import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';
import 'package:taktikat/feature/model/enums/social_types.dart';
import 'package:taktikat/feature/view_model/auth_view_model.dart';

import '../../../../../utils/constants/const_images.dart';
import '../../../../../utils/constants/const_svgs.dart';
import '../../../../../utils/localization/string_keys.dart';
import '../../../../../utils/utils/utils.dart';
import '../../../../core/theme/size/app_size.dart';
import '../../../../core/theme/text_theme/text_font_size.dart';
import '../../../global_widgets/primary_button.dart';
import '../../../global_widgets/primary_button_with_icon.dart';
import '../../../global_widgets/svg_ink_well.dart';
import 'widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Image.asset(
              ConstImages.signupLogo,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const SignupForm(),
                  const SizedBox(height: 25),
                  GetBuilder<AuthViewModel>(
                    builder: (authLogin) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgInkWell(
                          svgPath: ConstSvg.google,
                          onTap: () {
                            if (!authLogin.isAcceptedPrivacyPolicy) {
                              Utils.instance.snackError(
                                body:
                                    StringKeys.singleton.acceptPrivacyPolicy.tr,
                              );
                              return;
                            }
                            authLogin.socialLogin(
                                socialType: SocialType.google);
                          },
                        ),
                        const SizedBox(width: 12),
                        SvgInkWell(
                          svgPath: ConstSvg.twitter,
                          onTap: () {
                            if (!authLogin.isAcceptedPrivacyPolicy) {
                              Utils.instance.snackError(
                                body:
                                    StringKeys.singleton.acceptPrivacyPolicy.tr,
                              );
                              return;
                            }
                            authLogin.socialLogin(
                                socialType: SocialType.twitter);
                          },
                        ),
                        const SizedBox(width: 12),
                        SvgInkWell(
                          svgPath: ConstSvg.facebook,
                          onTap: () {
                            if (!authLogin.isAcceptedPrivacyPolicy) {
                              Utils.instance.snackError(
                                body:
                                    StringKeys.singleton.acceptPrivacyPolicy.tr,
                              );
                              return;
                            }
                            authLogin.socialLogin(
                                socialType: SocialType.facebook);
                          },
                        ),
                        const SizedBox(width: 12),
                        SvgInkWell(
                          svgPath: ConstSvg.apple,
                          onTap: () {
                            if (!authLogin.isAcceptedPrivacyPolicy) {
                              Utils.instance.snackError(
                                body:
                                    StringKeys.singleton.acceptPrivacyPolicy.tr,
                              );
                              return;
                            }
                            authLogin.socialLogin(socialType: SocialType.apple);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: Utils.instance.isArabic()
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    children: [
                      GetBuilder<AuthViewModel>(
                        builder: (authLogic) => PrimaryButtonIcon(
                          onPressed: () {
                            if (!authLogic.isAcceptedPrivacyPolicy) {
                              Utils.instance.snackError(
                                body:
                                    StringKeys.singleton.acceptPrivacyPolicy.tr,
                              );
                              return;
                            }
                            authLogic.login();
                          },
                          isLoading: authLogic.isLoading,
                          text: StringKeys.singleton.continu.tr,
                          colorBtn: ColorManager.instance.primary,
                          fontSize: FontSize.fontSize13,
                          colorText: ColorManager.instance.white,
                          icon: RotatedBox(
                            quarterTurns: Utils.instance.isArabic() ? 2 : 0,
                            child: SvgPicture.asset(
                              ConstSvg.arrow,
                              height: AppSize.h8,
                              width: AppSize.w8,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      GetBuilder<AuthViewModel>(
                        builder: (authLogic) => PrimaryButton(
                          onPressed: () {
                            if (!authLogic.isAcceptedPrivacyPolicy) {
                              Utils.instance.snackError(
                                body:
                                    StringKeys.singleton.acceptPrivacyPolicy.tr,
                              );
                              return;
                            }
                            authLogic.skipLogin();
                          },
                          isLoading: false,
                          text: StringKeys.singleton.skip.tr,
                          fontSize: FontSize.fontSize13,
                          colorText: ColorManager.instance.white,
                          colorBtn: ColorManager.instance.primary,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 26),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
