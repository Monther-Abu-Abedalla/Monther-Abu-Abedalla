import 'package:get/get.dart';
import 'package:taktikat/feature/view_model/match_view_model.dart';

import '../../feature/model/enums/competition_vote_types.dart';
import '../../feature/model/models/app/app_response.dart';
import '../constance_network/constants_network.dart';
import '../dio_manger/dio_manger.dart';

class MatchApi {
  static final MatchApi instance = MatchApi._internal();

  MatchApi._internal();

  Future<AppResponse> getMatchesByDate(
      {required int pageNumber,
      required String matchDate,
      required String search,
      required bool isLive}) async {
    final viewModel = Get.find<MatchViewModel>();
    final response = await DioManager.getInstance.get(
        url: ConstanceNetwork.matchIndex(
            date: matchDate,
            search: search,
            page: pageNumber,
            isLive: isLive ? 1 : 0),
        header: ConstanceNetwork.header(TypeToken.acceptLanguage));
    if (response.statusCode == 200) {
      viewModel.totalMatchPages =
          (response.data as Map<String, dynamic>)['totalOfPages'];
      return AppResponse.fromJson(response.data);
    } else {
      return AppResponse(
          message: (response.data as Map<String, dynamic>)['message'],
          status: 400);
    }
  }

  Future<AppResponse> getFavoriteMatches(
      {required String date,
      required String search,
      required bool isLive}) async {
    final response = await DioManager.getInstance.get(
        url: ConstanceNetwork.favoriteMatches(
            date: date, search: search, isLive: isLive ? 1 : 0),
        header: ConstanceNetwork.header(TypeToken.acceptLanguage));
    if (response.statusCode == 200) {
      return AppResponse.fromJson(response.data);
    } else {
      return AppResponse(
          message: (response.data as Map<String, dynamic>)['message'],
          status: 400);
    }
  }

  Future<AppResponse> toggleFavoriteMatch({required int matchId}) async {
    final response = await DioManager.getInstance.post(
        url: ConstanceNetwork.toggleFavoriteMatch(matchId: matchId),
        header: ConstanceNetwork.header(TypeToken.acceptLanguage));
    if (response.statusCode == 200) {
      return AppResponse.fromJson(response.data);
    } else {
      return AppResponse(
          message: (response.data as Map<String, dynamic>)['message'],
          status: 400);
    }
  }

  Future<AppResponse> getCompetitions({required String date}) async {
    final response = await DioManager.getInstance.get(
        url: ConstanceNetwork.getCompetitions(date: date),
        header: ConstanceNetwork.header(TypeToken.acceptLanguage));
    if (response.statusCode == 200) {
      return AppResponse.fromJson(response.data);
    } else {
      return AppResponse(
          message: (response.data as Map<String, dynamic>)['message'],
          status: 400);
    }
  }

  Future<AppResponse> toggleCompetition(
      {required int competitionId,
      required CompetitionVoteTypes competitionVoteTypes,
      required String? wining,
      String? homeTeamGoals,
      String? awayTeamGoals}) async {
    final response = await DioManager.getInstance.postForm(
        url: ConstanceNetwork.toggleCompetition(competitionId: competitionId),
        header: ConstanceNetwork.header(TypeToken.multipartFormData),
        body: competitionVoteTypes == CompetitionVoteTypes.swipe
            ? {
                'type': competitionVoteTypes.value,
                'wining': wining,
              }
            : {
                'type': competitionVoteTypes.value,
                'wining': wining,
                'home_team_score': homeTeamGoals,
                'away_team_score': awayTeamGoals
              });
    if (response.statusCode == 200) {
      return AppResponse.fromJson(response.data);
    } else {
      return AppResponse(
        message: (response.data as Map<String, dynamic>)['message'],
        status: 400,
      );
    }
  }
}
