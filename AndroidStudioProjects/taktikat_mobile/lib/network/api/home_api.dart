import '../../feature/model/models/app/app_response.dart';
import 'package:taktikat/feature/model/models/home/theme_model.dart';
import 'package:taktikat/network/repo/home_repo.dart';

import '../../feature/model/enums/preferences_types.dart';
import '../constance_network/constants_network.dart';
import '../dio_manger/dio_manger.dart';
import '../dio_manger/dio_manger_secondery_base.dart';

class HomeApi extends HomeRepo {
  static final HomeApi instance = HomeApi._internal();

  HomeApi._internal();

  Future<AppResponse> userPreferences({String? search}) async {
    final response = await DioManager.getInstance.get(
        url: ConstanceNetwork.userPreferences(search: search),
        header: ConstanceNetwork.header(TypeToken.acceptLanguage));
    if (response.statusCode == 200) {
      return AppResponse.fromJson(response.data);
    } else {
      return AppResponse(
          message: (response.data as Map<String, dynamic>)['message'],
          status: 400);
    }
  }

  Future<AppResponse> togglePreferences(
      {required PreferencesTypes preferenceType, required int id}) async {
    final response = await DioManager.getInstance.post(
        url: ConstanceNetwork.togglePreferences(
            preferenceType: preferenceType, id: id),
        header: ConstanceNetwork.header(TypeToken.acceptLanguage));
    if (response.statusCode == 200) {
      return AppResponse.fromJson(response.data);
    } else {
      return AppResponse(
          message: (response.data as Map<String, dynamic>)['message'],
          status: 400);
    }
  }

  Future<AppResponse> getThemes() async {
    final response = await DioManagerSeconderBase.getInstance.get(
        url: ConstanceNetwork.getThemes,
        header: ConstanceNetwork.header(TypeToken.acceptLanguage));
    if (response.statusCode == 200) {
      return AppResponse.fromJson(response.data);
    } else {
      return AppResponse(
        message: (response.data as Map<String, dynamic>)['message'],
        status: 400,
      );
    }
  }

  @override
  Future<AppResponse> mainSearch(
      {required String search,
      required Function(AppResponse response) onSuccess,
      required Function(AppResponse response) onError}) async {
    final res = await DioManager.getInstance.get(
        url: ConstanceNetwork.mainSearch(search: search),
        header: ConstanceNetwork.header(TypeToken.acceptLanguage));
   final AppResponse response = AppResponse.fromJson(res.data);
    if (res.statusCode == 200) {
      onSuccess(response);
    } else {
      onError(response);
    }
    return response;
  }

  @override
  Future<AppResponse> updateUserTheme({ThemeModel? theme}) async {
    final res = await DioManagerSeconderBase.getInstance.patchForm(
      url: ConstanceNetwork.updateUserTheme,
      header: ConstanceNetwork.header(TypeToken.acceptLanguage),
      body: {
        'theme_id': theme?.id,
      },
    );
    final AppResponse response = AppResponse.fromJson(res.data);
    if (res.statusCode == 200) {
      return response;
    } else {
      return AppResponse(message: response.message, status: 400);
    }
  }
}
