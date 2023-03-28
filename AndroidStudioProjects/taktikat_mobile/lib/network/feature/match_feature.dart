import 'package:taktikat/feature/model/models/favorite/general_favorite.dart';

import '../../feature/model/enums/competition_vote_types.dart';
import '../../feature/model/models/home/competition_model.dart';
import '../../feature/model/models/home/event_model.dart';
import '../../feature/model/models/match/general_matches_model.dart';
import '../api/match_api.dart';

class MatchFeature {
  static final MatchFeature instance = MatchFeature._internal();

  MatchFeature._internal();

  Future<List<GeneralMatchesModel>> getMatchesByDate(
      {required int pageNumber,
      required String matchDate,
      required String search,
      required bool isLive}) async {
    final response = await MatchApi.instance.getMatchesByDate(
        matchDate: matchDate,
        search: search,
        pageNumber: pageNumber,
        isLive: isLive);
    if (response.status == 200) {
     final List data = response.data;
      return data.map((e) => GeneralMatchesModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<GeneralFavorite> getFavoriteMatches(
      {required String date,
      required String search,
      required bool isLive}) async {
    final response = await MatchApi.instance
        .getFavoriteMatches(date: date, search: search, isLive: isLive);
    if (response.status == 200 && response.data is Map<String, dynamic>) {
      return GeneralFavorite.fromJson(response.data);
    } else {
      return GeneralFavorite();
    }
  }

  Future<ToggleFavoriteMatchesEvent?> toggleFavoriteMatch(
      {required int matchId}) async {
    final response =
        await MatchApi.instance.toggleFavoriteMatch(matchId: matchId);
    if (response.status == 200) {
      return ToggleFavoriteMatchesEvent.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<List<Competition>> getCompetitions({required String date}) async {
    final response = await MatchApi.instance.getCompetitions(date: date);
    if (response.status == 200) {
    final  List data = response.data;
      return data.map((e) => Competition.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<Competition?> toggleCompetition({
    required int competitionId,
    required CompetitionVoteTypes competitionVoteTypes,
    required String? wining,
    String? homeTeamGoals,
    String? awayTeamGoals,
  }) async {
    final response = await MatchApi.instance.toggleCompetition(
      competitionId: competitionId,
      competitionVoteTypes: competitionVoteTypes,
      awayTeamGoals: awayTeamGoals,
      homeTeamGoals: homeTeamGoals,
      wining: wining,
    );
    if (response.status == 200) {
      return Competition.fromJson(response.data);
    } else {
      return null;
    }
  }
}
