import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:taktikat/feature/model/enums/home_tabs.dart';
import 'package:taktikat/network/feature/match_feature.dart';
import 'package:taktikat/utils/localization/string_keys.dart';

import '../../network/feature/home_feature.dart';
import '../../utils/utils/utils.dart';
import '../model/enums/competition_vote_types.dart';
import '../model/enums/preferences_types.dart';
import '../model/enums/vote_status.dart';
import '../model/models/favorite/general_favorite.dart';
import '../model/models/home/competition_model.dart';
import '../model/models/match/general_matches_model.dart';
import '../model/models/match/match_model.dart';
import 'main_view_model.dart';

class MatchViewModel extends MainViewModel {
  DateTime date = DateTime.now();

  bool isLive = false;
  bool liveFlag = false;
  liveAnimation() {
    liveFlag = !liveFlag;
    update();
  }

  bool isSearchExpand = false;
  searchExpand() {
    isSearchExpand = !isSearchExpand;
    update();
    if (!isSearchExpand) {
      getMatchesByDate(
        search: '',
        date: date,
        isLive: isLive,
        isHaveLoading: true,
      );
    }
  }

  String voteStatus({required String? home, required String? away}) {
   final int homeScore = int.tryParse(home ?? '0') ?? 0;
   final int awayScore = int.tryParse(away ?? '0') ?? 0;

    if (homeScore > awayScore) {
      return VoteStates.home.value;
    }
    if (homeScore < awayScore) {
      return VoteStates.away.value;
    } else {
      return VoteStates.draw.value;
    }
  }

  List<GeneralMatchesModel> matches = [];

  Future<void> getMatchesByDate({
    String search = '',
    bool isHaveLoading = true,
    int pageNumber = 1,
    DateTime? date,
    bool isPagination = false,
    bool isLive = false,
  }) async {
    // try {
    if (!isPagination) {
      matches.clear();
    }
    if (isHaveLoading && matches.isEmpty) {
      startLoading();
    }

    await MatchFeature.instance
        .getMatchesByDate(
            matchDate: date.toString(),
            search: search,
            pageNumber: pageNumber,
            isLive: isLive)
        .then(
          (value) => {
            matches.addAll(value),
          },
        );
    stopLoading();
    // } catch (e) {
    //   Logger().e(e);
    //   stopLoading();
    // }
  }

  GeneralFavorite favoriteMatches = GeneralFavorite();

  Future<void> getFavoriteMatches({
    DateTime? date,
    String search = '',
    bool isLive = false,
  }) async {
    // try {
    startLoading();
    await MatchFeature.instance
        .getFavoriteMatches(
          date: date.toString(),
          search: search,
          isLive: isLive,
        )
        .then(
          (value) => {
            favoriteMatches = value,
          },
        );
    stopLoading();
    // } catch (e) {
    //   Logger().e(e);
    //   stopLoading();
    // }
  }

  Future<void> removePreferencesFromFavorite(
      {required PreferencesTypes preferenceType, required int id}) async {
    try {
      await HomeFeature.instance
          .togglePreferences(preferenceType: preferenceType, id: id)
          .then((value) => {
                getFavoriteMatches(date: date),
              });
    } catch (e) {
      Logger().e(e);
    }
  }

  int matchesPage = 1;
  int totalMatchPages = 2;
  bool paginationLoading = false;
  Future<void> loadMoreMatches() async {
    paginationLoading = true;
    update();

    matchesPage++;
    if (matchesPage <= totalMatchPages) {
      await getMatchesByDate(
        date: date,
        pageNumber: matchesPage,
        isPagination: true,
      );
    }
    paginationLoading = false;
    update();
  }

  bool favoriteMatchToggleState = false;
  Future<void> toggleFavoriteMatch({required Matches match}) async {
    try {
      await MatchFeature.instance
          .toggleFavoriteMatch(matchId: match.id ?? -1)
          .then(
            (value) => {
              favoriteMatchToggleState = value?.event ?? false,
              match.isFavorite = favoriteMatchToggleState,
              update(),
              if (favoriteMatchToggleState)
                {
                  Utils.instance.snackPrimary(
                      body: StringKeys.singleton.matchAddedToFavorite.tr)
                }
              else
                {
                  Utils.instance.snackWarning(
                      body: StringKeys.singleton.matchRemovedFromFavorite.tr)
                },
            },
          );
    } catch (e) {
      Logger().e(e);
      stopLoading();
    }
  }

  List<Competition> competition = [];
  Future<void> getCompetitions({required DateTime date}) async {
    try {
      startLoading();
      competition.clear();
      await MatchFeature.instance.getCompetitions(date: date.toString()).then(
            (value) => {
              competition = value,
            },
          );
      stopLoading();
    } catch (e) {
      Logger().e(e);
      stopLoading();
    }
  }

  Future<void> toggleCompetition(
      {required Competition competition,
      required CompetitionVoteTypes competitionVoteTypes,
      required String? wining,
      bool isReVote = false,
      String? homeTeamGoals,
      String? awayTeamGoals}) async {
    try {
      await MatchFeature.instance
          .toggleCompetition(
              competitionId: competition.id ?? -1,
              competitionVoteTypes: competitionVoteTypes,
              wining: wining,
              homeTeamGoals: homeTeamGoals,
              awayTeamGoals: awayTeamGoals)
          .then(
            (value) => {
              competition.isExpected = value?.isExpected ?? false,
              competition.competitionResults = value?.competitionResults,
              if (value?.isExpected == true)
                {
                  Utils.instance.snackPrimary(
                      body: isReVote
                          ? StringKeys.singleton.matchReVotedSuccessfully.tr
                          : StringKeys.singleton.matchVotedSuccessfully.tr)
                },
              update(),
            },
          );
    } catch (e) {
      Logger().e(e);
      stopLoading();
    }
  }

  void restPagination() {
    matchesPage = 1;
    totalMatchPages = 2;
  }

  HomeTabs selectedHomeTab = HomeTabs.allMatch;

  HomeTabs getHomeActiveTab() {
    return selectedHomeTab;
  }

  void setHomeActiveTab(HomeTabs homeTab) {
    selectedHomeTab = homeTab;
    update();
  }

  void clearAndInit() {
    matches.clear();
    favoriteMatches = GeneralFavorite();
    isLive = false;
    isSearchExpand = false;
    favoriteMatchToggleState = false;
    restPagination();
    update();
  }
}
