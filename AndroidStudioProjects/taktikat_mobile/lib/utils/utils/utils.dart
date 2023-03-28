import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taktikat/utils/constants/constants.dart';
import 'package:taktikat/utils/shared/shared_prefs.dart';

import '../../feature/core/theme/color/color_manager.dart';
import '../localization/string_keys.dart';

class Utils {
  String defaultImage =
      'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png';

  String urlUserPlacholder =
      'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png';

  Utils._();

  static Utils instance = Utils._();

  mainSnack({String? title, required String body, Color? backgroundColor}) {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: backgroundColor ?? const Color(0xFF303030),
        messageText: Text(
          body,
          style: TextStyle(
            color: ColorManager.instance.backgroundColor,
          ),
          maxLines: 4,
        ),
        duration: const Duration(seconds: 2),
        borderRadius: 10,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      ),
    );
  }

  screenUtil({required BuildContext context}) {
    ScreenUtil.init(
      context,
      minTextAdapt: true,
      designSize: const Size(392.72727272727275, 759.2727272727273),
    );
  }

  String convertColorToHex(Color color) {
    return color.value.toRadixString(16).substring(2);
  }

  Color getColorFromHex(String? hexString) {
    try {
      final buffer = StringBuffer();
      if (hexString?.length == 6 || hexString?.length == 7) buffer.write('FF');
      buffer.write(hexString?.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      return Random().nextBool() ? Colors.red : Colors.blue;
    }
  }

  //get String From Color
  String getColorString(Color color) {
    return '#${color.value.toRadixString(16).substring(2)}';
  }

  DateTime todayDate() {
   final DateTime date =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    return date;
  }

  //check if device time zone is Utc
  bool isUtc() {
   final DateTime dateTime = DateTime.now();
    return dateTime.isUtc;
  }

  //get device time zone name
  String getDeviceTimeZoneName() {
    final DateTime dateTime = DateTime.now();
    return dateTime.timeZoneName;
  }

  //get device time zone
  String getDeviceTimeZone() {
    final DateTime dateTime = DateTime.now();

    return dateTime.timeZoneOffset.inHours.toString();
  }

  void showDialog({
    required String title,
    required String body,
  }) {
    Get.dialog(
      AlertDialog(
        title: Center(
          child: Text(
            title,
            style: TextStyle(
              color: ColorManager.instance.primary,
            ),
          ),
        ),
        content: Text(
          body,
          style: TextStyle(
            color: ColorManager.instance.primary,
          ),
          maxLines: 3,
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                StringKeys.singleton.ok.tr,
                style: TextStyle(
                  color: ColorManager.instance.backgroundColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  snackPrimary({String? title, required String body}) {
    mainSnack(body: body, backgroundColor: ColorManager.instance.primary);
  }

  snackSuccess({String? title, required String body}) {
    mainSnack(body: body, backgroundColor: ColorManager.instance.success);
  }

  snackWarning({String? title, required String body}) {
    mainSnack(body: body, backgroundColor: ColorManager.instance.googleColor);
  }

  snackError({String? title, required String body}) {
    mainSnack(body: body, backgroundColor: ColorManager.instance.error);
  }

  BouncingScrollPhysics getAppScrollPhysics() {
    return const BouncingScrollPhysics(
      parent: AlwaysScrollableScrollPhysics(),
    );
  }

  bool isArabic() {
    return SharedPrefs.instance.getLanguage() == Constants.arLangCode;
  }

  String convertToArabicNumber(String number) {
    String res = '';

    final arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    for (var element in number.characters) {
      res += arabic[int.parse(element)];
    }

    return res;
  }

  void setAppStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  bool isLandScape() {
    return Get.mediaQuery.orientation == Orientation.landscape;
  }

  bool isPortrait() {
    return Get.mediaQuery.orientation == Orientation.portrait;
  }

  bool checkIfIntersect({required List l1, required List l2}) {
   final Set firstListSet = l1.toSet();
   final Set secondListSet = l2.toSet();
    if (firstListSet.intersection(secondListSet).isNotEmpty) {
      return true;
    }
    return false;
  }

  void changeStatusBarColor({
    required Color color,
    required Brightness brightness,
    Brightness? systemNavigationBarIconBrightness,
    Color? systemNavigationBarColor,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarIconBrightness: brightness,
        systemNavigationBarIconBrightness: systemNavigationBarIconBrightness,
        systemNavigationBarColor: systemNavigationBarColor,
        systemNavigationBarContrastEnforced: true,
      ),
    );
  }

  TextTheme get getTextTheme => Theme.of(Get.context!).textTheme;

  //create a function that take in parameter the GetxController and Check if
  // the controller is registered or not
  //if it is registered then it will return the controller
  //if it is not registered then it will register the controller and return it
  T getController<T extends GetxController>(T controller,
      {bool permanent = false}) {
    if (Get.isRegistered<T>()) {
      return Get.find<T>();
    } else {
      Get.put<T>(controller, permanent: permanent);
      return Get.find<T>();
    }
  }

  void hideKeyboard({required BuildContext context}) {
    FocusScope.of(context).unfocus();
  }

  String getPredictionInDigits({num? prediction}) {
    final f = NumberFormat('#####0.#', 'en_US');
    return '${f.format(prediction ?? 0)}%';
  }

  Color getPlayerColorByRating({String? rating}) {
   final num ratingInt = num.tryParse(rating ?? '0') ?? 0;
    // rating >= 7 ? 'bg-[#00BF24]' : 'bg-[#f08022]
    if (ratingInt >= 7) {
      return ColorManager.instance.greenLineup;
    } else {
      return ColorManager.instance.redLineup;
    }
  }
}
