import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/app_widget.dart';
import 'package:taktikat/feature/view_model/auth_view_model.dart';
import 'package:taktikat/feature/view_model/home_view_model.dart';
import 'package:taktikat/feature/view_model/main_view_model.dart';
import 'package:taktikat/utils/shared/shared_prefs.dart';

import 'network/dio_manger/dio_manger.dart';
import 'network/dio_manger/dio_manger_secondery_base.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioManager.getInstance.init();
  DioManagerSeconderBase.getInstance.init();
  await SharedPrefs.instance.initPrefs();
  initPermanentViewModel();
  runApp(const AppWidget());
}

void initPermanentViewModel() {
  Get.put(MainViewModel(), permanent: true);
  Get.put(AuthViewModel(), permanent: true);
  Get.put(HomeViewModel(), permanent: true);
}



