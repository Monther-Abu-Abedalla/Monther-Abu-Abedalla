import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/theme/app_theme.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';

import 'package:taktikat/utils/router/router.dart' as router;
import 'package:taktikat/utils/utils/scroll_behavior.dart';
import '../../utils/constants/constants.dart';
import '../../utils/localization/localization_service.dart';
import '../../utils/shared/shared_prefs.dart';
import '../view/screens/splash/splash_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: ColorManager.instance.white,
        statusBarColor: ColorManager.instance.primary,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark));
    return ScreenUtilInit(
      designSize: const Size(392.72727272727275, 759.2727272727273),
      builder: (contex, widget) => GetMaterialApp(
        title: Constants.appName,
        debugShowCheckedModeBanner: false,
        smartManagement: SmartManagement.keepFactory,
        // theme: AppTheme.instance.lightTheme,
        theme: SharedPrefs.instance.getUserTheme() == null
            ? AppTheme.instance.lightTheme
            : AppTheme.instance.customTheme,
        fallbackLocale: LocalizationService.fallbackLocale,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        translations: LocalizationService(),
        scrollBehavior: MyBehavior(),
        getPages: router.Router.router.routes,
        home: const SplashScreen(),
        locale: SharedPrefs.instance.getLanguage() == Constants.arLangCode
            ? const Locale(Constants.arLangCode)
            : const Locale(Constants.enLangCode),
      ),
    );
  }
}
