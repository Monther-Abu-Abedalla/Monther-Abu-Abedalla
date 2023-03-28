import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/feature/view_model/auth_view_model.dart';

import '../../../../../../utils/localization/string_keys.dart';
import '../../../../../../utils/utils/utils.dart';
import '../../../../../core/theme/text_theme/text_font_size.dart';
import '../../../../global_widgets/primary_button.dart';

class VerifyCodeWidget extends StatelessWidget {
  const VerifyCodeWidget({Key? key, required this.isUpdate}) : super(key: key);

  final bool isUpdate;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(builder: (logic) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            StringKeys.singleton.verificationCode.tr,
            style: Utils.instance.getTextTheme.headlineSmall?.copyWith(
              color: Theme.of(context).primaryColor,
              fontSize: FontSize.fontSize30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            StringKeys.singleton.pleaseEnterVerificationCode.tr,
            style: Utils.instance.getTextTheme.bodySmall?.copyWith(
              color: ColorManager.instance.textHintColor,
              fontSize: FontSize.fontSize12,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: PinFieldAutoFill(
              controller: logic.tdVerificationCode,
              decoration: BoxLooseDecoration(
                strokeColorBuilder: PinListenColorBuilder(
                  Theme.of(context).primaryColor,
                  ColorManager.instance.hintColor,
                ),
                gapSpace: 20,
              ),
              cursor: Cursor(
                width: 2,
                color: Theme.of(context).primaryColor,
                enabled: true,
              ),
              codeLength: 4,
              currentCode: logic.tdVerificationCode.text,
              onCodeChanged: (value) {
                if (value?.length == 4) {
                  Utils.instance.hideKeyboard(context: context);
                  logic.verifyCode(
                    isUpdate: isUpdate,
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                StringKeys.singleton.didntGetTheCode.tr,
                style: Utils.instance.getTextTheme.bodySmall?.copyWith(
                  color: ColorManager.instance.textHintColor,
                  fontSize: FontSize.fontSize12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                ' ${logic.timerCounter} ',
                style: Utils.instance.getTextTheme.bodySmall?.copyWith(
                  color: ColorManager.instance.textHintColor,
                  fontSize: FontSize.fontSize12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              InkWell(
                borderRadius: BorderRadius.circular(AppSize.r8),
                onTap: () {
                  logic.resendCode();
                },
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    StringKeys.singleton.resend.tr,
                    style: Utils.instance.getTextTheme.bodySmall?.copyWith(
                        color: logic.timerCounter == 0
                            ? ColorManager.instance.primary
                            : ColorManager.instance.unselectedText,
                        fontSize: FontSize.fontSize12,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<AuthViewModel>(
                builder: (authLogic) => PrimaryButton(
                  onPressed: () {
                    logic.verifyCode(
                      isUpdate: isUpdate,
                    );
                  },
                  isLoading: authLogic.isLoading,
                  text: StringKeys.singleton.validate.tr,
                  fontSize: FontSize.fontSize11,
                  colorText: ColorManager.instance.white,
                  colorBtn: Theme.of(context).primaryColor,
                ),
              ),
            ],
          )
        ],
      );
    });
  }
}
