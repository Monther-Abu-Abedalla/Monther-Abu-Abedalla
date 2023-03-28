import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/theme/size/app_size.dart';
import 'package:taktikat/feature/view_model/auth_view_model.dart';
import 'package:taktikat/utils/constants/const_svgs.dart';
import 'package:taktikat/utils/router/routes.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../../../../utils/shared/shared_prefs.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    navigate();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: SvgPicture.asset(
            ConstSvg.logo,
            height: AppSize.h60,
            width: AppSize.w60,
          )),
        ],
      ),
    );
  }

  Future<void> navigate() async {
    await Future.delayed(const Duration(seconds: 3));
    if (SharedPrefs.instance.getIsUserLoggedIn()) {
      Get.offAllNamed(Routes.homePlaceHolder);
      Utils.instance.getController(AuthViewModel()).refreshToken();
    } else {
      Get.offAllNamed(Routes.signUp);
    }
  }
}
