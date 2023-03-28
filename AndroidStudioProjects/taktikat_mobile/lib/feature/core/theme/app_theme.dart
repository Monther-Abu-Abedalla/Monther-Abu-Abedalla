import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_font_size.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_manager.dart';
import 'package:taktikat/feature/core/theme/text_theme/text_theme.dart';

import '../../../utils/constants/constants.dart';
import '../../../utils/shared/shared_prefs.dart';
import '../../../utils/utils/utils.dart';
import 'button_theme/app_button_theme.dart';
import 'color/color_manager.dart';

class AppTheme {
  AppTheme._();
  static AppTheme instance = AppTheme._();

  ThemeData get lightTheme {
    return ThemeData(
      radioTheme: RadioThemeData(
        fillColor:
            MaterialStateProperty.all(ColorManager.instance.secondaryDark),
      ),
      hintColor: ColorManager.instance.unselectedText,
      primaryColor: ColorManager.instance.primary,
      colorScheme: ColorScheme.light(
        background: ColorManager.instance.white,
        primary: ColorManager.instance.primary,
        onPrimary: ColorManager.instance.onPrimary,
        primaryContainer: ColorManager.instance.primaryContainer,
        onTertiary: ColorManager.instance.black,
        secondary: ColorManager.instance.secondary,
        onSecondary: ColorManager.instance.onSecondary,
        inversePrimary: ColorManager.instance.primary,
        onSurface: ColorManager.instance.buttonColor,
        onBackground: ColorManager.instance.onButtonBackGround,
        error: ColorManager.instance.error,
      ),
      unselectedWidgetColor: ColorManager.instance.unSelectedWidgetColor,
      fontFamily: Constants.fontFamily,
      secondaryHeaderColor: ColorManager.instance.secondaryHeaderColor,
      scaffoldBackgroundColor: ColorManager.instance.scaffoldColor,
      dividerColor: ColorManager.instance.dividerColor,
      appBarTheme: AppBarTheme(
          backgroundColor: ColorManager.instance.white,
          elevation: 0,
          titleTextStyle: AppTextTheme.textAppTheme.headlineSmall
              ?.copyWith(fontWeight: FontWeight.w400),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: ColorManager.instance.black,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.instance.transparent,
              systemNavigationBarColor: ColorManager.instance.primary,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarIconBrightness: Brightness.dark)),
      textTheme: AppTextTheme.textAppTheme,
      elevatedButtonTheme: AppButtonTheme.instance.elevatedButtonStyle,
      outlinedButtonTheme: AppButtonTheme.instance.outlinedButtonStyle,
      textButtonTheme: AppButtonTheme.instance.textButtonStyle,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManager.instance.primary,
      ),

      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextManager.headline6.copyWith(
          fontWeight: FontWeight.w500,
          color: ColorManager.instance.white,
        ),
        labelStyle: AppTextTheme.textAppTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500, color: ColorManager.instance.white),
        contentPadding: const EdgeInsets.symmetric(horizontal: 28),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(
            color: ColorManager.instance.textFiledBorder,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(
            color: ColorManager.instance.textFiledBorder,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(
            color: ColorManager.instance.textFiledBorder,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(
            color: ColorManager.instance.redTextColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(
            color: ColorManager.instance.textFiledBorder,
          ),
        ),
      ),

      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ColorManager.instance.primary,
              width: 4,
            ),
          ),
        ),
        labelColor: ColorManager.instance.primary,
        unselectedLabelColor: ColorManager.instance.darkGrey,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: ColorManager.instance.white,
        backgroundColor: ColorManager.instance.white,
        selectedLabelStyle: TextManager.headline6.copyWith(
            color: ColorManager.instance.selectedTabDark,
            fontSize: FontSize.fontSize1),
        selectedItemColor: ColorManager.instance.secondaryHeaderColor,
        unselectedLabelStyle: TextManager.headline6.copyWith(
            color: ColorManager.instance.selectedTabDark,
            fontSize: FontSize.fontSize1),
      ),
      popupMenuTheme: PopupMenuThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.r12)),
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(ColorManager.instance.white),
        checkColor: MaterialStateProperty.all(ColorManager.instance.white),
        side: BorderSide(
            color: ColorManager.instance.primaryContainer,
            width: 0.5,
            style: BorderStyle.solid),
      ),

      dialogBackgroundColor: ColorManager.instance.backgroundColor,
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(ColorManager.instance.primary),
        trackColor: MaterialStateProperty.all(ColorManager.instance.primary),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ColorManager.instance.primary),
      // progress indicator
      progressIndicatorTheme:
          ProgressIndicatorThemeData(color: ColorManager.instance.primary),
      // Scaffold
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      radioTheme: RadioThemeData(
        fillColor:
            MaterialStateProperty.all(ColorManager.instance.secondaryDark),
      ),
      hintColor: ColorManager.instance.unselectedText,
      primaryColor: ColorManager.instance.primary,
      colorScheme: ColorScheme.dark(
        background: ColorManager.instance.dtBackGround,
        primary: ColorManager.instance.dtPrimary,
        onPrimary: ColorManager.instance.dtOnPrimary,
        primaryContainer: ColorManager.instance.dtPrimaryContainer,
        onTertiary: ColorManager.instance.onPrimary,
        secondary: ColorManager.instance.dtSecondary,
        onSecondary: ColorManager.instance.dtOnSecondary,
        scrim: ColorManager.instance.white,
        inversePrimary: ColorManager.instance.dtSecondary,
        onSurface: ColorManager.instance.dtButtonColor,
        onBackground: ColorManager.instance.dtOnButtonBackGround,
        error: ColorManager.instance.error,
      ),
      fontFamily: Constants.fontFamily,
      secondaryHeaderColor: ColorManager.instance.secondaryHeaderColor,
      scaffoldBackgroundColor: ColorManager.instance.scaffoldColor,
      dividerColor: ColorManager.instance.dividerColor,
      appBarTheme: AppBarTheme(
          backgroundColor: ColorManager.instance.white,
          elevation: 0,
          titleTextStyle: AppTextTheme.textAppTheme.headlineSmall
              ?.copyWith(fontWeight: FontWeight.w400),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: ColorManager.instance.black,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.instance.transparent,
              systemNavigationBarColor: ColorManager.instance.primary,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarIconBrightness: Brightness.dark)),
      textTheme: AppTextTheme.textAppTheme,
      // buttons
      // inputDecorationTheme: TextFieldTheme.instance.inputDecorationTheme,
      elevatedButtonTheme: AppButtonTheme.instance.elevatedButtonStyle,
      outlinedButtonTheme: AppButtonTheme.instance.outlinedButtonStyle,
      textButtonTheme: AppButtonTheme.instance.textButtonStyle,

      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManager.instance.primary,
      ),

      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextManager.headline6.copyWith(
          fontWeight: FontWeight.w500,
          color: ColorManager.instance.white,
        ),
        labelStyle: AppTextTheme.textAppTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500, color: ColorManager.instance.white),
        contentPadding: const EdgeInsets.symmetric(horizontal: 28),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(
            color: ColorManager.instance.textFiledBorder,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(
            color: ColorManager.instance.textFiledBorder,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(
            color: ColorManager.instance.textFiledBorder,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(
            color: ColorManager.instance.redTextColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(
            color: ColorManager.instance.textFiledBorder,
          ),
        ),
      ),

      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ColorManager.instance.primary,
              width: 4,
            ),
          ),
        ),
        labelColor: ColorManager.instance.primary,
        unselectedLabelColor: ColorManager.instance.darkGrey,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: ColorManager.instance.white,
        backgroundColor: ColorManager.instance.white,
        selectedLabelStyle: TextManager.headline6.copyWith(
            color: ColorManager.instance.selectedTabDark,
            fontSize: FontSize.fontSize1),
        selectedItemColor: ColorManager.instance.secondaryHeaderColor,
        unselectedLabelStyle: TextManager.headline6.copyWith(
            color: ColorManager.instance.selectedTabDark,
            fontSize: FontSize.fontSize1),
      ),
      popupMenuTheme: PopupMenuThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.r12)),
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(ColorManager.instance.white),
        checkColor: MaterialStateProperty.all(ColorManager.instance.white),
        side: BorderSide(
            color: ColorManager.instance.primaryContainer,
            width: 0.5,
            style: BorderStyle.solid),
      ),

      dialogBackgroundColor: ColorManager.instance.backgroundColor,
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(ColorManager.instance.white),
        trackColor: MaterialStateProperty.all(ColorManager.instance.white),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ColorManager.instance.primary),
      // progress indicator
      progressIndicatorTheme:
          ProgressIndicatorThemeData(color: ColorManager.instance.primary),
      // Scaffold
    );
  }

  ThemeData get customTheme {
    return lightTheme.copyWith(
        primaryColor: Utils.instance.getColorFromHex(
          SharedPrefs.instance.getUserTheme()?.primaryColor ??
              Utils.instance.getColorString(
                ColorManager.instance.primary,
              ),
        ),
        colorScheme: lightTheme.colorScheme.copyWith(
            primary: Utils.instance.getColorFromHex(
          SharedPrefs.instance.getUserTheme()?.primaryColor ??
              Utils.instance.getColorString(
                ColorManager.instance.primary,
              ),
        )));
  }
}
