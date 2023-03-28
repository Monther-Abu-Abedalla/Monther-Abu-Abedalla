import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:taktikat/feature/model/enums/vote_status.dart';
import 'package:taktikat/feature/model/models/match_details/commentaries.dart';
import 'package:taktikat/feature/model/models/match_details/lineup/lineup_model.dart';
import 'package:taktikat/feature/view_model/main_view_model.dart';
import 'package:taktikat/network/feature/match_detail_feature.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../../network/feature/match_feature.dart';
import '../model/enums/competition_vote_types.dart';
import '../model/enums/lineup_types.dart';
import '../model/enums/match_status.dart';
import '../model/models/match/match_model.dart';
import '../model/models/match_details/confrontations_model.dart';
import '../model/models/match_details/group_standings/standings_model.dart';
import '../model/models/match_details/lineup/home_lineup.dart';
import '../model/models/match_details/match_details_model.dart';
import '../model/models/match_details/statistics_model.dart';
import '../model/models/match_details/top_rated_model.dart';
import '../model/shared_models.dart';

class MatchDetailViewModel extends MainViewModel {
  bool isLineUpLoading = false;

  void startLoadingLineup() {
    isLineUpLoading = true;
    update();
  }

  void stopLoadingLineup() {
    isLineUpLoading = false;
    update();
  }

  LineupTypes selectedTeamLineup = LineupTypes.home;

  void changeSelectedTeamLineup(LineupTypes lineupTypes) {
    selectedTeamLineup = lineupTypes;
    update();
  }

