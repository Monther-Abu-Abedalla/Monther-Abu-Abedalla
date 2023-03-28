import 'dart:io';

import '../../feature/model/models/app/app_response.dart';

abstract class ProfileApi {
  //profile
  Future getProfile();

  Future<AppResponse> updateProfile(
      {required String name,
      required String username,
      required String email,
      required String mobile,
      File? image});
}
