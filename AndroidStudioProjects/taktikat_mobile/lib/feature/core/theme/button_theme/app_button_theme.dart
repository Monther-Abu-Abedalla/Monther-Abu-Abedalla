import 'package:flutter/material.dart';

import '../../../../utils/constants/constants.dart';
import '../color/color_manager.dart';
import '../size/app_size.dart';
import '../text_theme/text_font_size.dart';
import '../text_theme/text_manager.dart';

class AppButtonTheme {
  AppButtonTheme._();
  static AppButtonTheme instance = AppButtonTheme._();

  ElevatedButtonThemeData get elevatedButtonStyle => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.instance.transparent,
            foregroundColor: ColorManager.instance.white,
            side: BorderSide.none,
            elevation: 0.5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.r8)),
            minimumSize: const Size(double.infinity, 48),
            textStyle: TextStyle(
                fontFamily: Constants.fontFamily,
                color: Colors.white,
                fontSize: FontSize.fontSize16,
                fontWeight: FontWeight.bold)),
      );

  OutlinedButtonThemeData get outlinedButtonStyle => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          // backgroundColor: ColorManager.instance.white,
          backgroundColor: ColorManager.instance.transparent,
          side: BorderSide(color: ColorManager.instance.white, width: 0.86),
          elevation: 0,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.r10),
          ),
          minimumSize: Size(double.infinity, AppSize.h44),
          textStyle: TextManager.headline5
              .copyWith(color: ColorManager.instance.white),
        ),
      );

  ButtonStyle outlinedButtonTheme({Color? textColor, Color? borderColor}) =>
      OutlinedButton.styleFrom(
          backgroundColor: textColor ?? ColorManager.instance.white,
          disabledForegroundColor: ColorManager.instance.whitePercentage50,
          elevation: 0,
          side: BorderSide(
            color: borderColor ?? ColorManager.instance.white,
            width: 0.5,
          ),
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.r8),
              side: BorderSide(
                  color: borderColor ?? ColorManager.instance.white)),
          minimumSize: Size(double.infinity, AppSize.h44),
          textStyle: TextStyle(
            fontSize: FontSize.fontSize12,
            fontFamily: Constants.fontFamily,
          ));

  TextButtonThemeData get textButtonStyle => TextButtonThemeData(
        style: TextButton.styleFrom(
          surfaceTintColor: ColorManager.instance.primary,
          backgroundColor: ColorManager.instance.transparent,
          foregroundColor: ColorManager.instance.primary,
        ),
      );
}
