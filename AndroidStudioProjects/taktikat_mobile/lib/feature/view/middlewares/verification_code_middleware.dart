import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/view_model/auth_view_model.dart';
import 'package:taktikat/utils/utils/utils.dart';

class VerificationCodeMiddleware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    Utils.instance.getController(AuthViewModel()).cleanVerificationForm();
    Utils.instance.changeStatusBarColor(
      color: Theme.of(Get.context!).primaryColor,
      brightness: Brightness.light,
      systemNavigationBarColor: Theme.of(Get.context!).primaryColor,
      systemNavigationBarIconBrightness: Brightness.light,
    );
    return super.onPageCalled(page);
  }

  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
  final  AuthViewModel authViewModel = Get.find<AuthViewModel>();
    authViewModel.startTimer();
    return super.onBindingsStart(bindings);
  }
}
