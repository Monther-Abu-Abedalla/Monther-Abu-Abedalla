import 'package:get/get.dart';
import '../../feature/model/models/app/app_response.dart';
import 'package:taktikat/feature/model/models/auth/social_login_data.dart';
import 'package:taktikat/network/api/auth_api.dart';
import 'package:taktikat/network/constance_network/constants_network.dart';
import 'package:taktikat/network/dio_manger/dio_manger.dart';

class AuthFeature extends AuthApi {
  //create singleton class
  static final AuthFeature instance = AuthFeature._internal();
  factory AuthFeature() => instance;
  AuthFeature._internal();

  @override
  Future login({
    required String mobileOrEmail,
    required Function(AppResponse response) onSuccess,
    required Function(AppResponse response) onError,
  }) async {
    final res = await DioManager.getInstance.post(
      url: ConstanceNetwork.login,
      header: ConstanceNetwork.header(TypeToken.contentType),
      body: GetUtils.isEmail(mobileOrEmail)
          ? {'email': mobileOrEmail}
          : {'mobile': mobileOrEmail},
    );
    if (res.statusCode != 200) {
      onError(AppResponse.fromJson(res.data));
    } else {
      onSuccess(AppResponse.fromJson(res.data));
    }
  }

  Future<AppResponse> refreshToken() async {
    final response = await DioManager.getInstance.get(
        url: ConstanceNetwork.refreshToken,
        header: ConstanceNetwork.header(TypeToken.authorization));
    return AppResponse.fromJson(response.data);
  }

  @override
  Future verifyCode({
    required String code,
    required bool isUpdate,
    required Function(AppResponse response) onSuccess,
    required Function(AppResponse response) onError,
  }) async {
    final res = await DioManager.getInstance.post(
      url: isUpdate
          ? ConstanceNetwork.checkUpdatedOtp
          : ConstanceNetwork.checkOtp,
      header: ConstanceNetwork.header(TypeToken.contentType),
      body: {'code': code},
    );
    if (res.statusCode != 200) {
      onError(AppResponse.fromJson(res.data));
    } else {
      onSuccess(AppResponse.fromJson(res.data));
    }
  }

  @override
  Future resendOtp({
    required Function(AppResponse response) onSuccess,
    required Function(AppResponse response) onError,
  }) async {
    final res = await DioManager.getInstance.post(
      url: ConstanceNetwork.resendOtp,
      header: ConstanceNetwork.header(TypeToken.contentType),
    );
    if (res.statusCode != 200) {
      onError(AppResponse.fromJson(res.data));
    } else {
      onSuccess(AppResponse.fromJson(res.data));
    }
  }

  @override
  Future socialLogin(
      {required SocialLoginData socialLoginData,
      required Function(AppResponse response) onSuccess,
      required Function(AppResponse response) onError}) async {
    final res = await DioManager.getInstance.post(
      url: ConstanceNetwork.socialLogin,
      header: ConstanceNetwork.header(TypeToken.contentType),
      body: socialLoginData.toJson(),
    );
    if (res.statusCode != 200) {
      onError(AppResponse.fromJson(res.data));
    } else {
      onSuccess(AppResponse.fromJson(res.data));
    }
  }
}
