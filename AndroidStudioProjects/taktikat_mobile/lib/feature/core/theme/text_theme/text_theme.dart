import 'package:flutter/material.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_manager.dart';

import '../color/color_manager.dart';

abstract class AppTextTheme {
  static TextTheme textAppTheme = TextTheme(
    displayMedium: TextManager.headline1,
    displaySmall: TextManager.headline2,
    headlineMedium: TextManager.headline3,
    headlineSmall: TextManager.headline4,
    titleLarge: TextManager.headline5,
    titleMedium: TextManager.headline6,
    titleSmall: TextManager.subTitle1,
    bodySmall: TextManager.textBodySmall,
    bodyMedium: TextManager.textBodyMedium,
    bodyLarge: TextManager.textBodyLarge,
    displayLarge: TextManager.displayLarge,
  );

  static TextTheme textAppThemeDark = TextTheme(
    displayMedium:
        TextManager.headline1.copyWith(color: ColorManager.instance.white),
    displaySmall:
        TextManager.headline2.copyWith(color: ColorManager.instance.white),
    headlineMedium:
        TextManager.headline3.copyWith(color: ColorManager.instance.white),
    headlineSmall:
        TextManager.headline4.copyWith(color: ColorManager.instance.white),
    titleLarge:
        TextManager.headline5.copyWith(color: ColorManager.instance.white),
    titleMedium:
        TextManager.headline6.copyWith(color: ColorManager.instance.white),
    titleSmall: TextManager.subTitle1
        .copyWith(color: ColorManager.instance.textBodyColorDark),
    bodyLarge: TextManager.textBodyLarge
        .copyWith(color: ColorManager.instance.textBodyColorDark),
    bodyMedium: TextManager.textBodyMedium
        .copyWith(color: ColorManager.instance.textBodyColorDark),
    bodySmall: TextManager.textBodySmall
        .copyWith(color: ColorManager.instance.textBodyColorDark),
  );
}
