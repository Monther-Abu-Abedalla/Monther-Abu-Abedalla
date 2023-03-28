import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taktikat/feature/core/theme/color/color_manager.dart';
import 'package:taktikat/feature/view/screens/app/home/widgets/home_app_bar.dart';

import '../../../../view_model/home_view_model.dart';
import '../../../global_widgets/app_drawer.dart';
import '../../../global_widgets/bottom_nav.dart';

class HomePlaceHolder extends StatelessWidget {
  const HomePlaceHolder({super.key});

  static HomeViewModel homeViewModel = Get.find<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeViewModel>(builder: (logic) {
        return Scaffold(
          drawer: const AppDrawer(),
          backgroundColor: ColorManager.instance.white,
          appBar: const HomeAppBar(),
          onDrawerChanged: (isOpen) {
            if (!isOpen) logic.changeBottomNavIndex(0);
          },
          body: logic.getBottomSelectedPage(),
          bottomNavigationBar: const BottomNav(),
        );
      }),
    );
  }
}