  bool isMatchFinished = false;
  void checkIfMatchFinished(Matches match) {
    isMatchFinished = false;
    update();
    if (match.statusValue == MatchStatus.matchFinished.value) {
      isMatchFinished = true;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    selectedTeamLineup = LineupTypes.home;
  }

  Commentaries? matchCommentaries;

  int bottomNavIndex = 4;
  void changeBottomNavIndex(int index) {
    bottomNavIndex = index;
    update();
  }

  Future<void> getMatchCommentaries({
    required int matchId,
  }) async {
    try {
      startLoading();
      matchCommentaries =
          await MatchDetailFeature.instance.getMatchCommentaries(
        matchId: matchId,
        onSuccess: (data) {
          matchCommentaries = data;
        },
        onError: (error) {
          Logger().e(error);
        },
      );
    } catch (e) {
      Logger().e(e);
    } finally {
      stopLoading();
    }
  }

  StandingsModel? standings;
  List<StandingsModel> groupStandings = [];

  Future<void> getMatchStandings({required int matchId}) async {
    try {
      startLoading();
      await MatchDetailFeature.instance.getMatchStandings(
        matchId: matchId,
        onSuccess: (data) {
          if (data.length == 1) {
            standings = data.first;
          } else {
            groupStandings = data;
          }
        },
        onError: (error) {
          Logger().e(error);
        },
      );
    } catch (e) {
      Logger().e(e);
    } finally {
      stopLoading();
    }
  }

  StandingsModel? matchStandingsComparison;

  Future<void> getMatchStandingsComparison({required int matchId}) async {
    try {
      startLoading();
      await MatchDetailFeature.instance.getMatchStandingsComparison(
        matchId: matchId,
        onSuccess: (data) {
          if (data.isNotEmpty) {
            matchStandingsComparison = data.first;
          }
        },
        onError: (error) {
          Logger().e(error);
        },
      );
    } catch (e) {
      Logger().e(e);
    } finally {
      stopLoading();
    }
  }

  StatisticsModel? matchStatistics;
  Stats? statisticsPossession;
  Stats? statisticsExpectedGoals;
  Stats? statisticsShotsOnTarget;
  Stats? statisticsTotalShots;
  Stats? statisticsAccuratePasses;

  Future<void> getMatchStatistics({required int matchId}) async {
    try {
      startLoading();
      await MatchDetailFeature.instance.getMatchStatistics(
        matchId: matchId,
        onSuccess: (data) {
          matchStatistics = data;
          statisticsPossession = data.statistics
              ?.firstWhereOrNull((element) => element.key == 'ball_possession');
          statisticsExpectedGoals = data.statistics
              ?.firstWhereOrNull((element) => element.key == 'expected_goals');
          statisticsShotsOnTarget = data.statistics
              ?.firstWhereOrNull((element) => element.key == 'shots_on_goal');
          statisticsTotalShots = data.statistics
              ?.firstWhereOrNull((element) => element.key == 'total_shots');
          statisticsAccuratePasses = data.statistics
              ?.firstWhereOrNull((element) => element.key == 'passes_accurate');
        },
        onError: (error) {
          Logger().e(error);
        },
      );
    } catch (e) {
      Logger().e(e);
    } finally {
      stopLoading();
    }
  }

  ConfrontationsModel? matchConfrontations;

  Future<void> getMatchConfrontations({required int matchId}) async {
    try {
      startLoading();
      await MatchDetailFeature.instance.getMatchConfrontations(
        matchId: matchId,
        onSuccess: (data) {
          matchConfrontations = data;
        },
        onError: (error) {
          Logger().e(error);
        },
      );
    } catch (e) {
      Logger().e(e);
    } finally {
      stopLoading();
    }
  }

  TopRated? topRated;

  Future<void> getTopRated({required int matchId}) async {
    try {
      startLoading();
      await MatchDetailFeature.instance.getTopRated(
        matchId: matchId,
        onSuccess: (data) {
          topRated = data;
        },
        onError: (error) {
          Logger().e(error);
        },
      );
    } catch (e) {
      Logger().e(e);
    } finally {
      stopLoading();
    }
  }

  /// live match stats tabBar
  bool isHome = true;

  MatchDetails? matchDetails;
  bool matchDetailsLoading = false;
  Future<void> getMatchDetails(
      {bool isHaveLoading = true, required int matchId}) async {
    try {
      if (isHaveLoading) {
        matchDetailsLoading = true;
        update();
      }
      await MatchDetailFeature.instance.getMatchDetails(matchId: matchId).then(
            (value) => {
              matchDetails = value,
            },
          );
      matchDetailsLoading = false;
      update();
    } catch (e) {
      Logger().e(e);
      matchDetailsLoading = false;
      update();
    }
  }

  VoteStates voteState = VoteStates.draw;

  double positionX = 0;
  double maxSwipeDistance = MediaQuery.of(Get.context!).size.width / 3;
  double swipeDistance = 0;

  void onPanStart(DragStartDetails details) {
    positionX = details.localPosition.dx;
    update();
  }

  void onPanEnd(DragEndDetails details) {
    if (positionX > 0) {
      voteState = Utils.instance.isArabic() ? VoteStates.home : VoteStates.away;
    } else {
      voteState = Utils.instance.isArabic() ? VoteStates.away : VoteStates.home;
    }
    swipeDistance = 0.0;

    update();
  }

  void onPanUpdate(DragUpdateDetails details) {
    positionX += details.delta.dx;
    swipeDistance += details.delta.dx.abs();
    update();
  }

  void initDrag() {
    positionX = 0.0;
    swipeDistance = 0.0;
    voteState = VoteStates.draw;
    update();
  }

  Future<void> saveCompetition({
    required int competitionId,
    bool isReVote = false,
  }) async {
    try {
      await MatchFeature.instance
          .toggleCompetition(
            competitionId: competitionId,
            competitionVoteTypes: CompetitionVoteTypes.swipe,
            wining: voteState.value,
          )
          .then(
            (value) => {
              // competition.isExpected = value?.isExpected ?? false,
              // competition.competitionResults = value?.competitionResults,
              // if (value?.isExpected == true)
              //   {
              //     Utils.instance.snackPrimary(
              //         body: isReVote
              //             ? StringKeys.singleton.matchReVotedSuccessfully.tr
              //             : StringKeys.singleton.matchVotedSuccessfully.tr)
              //   },
              // update(),
            },
          );
    } catch (e) {
      Logger().e(e);
      stopLoading();
    }
  }

  void localReVote() {
    if (matchDetails?.hasCompetition == true) {
      initDrag();
      matchDetails?.isExpected = false;
      update();
    }
  }

  LineupModel? lineup;

  Future<void> getLineup({required int matchId}) async {
    try {
      startLoadingLineup();
      await MatchDetailFeature.instance.getMatchLineups(
        matchId: matchId,
        onSuccess: (data) {
          lineup = data;
        },
        onError: (error) {
          Logger().e(error);
        },
      );
    } catch (e) {
      Logger().e(e);
    } finally {
      stopLoadingLineup();
    }
  }

  initController() {
    bottomNavIndex = 0;
    matchDetails = null;
    standings = null;
    groupStandings.clear();
    matchStatistics = null;
    matchConfrontations = null;
    topRated = null;
    lineup = null;
    matchDetailsLoading = false;
    voteState = VoteStates.draw;
    positionX = 0.0;
    swipeDistance = 0.0;
  }

  //This Code For Player Match Details Slider
  HomeLineup? activeHomeLineup;

  void setActivePlayerDetails(HomeLineup? homeLineup) {
    activeHomeLineup = homeLineup;
    update();
  }

  void changeActivePlayer({required bool isHome, required bool isNext}) {
    try {
      if (isHome) {
        int index = lineup!.home!.lineup.indexWhere(
            (element) => element.player?.id == activeHomeLineup!.player?.id);

        if (isNext) {
          if (index == lineup!.home!.lineup.length - 1) {
            index = 0;
          } else {
            index++;
          }
        } else {
          if (index == 0) {
            index = lineup!.home!.lineup.length - 1;
          } else {
            index--;
          }
        }
        activeHomeLineup = lineup!.home!.lineup[index];
      } else {
        int index = lineup!.away!.lineup.indexWhere(
            (element) => element.player?.id == activeHomeLineup!.player?.id);

        if (isNext) {
          if (index == lineup!.away!.lineup.length - 1) {
            index = 0;
          } else {
            index++;
          }
        } else {
          if (index == 0) {
            index = lineup!.away!.lineup.length - 1;
          } else {
            index--;
          }
        }
        activeHomeLineup = lineup!.away!.lineup[index];
      }
    } catch (e) {
      Logger().e(e);
    }

    update();
  }

  List<String> getNextThreePlayersImagesInSlider() {
    final List<String> images = [];
    final int index = lineup!.home!.lineup.indexWhere(
      (element) => element.player?.id == activeHomeLineup!.player?.id,
    );
    if (index == lineup!.home!.lineup.length - 1) {
      images.add(lineup!.home!.lineup[0].player?.image ?? '');
      images.add(lineup!.home!.lineup[1].player?.image ?? '');
      images.add(lineup!.home!.lineup[2].player?.image ?? '');
    } else if (index == lineup!.home!.lineup.length - 2) {
      images.add(lineup!.home!.lineup[index + 1].player?.image ?? '');
      images.add(lineup!.home!.lineup[0].player?.image ?? '');
      images.add(lineup!.home!.lineup[1].player?.image ?? '');
    } else if (index == lineup!.home!.lineup.length - 3) {
      images.add(lineup!.home!.lineup[index + 1].player?.image ?? '');
      images.add(lineup!.home!.lineup[index + 2].player?.image ?? '');
      images.add(lineup!.home!.lineup[0].player?.image ?? '');
    } else {
      images.add(lineup!.home!.lineup[index + 1].player?.image ?? '');
      images.add(lineup!.home!.lineup[index + 2].player?.image ?? '');
      images.add(lineup!.home!.lineup[index + 3].player?.image ?? '');
    }
    return images;
  }

  String getPlayerHeatMapUrl({required bool isHome}) {
   final String url =
        'https://v2-api-dev.taktikat.app/match/${matchDetails?.id}/heatmap/${activeHomeLineup?.player?.id}/image?isHome=${isHome ? '1' : '0'}&isMobile=1&size=small';
    return url;
  }

  void setWinner({required VoteStates voteState}) {
    this.voteState = voteState;
    if (voteState == VoteStates.away) {
      positionX =
          Utils.instance.isArabic() ? -maxSwipeDistance : maxSwipeDistance;
      swipeDistance =
          Utils.instance.isArabic() ? -maxSwipeDistance : maxSwipeDistance;
    } else {
      positionX =
          Utils.instance.isArabic() ? maxSwipeDistance : -maxSwipeDistance;
      swipeDistance =
          Utils.instance.isArabic() ? maxSwipeDistance : -maxSwipeDistance;
    }

    update();
  }
}
