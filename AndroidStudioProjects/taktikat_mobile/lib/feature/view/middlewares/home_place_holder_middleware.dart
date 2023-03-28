import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:taktikat/utils/shared/shared_prefs.dart';

import '../../../utils/utils/utils.dart';
import '../../view_model/home_view_model.dart';
import '../../view_model/match_view_model.dart';

class HomePlaceHolderMiddleware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    Utils.instance.getController(HomeViewModel());
    final MatchViewModel matchViewModel =
        Utils.instance.getController(MatchViewModel(), permanent: true);

    matchViewModel.clearAndInit();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Theme.of(Get.context!).primaryColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark));
   final DateTime todayDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    matchViewModel.getMatchesByDate(date: todayDate);

    if (!SharedPrefs.instance.getIsVisiter()) {
      Utils.instance
          .getController(HomeViewModel())
          .getProfile(isHaveLoading: false);
    }

    return super.onPageCalled(page);
  }

  // @override
  // GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
  //   MatchViewModel matchViewModel = Get.find<MatchViewModel>();
  //   DateTime todayDate =
  //       DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  //   matchViewModel.getMatchesByDate(date: todayDate);
  //   return super.onPageBuildStart(page);
  // }
  // @override
  // List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
  //   MatchViewModel matchViewModel = Get.find<MatchViewModel>();
  //   DateTime todayDate =
  //       DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  //   matchViewModel.getMatchesByDate(date: todayDate);
  //   return super.onBindingsStart(bindings);
  // }
}
