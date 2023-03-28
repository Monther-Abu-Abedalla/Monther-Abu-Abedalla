import 'dart:io';

import 'package:taktikat/feature/model/enums/preferences_types.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../../utils/shared/shared_prefs.dart';

abstract class ConstanceNetwork {
  static const String baseUrl = 'https://v2-api-dev.taktikat.app/api/v2';
  static const String secondaryBaseUrl =
      'https://v2-api-dev.taktikat.app/api/v1';

  //auth End points
  static const String login = '/login';
  static const String checkOtp = '/check-otp';
  static const String resendOtp = '/resend-otp';
  static const String socialLogin = '/social-login';
  static const String refreshToken = '/refresh-token';
  static const String logout = '/logout';

  static const String profile = '/me';
  static const String updateProfile = '/customer/update/profile';

  static const String checkUpdatedOtp = '/check-otp-updated-mobile';

  static  const String updateUserTheme = '/customer/update-theme-color-for-customer';

  //match End points
  static String matchIndex(
          {required String? date, String? search, int? page, int? isLive}) =>
      '/matches?match_date=$date&search=$search&live_matches=$isLive&page=$page';
  static String favoriteMatches({String? date, String? search, int? isLive}) =>
      '/matches/favorites?match_date=$date&live_matches=$isLive&search=$search';
  static String toggleFavoriteMatch({int? matchId}) =>
      '/matches/toggle-favorite?match_id=$matchId';
  static String getCompetitions({String? date}) =>
      '/matches/competitions?date=$date';
  static String toggleCompetition({int? competitionId}) =>
      '/matches/competitions/$competitionId';
  static String matchDetails({int? matchId}) => '/matches/$matchId';

  //Home End points
  static String userPreferences({String? search}) =>
      '/favorites?s=$search&limit=30';
  static String togglePreferences(
          {required PreferencesTypes preferenceType, int? id}) =>
      '/favorites/${preferenceType.value}/$id';
  static String getThemes = '/themes';

  static Map<String, String> header(TypeToken token) {
    Map<String, String> headers = {};
    if (token == TypeToken.contentType) {
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Language': SharedPrefs.instance.getLanguage(),
        'Authorization': 'Bearer ${SharedPrefs.instance.getUserToken()}',
      };
    } else if (token == TypeToken.authorization) {
      headers = {
        'Accept-Language': SharedPrefs.instance.getLanguage(),
        'Authorization': 'Bearer ${SharedPrefs.instance.getUserToken()}',
        'Accept': 'application/json',
      };
    } else if (token == TypeToken.authorizationContentType) {
      headers = {
        // 'Authorization': 'Bearer ${SharedPref.instance.getToken()}',
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        'Accept-Language': SharedPrefs.instance.getLanguage(),
      };
    } else if (token == TypeToken.acceptLanguage) {
      headers = {
        'Authorization': 'Bearer ${SharedPrefs.instance.getUserToken()}',
        'Accept-Language': SharedPrefs.instance.getLanguage(),
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Timezone-Offset': Utils.instance.getDeviceTimeZone(),
      };
    } else if (token == TypeToken.registerHeaders) {
      headers = {
        'Accept-Language': SharedPrefs.instance.getLanguage(),
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer xUT4olURGFJRrRC9Nofl6FFb2i9Uamy5JrQSWBQx',
      };
    } else if (token == TypeToken.urlencoded) {
      headers = {
        'Accept-Language': SharedPrefs.instance.getLanguage(),
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${SharedPrefs.instance.getUserToken()}',
      };
    } else if (token == TypeToken.urlencodedNoAcceptLanguage) {
      headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${SharedPrefs.instance.getUserToken()}',
        'Accept-Language': SharedPrefs.instance.getLanguage(),
      };
    } else if (token == TypeToken.multipartFormData) {
      headers = {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer ${SharedPrefs.instance.getUserToken()}',
        'Accept-Language': SharedPrefs.instance.getLanguage(),
      };
    }
    headers['x-app-type'] = Platform.isAndroid ? 'android' : 'ios';
    // headers['x-app-version'] = Constants.appVersion;
    return headers;
  }

  static String mainSearch({required String search}) {
    return '/search?q=$search';
  }

  static String matchCommentaries({required int matchId}) {
    return '/matches/$matchId/commentaries';
  }

  static String matchStandings({required int matchId}) {
    return '/matches/$matchId/standings';
  }

  static String matchStandingsComparison({required int matchId}) =>
      '/matches/$matchId/standings-for-two-teams';

  static String matchStatistics({required int matchId}) =>
      '/matches/$matchId/statistics';

  static String matchConfrontations({required int matchId}) =>
      '/matches/$matchId/h2h?limit=10';
  static String topRated({required int matchId}) =>
      '/matches/$matchId/comparison';

  static String matchLineups({required int matchId}) {
    return '/matches/$matchId/lineups';
  }
}

enum TypeToken {
  contentType,
  authorization,
  authorizationContentType,
  acceptLanguage,
  registerHeaders,
  urlencoded,
  urlencodedNoAcceptLanguage,
  multipartFormData,
}
