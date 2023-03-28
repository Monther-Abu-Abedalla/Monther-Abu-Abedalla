import 'package:taktikat/feature/model/models/auth/social_login_data.dart';

import '../../feature/model/models/app/app_response.dart';


abstract class AuthApi {
  
  Future login({
    required String mobileOrEmail,
    required Function(AppResponse response) onSuccess,
    required Function(AppResponse response) onError,
  });


  Future verifyCode({
    required String code,
    required bool isUpdate,
    required Function(AppResponse response) onSuccess,
    required Function(AppResponse response) onError,

  });

  // resend-otp
  Future resendOtp({
    required Function(AppResponse response) onSuccess,
    required Function(AppResponse response) onError,
  });

  //social-login
  Future socialLogin({
    required SocialLoginData socialLoginData,
    required Function(AppResponse response) onSuccess,
    required Function(AppResponse response) onError,
  });
}
