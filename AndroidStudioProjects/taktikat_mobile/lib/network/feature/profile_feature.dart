import 'dart:io';

import 'package:taktikat/network/api/profile_api.dart';
import 'package:taktikat/network/constance_network/constants_network.dart';
import 'package:taktikat/network/dio_manger/dio_manger.dart';
import 'package:dio/dio.dart' as dio;
import 'package:taktikat/network/dio_manger/dio_manger_secondery_base.dart';

import '../../feature/model/models/app/app_response.dart';

class ProfileFeature extends ProfileApi {
  ProfileFeature._();
  static final ProfileFeature instance = ProfileFeature._();

  @override
  Future<AppResponse> getProfile() async {
    final res = await DioManager.getInstance.get(
        url: ConstanceNetwork.profile,
        header: ConstanceNetwork.header(TypeToken.authorization));

    return AppResponse.fromJson(res.data);
  }

  @override
  Future<AppResponse> updateProfile(
      {required String name,
      required String username,
      required String? email,
      required String? mobile,
      dynamic image}) async {
    final res = await DioManagerSeconderBase.getInstance.postForm(
      url: ConstanceNetwork.updateProfile,
      header: ConstanceNetwork.header(TypeToken.authorization),
      body: {
        'name': name,
        'username': username,
        'email': email,
        'mobile': mobile,
        'image': image != null && image is File
            ? dio.MultipartFile.fromFileSync(image.path)
            : null,
      },
    );
    return AppResponse.fromJson(res.data);
  }
}
