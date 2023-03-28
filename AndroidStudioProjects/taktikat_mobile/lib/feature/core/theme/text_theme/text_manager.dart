import 'package:flutter/material.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_font_size.dart';

import '../../../../utils/constants/constants.dart';
import '../color/color_manager.dart';

abstract class TextManager {
  static TextStyle get inputTheme => TextStyle(
        fontWeight: FontWeight.w300,
        fontFamily: Constants.fontFamily,
        color: ColorManager.instance.black,
      );

  static TextStyle get headline1 => TextStyle(
      color: ColorManager.instance.textColor,
      overflow: TextOverflow.ellipsis,
      fontFamily: Constants.fontFamily,
      fontWeight: FontWeight.normal,
      fontSize: FontSize.fontSize34);

  static TextStyle get headline2 => TextStyle(
      color: ColorManager.instance.textColor,
      overflow: TextOverflow.ellipsis,
      fontFamily: Constants.fontFamily,
      fontWeight: FontWeight.normal,
      fontSize: FontSize.fontSize28);

  static TextStyle get headline3 => TextStyle(
      color: ColorManager.instance.textColor,
      overflow: TextOverflow.ellipsis,
      fontFamily: Constants.fontFamily,
      fontWeight: FontWeight.normal,
      fontSize: FontSize.fontSize24);

  static TextStyle get headline4 => TextStyle(
      color: ColorManager.instance.textColor,
      overflow: TextOverflow.ellipsis,
      fontFamily: Constants.fontFamily,
      fontWeight: FontWeight.normal,
      fontSize: FontSize.fontSize20);

  static TextStyle get headline5 => TextStyle(
      color: ColorManager.instance.textColor,
      overflow: TextOverflow.ellipsis,
      fontFamily: Constants.fontFamily,
      fontSize: FontSize.fontSize16);

  static TextStyle get headline6 => TextStyle(
      color: ColorManager.instance.textColor,
      overflow: TextOverflow.ellipsis,
      fontFamily: Constants.fontFamily,
      fontWeight: FontWeight.normal,
      fontSize: FontSize.fontSize12);

  static TextStyle get subTitle1 => TextStyle(
      color: ColorManager.instance.textBodyColor,
      fontWeight: FontWeight.normal,
      overflow: TextOverflow.ellipsis,
      fontFamily: Constants.fontFamily,
      fontSize: FontSize.fontSize17);

  static TextStyle get subtitle2 => TextStyle(
      color: ColorManager.instance.textBodyColor,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.normal,
      fontFamily: Constants.fontFamily,
      fontSize: FontSize.fontSize12);

  static TextStyle get textBodySmall => TextStyle(
      color: ColorManager.instance.textBodyColor,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.normal,
      fontFamily: Constants.fontFamily,
      fontSize: FontSize.fontSize10);

  static TextStyle get textBodyMedium => TextStyle(
      color: ColorManager.instance.textBodyColor,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      fontFamily: Constants.fontFamily,
      fontSize: FontSize.fontSize12);

  static TextStyle get textBodyLarge => TextStyle(
      color: ColorManager.instance.textBodyColor,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold,
      fontFamily: Constants.fontFamily,
      fontSize: FontSize.fontSize14);

  static TextStyle get displayLarge => TextStyle(
      color: ColorManager.instance.textBodyColor,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold,
      fontFamily: Constants.fontFamily,
      fontSize: FontSize.fontSize16);
}
