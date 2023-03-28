import 'package:taktikat/network/api/home_api.dart';

import '../../feature/model/enums/preferences_types.dart';
import '../../feature/model/models/app/app_response.dart';
import '../../feature/model/models/home/search_models/main_search.dart';
import '../../feature/model/models/home/theme_model.dart';
import '../../feature/model/models/home/user_preferences_model.dart';
import '../../feature/model/models/home/user_preferences_toggle_model.dart';

class HomeFeature {
  static final HomeFeature instance = HomeFeature._internal();

  HomeFeature._internal();

  Future<Preferences?> userPreferences({String? search}) async {
    final response = await HomeApi.instance.userPreferences(search: search);
    if (response.status == 200) {
      return Preferences.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<UserPreferencesToggle?> togglePreferences(
      {required PreferencesTypes preferenceType, required int id}) async {
    final response = await HomeApi.instance
        .togglePreferences(preferenceType: preferenceType, id: id);
    if (response.status == 200) {
      return UserPreferencesToggle.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<List<ThemeModel>> getThemes() async {
    final response = await HomeApi.instance.getThemes();
    if (response.code == 200) {
     final List data = response.data;
      return data.map((e) => ThemeModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<MainSearch> mainSearch({
    required String search,
    required Function(MainSearch response) onSuccess,
    required Function(AppResponse response) onError,
  }) async {
    await HomeApi.instance.mainSearch(
      search: search,
      onSuccess: (AppResponse res) {
        onSuccess(MainSearch.fromJson(res.data));
      },
      onError: (AppResponse res) {
        onError(res);
      },
    );
    return MainSearch();
  }

  Future<AppResponse> updateUserTheme({ThemeModel? theme}) async {
    return await HomeApi.instance.updateUserTheme(theme: theme);
  }
}
