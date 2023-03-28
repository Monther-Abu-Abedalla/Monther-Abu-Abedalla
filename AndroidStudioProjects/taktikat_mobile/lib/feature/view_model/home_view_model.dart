import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:taktikat/network/feature/home_feature.dart';

import '../../utils/shared/shared_prefs.dart';
import '../model/enums/preferences_types.dart';
import '../model/models/home/search_models/main_search.dart';
import '../model/models/home/theme_model.dart';
import '../model/models/home/user_preferences_model.dart';
import '../model/models/home/user_preferences_toggle_model.dart';
import '../model/models/profile/profile_preference.dart';
import '../view/screens/app/home/home_screen.dart';
import '../view/screens/app/user_pereferances/widgets/favorite_championships.dart';
import '../view/screens/app/user_pereferances/widgets/favorite_players.dart';
import '../view/screens/app/user_pereferances/widgets/favorite_team.dart';
import '../view/screens/app/user_pereferances/widgets/user_theme.dart';
import 'main_view_model.dart';

class HomeViewModel extends MainViewModel {
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(
      initialPage: currentPreferencesPage,
      viewportFraction: 1,
    );
  }

  int currentPreferencesPage = 0;
  void changCurrentPreferencesPage(int index) {
    currentPreferencesPage = index;

    update();
  }

  void changeCurrentPage({required int index}) {
    pageController.jumpToPage(index);
    // if (pageController.hasClients) {
    //   pageController.jumpToPage(index);
    // }
  }

  bool isLive = false;
  bool isExpanded = false;

  final tdMainSearch = TextEditingController();

  searchExpand() {
    isExpanded = !isExpanded;
    update();
  }

  int bottomNavIndex = 0;
  void changeBottomNavIndex(int index) {
    bottomNavIndex = index;
    update();
  }

  void changeLanguage({required String language}) {
    try {
      SharedPrefs.instance.setLanguage(langCode: language);
      Get.updateLocale(Locale(language));
    } catch (e) {
      Logger().e(e);
    }
  }

  Widget getBottomSelectedPage() {
    switch (bottomNavIndex) {
      case 0:
        return const HomeScreen();
      // case 2:
      //   return const WhoWillWinScreen();
      default:
        return const HomeScreen();
    }
  }

  Widget userPreferencesScreen(int index) {
    switch (index) {
      case 0:
        return const FavoriteTeam();
      case 1:
        return const FavoriteChampionships();
      case 2:
        return const FavoritePlayers();
      case 3:
        return const UserTheme();
      default:
        return const FavoriteTeam();
    }
  }

  List<ThemeModel> themes = [];
  ThemeModel? selectedTheme;
  Future<void> getThemes() async {
    try {
      await HomeFeature.instance.getThemes().then((value) => {
            themes = value,
            selectedTheme = SharedPrefs.instance.getUserTheme() ?? value.first,
            if (SharedPrefs.instance.getUserTheme() == null)
              {
                SharedPrefs.instance.setUserTheme(theme: value.first),
              }
          });
      update();
    } catch (e) {
      Logger().e(e);
    }
  }

  CustomerPreferencesTypes? customerPreferences;
  Future<void> togglePreferences(
      {required PreferencesTypes preferenceType, required int id}) async {
    try {
      await HomeFeature.instance
          .togglePreferences(preferenceType: preferenceType, id: id)
          .then((value) => {
                customerPreferences = value?.customerPreferences,
                preferenceTeams.clear(),
                preferencePlayers.clear(),
                preferenceChampionship.clear(),
                preferenceTeams = [
                  ...?customerPreferences?.team,
                  ...?customerPreferences?.nationalTeam
                ],
                preferencePlayers = [
                  ...?customerPreferences?.player,
                ],
                preferenceChampionship = [
                  ...?customerPreferences?.championship,
                  ...?customerPreferences?.league
                ],
                update(),
              });
    } catch (e) {
      Logger().e(e);
    }
  }

  bool checkIfSelectedTeam(
      {required List<ProfilePreference>? l1, required int id}) {
    if (l1?.where((element) => element.model?.id == id).isNotEmpty ?? false) {
      return true;
    } else {
      return false;
    }
  }

  List getElementsAppearInBothList(List l1, List l2) {
    return l1.where((e) {
      // Pick any element in l1 and be contained in l2
      return l2.contains(e);
    }).toList();
  }

  Preferences? userPreferences;
  bool isSearchResult = false;
  int? totalResults;
  Future<void> getUserPreferences({String search = ''}) async {
    try {
      userPreferences = null;
      startLoading();
      await HomeFeature.instance.userPreferences(search: search).then(
            (value) => {
              userPreferences = value,
            },
          );
      stopLoading();
    } catch (e) {
      Logger().e(e);
      stopLoading();
    }
  }

  int selectedFavoriteTeamsTab = 0;
  void changeSelectedFavoriteTeamsTab(int index) {
    selectedFavoriteTeamsTab = index;
    update();
  }

  List<PreferencesItemModel>? favoriteTeams() {
    switch (selectedFavoriteTeamsTab) {
      case 0:
        return userPreferences?.lists?.teams;
      case 1:
        return userPreferences?.lists?.nationalTeams;
      default:
        return userPreferences?.lists?.teams;
    }
  }

  int selectedFavoriteChampionshipsTab = 0;
  void changeFavoriteChampionshipsTab(int index) {
    selectedFavoriteChampionshipsTab = index;
    update();
  }

  List<PreferencesItemModel>? favoriteChampionships() {
    switch (selectedFavoriteChampionshipsTab) {
      case 0:
        return userPreferences?.lists?.leagues;
      case 1:
        return userPreferences?.lists?.championships;
      default:
        return userPreferences?.lists?.leagues;
    }
  }

  int selectedFavoritePlayersTab = 0;
  void changeFavoritePlayersTab(int index) {
    selectedFavoritePlayersTab = index;
    update();
  }

  List<PreferencesItemModel>? favoritePlayers() {
    switch (selectedFavoritePlayersTab) {
      case 0:
        return userPreferences?.lists?.topPlayers;
      case 1:
        return userPreferences?.lists?.allPlayers;
      default:
        return userPreferences?.lists?.topPlayers;
    }
  }

  MainSearch mainSearchResult = MainSearch();

  Future<void> mainSearch(String search) async {
    startLoading();
    await HomeFeature.instance.mainSearch(
      search: search,
      onSuccess: (mainSearch) {
        mainSearchResult = mainSearch;
        update();
      },
      onError: (error) {
        Logger().e(error);
      },
    );
    stopLoading();
  }

  void clearSearch() {
    mainSearchResult = MainSearch();
    tdMainSearch.clear();
    update();
  }

  Future<void> updateUserTheme() async {
    try {
      await HomeFeature.instance
          .updateUserTheme(theme: selectedTheme)
          .then((value) => {
                Logger().e(
                  value.toJson(),
                ),
              });
    } catch (e) {
      Logger().e(e);
    }
  }
}
