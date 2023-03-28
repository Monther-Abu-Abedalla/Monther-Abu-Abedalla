import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:taktikat/feature/view_model/main_view_model.dart';
import 'package:taktikat/network/feature/profile_feature.dart';
import 'package:taktikat/utils/router/routes.dart';
import 'package:taktikat/utils/shared/shared_prefs.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../model/models/app/app_response.dart';

class ProfileViewModel extends MainViewModel {
  final tdSeureName = TextEditingController();
  final tdUserName = TextEditingController();
  final tdEmail = TextEditingController();
  final tdPhone = TextEditingController();
  dynamic userImage;

  final profileFormKey = GlobalKey<FormState>();

  bool isLoadingUpdateProfile = false;

  void startLoadingUpdateProfile() {
    isLoadingUpdateProfile = true;
    update();
  }

  void stopLoadingUpdateProfile() {
    isLoadingUpdateProfile = false;
    update();
  }

  void setUpUserForm() {
    tdSeureName.text = SharedPrefs.instance.getUserData()?.name ?? '';
    tdUserName.text = SharedPrefs.instance.getUserData()?.username ?? '';
    tdEmail.text = SharedPrefs.instance.getUserData()?.email ?? '';
    tdPhone.text = SharedPrefs.instance.getUserData()?.mobile ?? '';
    userImage = SharedPrefs.instance.getUserData()?.image ?? '';
  }

  //get Image
  final ImagePicker _picker = ImagePicker();
  Future<void> getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      userImage = File(image.path);
      update();
    }
  }

  Future<void> updateProfile() async {
    try {
      startLoadingUpdateProfile();
      final AppResponse appResponse = await ProfileFeature.instance.updateProfile(
        name: tdSeureName.text,
        username: tdUserName.text,
        email: tdEmail.text == '' ? null : tdEmail.text,
        mobile: tdPhone.text == '' ? null : tdPhone.text,
        image: userImage,
      );

      if (appResponse.errors != null) {
        if (appResponse.errors?.mobile.isEmpty != true) {
          Utils.instance
              .snackError(body: appResponse.errors?.mobile.first ?? '');
        } else if (appResponse.errors?.email.isEmpty != true) {
          Utils.instance
              .snackError(body: appResponse.errors?.email.first ?? '');
        } else if (appResponse.errors?.userName.isEmpty != true) {
          Utils.instance
              .snackError(body: appResponse.errors?.userName.first ?? '');
        } else {
          Utils.instance.snackError(body: appResponse.message ?? '');
        }
        stopLoadingUpdateProfile();
        return;
      }
      if (tdPhone.text != SharedPrefs.instance.getUserData()?.mobile) {
        Get.offAllNamed(Routes.verificationCode, arguments: true);
      }
      Utils.instance.snackSuccess(body: appResponse.message ?? '');

      await getProfile();
    } catch (e) {
      Logger().e(e);
    } finally {
      stopLoadingUpdateProfile();
    }
  }
}
