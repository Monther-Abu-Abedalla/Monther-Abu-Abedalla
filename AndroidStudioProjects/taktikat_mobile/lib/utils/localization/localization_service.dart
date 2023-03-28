import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shared/shared_prefs.dart';
import 'ar.dart';
import 'en.dart';


class LocalizationService extends Translations {
  static const fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'ar': ArSu.singleton.ar,
        'en': EnUs.singleton.en,
      };

  static const langs = [
    'Arabic',
    'English',
  ];

  static const locales = [
    Locale('ar'),
    Locale('en'),
  ];

  void changeLocal(String langCode) {
    Get.updateLocale(_getLocaleFromLanguage(langCode)!);
    SharedPrefs.instance.setLanguage(langCode: langCode);
  }

  Locale? _getLocaleFromLanguage(String langCode) {
    for (Locale l in locales) {
      if (l.languageCode == langCode) return l;
    }
    return Get.locale;
  }
}
