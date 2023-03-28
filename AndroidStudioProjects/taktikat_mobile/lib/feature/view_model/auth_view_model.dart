import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:taktikat/feature/core/theme/app_theme.dart';
import '../../feature/model/models/app/app_response.dart';
import 'package:taktikat/feature/model/models/home/theme_model.dart';
import 'package:taktikat/feature/view_model/main_view_model.dart';
import 'package:taktikat/network/feature/auth_feature.dart';
import 'package:taktikat/utils/shared/shared_prefs.dart';
import 'package:taktikat/utils/utils/utils.dart';
import 'package:twitter_login/entity/auth_result.dart';
import 'package:twitter_login/twitter_login.dart';

import '../../utils/constants/constants.dart';
import '../../utils/router/routes.dart';
import '../model/enums/social_types.dart';
import '../model/models/auth/social_login_data.dart';
import '../model/models/auth/user.dart';

class AuthViewModel extends MainViewModel {
  Timer? timer;
  int timerCounter = 60;

  bool isAcceptedPrivacyPolicy = false;

  void updatePrivacyPolicy() {
    isAcceptedPrivacyPolicy = !isAcceptedPrivacyPolicy;
    update();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (timerCounter == 0) {
          timer.cancel();
          update();
        } else {
          timerCounter--;
          update();
        }
      },
    );
  }

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final tdMobileOrEmail = TextEditingController();
  void skipLogin() {
    SharedPrefs.instance.setVisiter(isVisiter: true);
    Get.toNamed(Routes.homePlaceHolder);
  }

  Future<void> login() async {
    try {
      if (loginKey.currentState!.validate()) {
        startLoading();
        await AuthFeature.instance.login(
          mobileOrEmail: tdMobileOrEmail.text,
          onSuccess: (response) {
            Utils.instance.snackSuccess(body: response.message ?? '');
            cleanLoginForm();
            setUserData(appResponse: response);
            Get.toNamed(Routes.verificationCode);
          },
          onError: (response) {
            if (response.errors != null) {
              if (response.errors?.mobile.isEmpty != true) {
                Utils.instance
                    .snackError(body: response.errors?.mobile.first ?? '');
              } else if (response.errors?.email.isEmpty != true) {
                Utils.instance
                    .snackError(body: response.errors?.email.first ?? '');
              } else {
                Utils.instance.snackError(body: response.message ?? '');
              }
            }
          },
        );
        stopLoading();
      }
    } catch (e) {
      Logger().e(e);
      stopLoading();
    }
  }

  Future<void> refreshToken() async {
    try {
      await AuthFeature.instance.refreshToken().then((value) => {
            if (value.data != null)
              {
                setUserData(appResponse: value),
                SharedPrefs.instance.setIsUserLoggedIn(isUserLoggedIn: true)
              },
          });
    } catch (e) {
      Logger().e(e);
    }
  }

  void cleanLoginForm() {
    loginKey = GlobalKey<FormState>();
    tdMobileOrEmail.clear();
    isAcceptedPrivacyPolicy = false;
  }

  final tdVerificationCode = TextEditingController();

  Future<void> verifyCode({required bool isUpdate}) async {
    try {
      startLoading();
      await AuthFeature.instance.verifyCode(
        code: tdVerificationCode.text,
        isUpdate: isUpdate,
        onSuccess: (response) {
          Utils.instance.snackSuccess(body: response.message ?? '');
          setUserData(appResponse: response);
          cleanVerificationForm();
          SharedPrefs.instance.setIsUserLoggedIn(isUserLoggedIn: true);
          checkUserPreferenceThenRoute();
        },
        onError: (response) {
          Utils.instance.snackError(body: response.message ?? '');
        },
      );
      stopLoading();
    } catch (e) {
      Logger().e(e);
      stopLoading();
    }
  }

  void cleanVerificationForm() {
    tdVerificationCode.clear();
    timerCounter = 60;
  }

  Future<void> resendCode() async {
    try {
      if (timerCounter > 0) {
        return;
      }
      startLoading();
      await AuthFeature.instance.resendOtp(
        onSuccess: (response) {
          Utils.instance.snackSuccess(body: response.message ?? '');
          timerCounter = 60;
          startTimer();
        },
        onError: (response) {
          Utils.instance.snackError(body: response.message ?? '');
        },
      );
      stopLoading();
    } catch (e) {
      Logger().e(e);
      stopLoading();
    }
  }

  Future<void> socialLogin({required SocialType socialType}) async {
    SocialLoginData? social;
    if (socialType == SocialType.google) {
      social = await signInWithGoogle();
    } else if (socialType == SocialType.facebook) {
      social = await signInWithFacebook();
    } else if (socialType == SocialType.apple) {
      social = await signInWithApple();
    } else if (socialType == SocialType.twitter) {
      social = await signInWithTwitter();
    }

    if (social != null) {
      await socialLoginWithBackEnd(socialLoginData: social);
    }
  }

  Future<SocialLoginData?> signInWithGoogle() async {
    SocialLoginData? social;

   final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    if (googleUser != null && googleAuth != null) {
      social = SocialLoginData(
        accessToken: googleAuth.accessToken,
        providerId: googleUser.id,
        provider: 'google',
      );
    }

    return social;
  }

  Future<SocialLoginData?> signInWithFacebook() async {
    SocialLoginData? social;
   final FacebookAuth facebookAuth = FacebookAuth.instance;
   final LoginResult loginResult = await facebookAuth.login(
      permissions: [
        'email',
      ],
    );

    if (loginResult.status == LoginStatus.success) {
      final AccessToken accessToken = loginResult.accessToken!;
      social = SocialLoginData(
        accessToken: accessToken.token,
        providerId: accessToken.userId,
        provider: 'facebook',
      );
    }

    return social;
  }

  Future<SocialLoginData?> signInWithApple() async {
    try {
      SocialLoginData? social;
      final credential = await SignInWithApple.getAppleIDCredential(
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: Constants.appleClientId,
          redirectUri: Uri.parse(Constants.appleRedirectUri),
        ),
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      Logger().e(credential);

      return social;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  Future<void> socialLoginWithBackEnd(
      {required SocialLoginData socialLoginData}) async {
    try {
      startLoading();
      await AuthFeature.instance.socialLogin(
        socialLoginData: socialLoginData,
        onSuccess: (response) {
          Utils.instance.snackSuccess(body: response.message ?? '');
          setUserData(appResponse: response);
          checkUserPreferenceThenRoute();
          SharedPrefs.instance.setIsUserLoggedIn(isUserLoggedIn: true);
        },
        onError: (response) {
          Utils.instance.snackError(body: response.message ?? '');
        },
      );
      stopLoading();
    } catch (e) {
      Logger().e(e);
    }
  }

  Future<SocialLoginData?> signInWithTwitter() async {
    final twitterLogin = TwitterLogin(
      apiKey: Constants.twitterApiKey,
      apiSecretKey: Constants.twitterApiSecretKey,
      redirectURI: Constants.twitterRedirectUri,
    );
    final AuthResult authResult = await twitterLogin.loginV2();
    if (authResult.status == TwitterLoginStatus.loggedIn) {
      return SocialLoginData(
        accessToken: authResult.authToken,
        provider: 'twitter',
        authTokenSecret: authResult.authTokenSecret,
      );
    }

    return null;
  }

  void checkUserPreferenceThenRoute() {
    if (SharedPrefs.instance.getUserData()?.favoriteSettingsIsShown == 0) {
      Get.toNamed(Routes.userPreferences);
    } else {
      Get.toNamed(Routes.homePlaceHolder);
    }
  }

  void setUserData({required AppResponse appResponse}) {
   final  Map<String, dynamic> data = appResponse.data;

    SharedPrefs.instance.setUserData(user: User.fromJson(appResponse.data));
    SharedPrefs.instance.setUserToken(token: data['token']);
    if (data['theme'] != null) {
      SharedPrefs.instance
          .setUserTheme(theme: ThemeModel.fromJson(data['theme']));
      Get.changeTheme(AppTheme.instance.customTheme);
      Get.changeThemeMode(ThemeMode.light);
    }
  }
}
