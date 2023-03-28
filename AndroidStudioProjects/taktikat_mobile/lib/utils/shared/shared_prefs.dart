import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taktikat/feature/model/models/home/theme_model.dart';

import '../../feature/core/theme/app_theme.dart';
import '../../feature/model/models/auth/user.dart';
import '../constants/constants.dart';

class SharedPrefs {
  SharedPrefs._();
  static SharedPrefs instance = SharedPrefs._();
  static SharedPreferences? _prefs;
  final String _language = 'languageKey';
  final String _userTokenKey = 'token';
  final String _userDataKey = 'userData';
  final String _isUserLoggedIn = 'isUserLoggedIn';
  final String _isVisiter = 'isVisiter';
  final String _userTheme = 'userTheme';

  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void setUserToken({required String token}) {
    _prefs?.setString(_userTokenKey, token);
  }

  String getUserToken() {
    return _prefs?.getString(_userTokenKey) ?? '';
  }

  void setLanguage({required String langCode}) {
    _prefs!.setString(_language, langCode);
  }

  String getLanguage() {
    return _prefs?.getString(_language) ?? Constants.enLangCode;
  }

  void setUserData({required User user}) {
    _prefs?.setString(_userDataKey, jsonEncode(user.toJson()));
  }

  User? getUserData() {
   final String? jsonData = _prefs?.getString(_userDataKey);
    if (jsonData == null) {
      return null;
    } else {
      return User.fromJson(jsonDecode(jsonData));
    }
  }

  //get _isUserLoggedIn
  bool getIsUserLoggedIn() {
    return _prefs?.getBool(_isUserLoggedIn) ?? false;
  }

  //set _isUserLoggedIn
  void setIsUserLoggedIn({required bool isUserLoggedIn}) {
    _prefs?.setBool(_isUserLoggedIn, isUserLoggedIn);
  }

  void setVisiter({required bool isVisiter}) {
    _prefs?.setBool(_isVisiter, isVisiter);
  }

  bool getIsVisiter() {
    return _prefs?.getBool(_isVisiter) ?? false;
  }

  Future<void> clearPrefs() async {
// await _prefs?.clear();
// note the previous line will clear Language ! so we need to clear it manually
    await _prefs?.remove(_userTokenKey);
    await _prefs?.remove(_userDataKey);
    await _prefs?.remove(_isUserLoggedIn);
    await _prefs?.remove(_isVisiter);
    await _prefs?.remove(_userTheme);
    Get.changeTheme(AppTheme.instance.lightTheme);
  }

  void setUserTheme({required ThemeModel theme}) {
    _prefs?.setString(_userTheme, jsonEncode(theme.toJson()));
  }

  ThemeModel? getUserTheme() {
   final String? jsonData = _prefs?.getString(_userTheme);
    if (jsonData == null) {
      return null;
    } else {
      return ThemeModel.fromJson(jsonDecode(jsonData));
    }
  }
}
