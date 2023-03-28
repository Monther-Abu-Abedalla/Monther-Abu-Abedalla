import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/feature/view/global_widgets/primary_button.dart';
import 'package:taktikat/feature/view/screens/app/profile/widgets/profile_text_field.dart';
import 'package:taktikat/feature/view_model/profile_view_model.dart';
import 'package:taktikat/utils/constants/const_svgs.dart';
import 'package:taktikat/utils/localization/string_keys.dart';
import 'package:taktikat/utils/utils/utils.dart';
import 'package:taktikat/utils/utils/validator.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
        builder: (_) => Form(
              key: _.profileFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTextField(
                    controller: _.tdSeureName,
                    labelText: StringKeys.singleton.surename.tr,
                    svgPath: ConstSvg.serName,
                    validator: Validator.instance.emptyValidator,
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    controller: _.tdUserName,
                    labelText: StringKeys.singleton.usernameWithout.tr,
                    svgPath: ConstSvg.userName,
                    validator: Validator.instance.emptyValidator,
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    controller: _.tdEmail,
                    labelText: StringKeys.singleton.email.tr,
                    svgPath: ConstSvg.email,
                    validator: (x) {
                      if (x?.isNotEmpty ?? false) {
                        if (!GetUtils.isEmail(x ?? '')) {
                          return StringKeys.singleton.pleaseEnterValidEmail.tr;
                        }
                      }

                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    controller: _.tdPhone,
                    labelText: StringKeys.singleton.phone.tr,
                    svgPath: ConstSvg.phone,
                    validator: (x) {
                      if (x?.isNotEmpty ?? false) {
                        if (!GetUtils.isPhoneNumber(x ?? '')) {
                          return StringKeys.singleton.pleaseEnterValidMobile.tr;
                        }
                      }

                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9۰-۹]')),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryButton(
                        text: StringKeys.singleton.save.tr,
                        isLoading: _.isLoadingUpdateProfile,
                        onPressed: () {
                          if (_.profileFormKey.currentState!.validate()) {
                            if (_.tdPhone.text.isEmpty &&
                                _.tdEmail.text.isEmpty) {
                              Utils.instance.snackError(
                                  body: StringKeys.singleton
                                      .youMustSubmitValidEmailOrPhoneNumber.tr);
                            }
                            _.updateProfile();
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ));
  }

  Widget _buildTextField({
    TextEditingController? controller,
    required String? labelText,
    required String svgPath,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    TextStyle? style,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return ProfileTextField(
      controller: controller,
      icon: Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(
          svgPath,
          height: AppSize.h16,
          width: AppSize.w16,
        ),
      ),
      labelText: labelText,
      style: style,
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
    );
  }
}
