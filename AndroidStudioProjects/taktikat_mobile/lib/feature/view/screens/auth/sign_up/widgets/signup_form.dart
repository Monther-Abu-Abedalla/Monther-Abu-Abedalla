import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/view_model/auth_view_model.dart';
import 'package:taktikat/utils/utils/validator.dart';

import '../../../../../../utils/localization/string_keys.dart';
import '../../../../../../utils/utils/utils.dart';
import '../../../../../core/theme/color/color_manager.dart';
import '../../../../../core/theme/text_theme/text_font_size.dart';
import '../../../../../model/enums/border_types.dart';
import '../../../../global_widgets/circular_radio_button.dart';
import '../../../../global_widgets/custom_text_field.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
      builder: (logic) {
        logic.loginKey = GlobalKey<FormState>();
        return Form(
          key: logic.loginKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringKeys.singleton.signUp.tr,
                style: Utils.instance.getTextTheme.headlineSmall?.copyWith(
                    color: ColorManager.instance.primary,
                    fontSize: FontSize.fontSize30),
              ),
              const SizedBox(height: 8),
              CustomTextFormFiled(
                hint: StringKeys.singleton.signupHint.tr,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                textInputAction: TextInputAction.done,
                borderType: BorderTypes.underlineInput,
                borderColor: ColorManager.instance.dividerColor,
                controller: logic.tdMobileOrEmail,
                validator: Validator.instance.emailOrMobileValidator,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9@.]')),
                ],
              ),
              const SizedBox(height: 14),
              CircularRadioButton(
                onClick: () {
                  logic.updatePrivacyPolicy();
                },
                title: StringKeys.singleton.agreeToPrivacyPolicy.tr,
                value: logic.isAcceptedPrivacyPolicy,
              ),
            ],
          ),
        );
      },
    );
  }
}
