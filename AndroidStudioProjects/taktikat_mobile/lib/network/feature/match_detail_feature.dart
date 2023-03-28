import 'package:taktikat/feature/model/models/match_details/commentaries.dart';
import 'package:taktikat/feature/model/models/match_details/group_standings/standings_model.dart';
import 'package:taktikat/feature/model/models/match_details/lineup/lineup_model.dart';
import 'package:taktikat/feature/model/models/match_details/top_rated_model.dart';

import '../../feature/model/models/app/app_response.dart';
import '../../feature/model/models/match_details/confrontations_model.dart';
import '../../feature/model/models/match_details/match_details_model.dart';
import '../../feature/model/models/match_details/statistics_model.dart';
import '../api/match_detail_api.dart';

class MatchDetailFeature {
  static MatchDetailFeature instance = MatchDetailFeature._internal();
  MatchDetailFeature._internal();

  Future<Commentaries> getMatchCommentaries({
    required int matchId,
    required Function(Commentaries) onSuccess,
    required Function(AppResponse) onError,
  }) async {
    final AppResponse res =
        await MatchDetailApi.instance.getMatchCommentaries(matchId: matchId);
    if (res.status == 200) {
      onSuccess(Commentaries.fromJson(res.data));
    } else {
      onError(res);
    }

    return Commentaries.fromJson(res.data);
  }

  Future<List<StandingsModel>> getMatchStandings({
    required int matchId,
    required Function(List<StandingsModel>) onSuccess,
    required Function(AppResponse) onError,
  }) async {
    final AppResponse res =
        await MatchDetailApi.instance.getStandings(matchId: matchId);
    final List data = res.data;
    if (res.status == 200) {
      onSuccess(data.map((e) => StandingsModel.fromJson(e)).toList());
    } else {
      onError(res);
    }
    return data.map((e) => StandingsModel.fromJson(e)).toList();
  }

  Future<List<StandingsModel>> getMatchStandingsComparison({
    required int matchId,
    required Function(List<StandingsModel>) onSuccess,
    required Function(AppResponse) onError,
  }) async {
    final AppResponse res = await MatchDetailApi.instance
        .getMatchStandingsComparison(matchId: matchId);
    final List data = res.data;
    if (res.status == 200) {
      onSuccess(data.map((e) => StandingsModel.fromJson(e)).toList());
    } else {
      onError(res.data);
    }
    return data.map((e) => StandingsModel.fromJson(e)).toList();
  }

  Future<ConfrontationsModel> getMatchConfrontations({
    required int matchId,
    required Function(ConfrontationsModel) onSuccess,
    required Function(AppResponse) onError,
  }) async {
    final AppResponse res =
        await MatchDetailApi.instance.getMatchConfrontations(matchId: matchId);
    if (res.status == 200) {
      onSuccess(ConfrontationsModel.fromJson(res.data));
    } else {
      onError(res.data);
    }
    return ConfrontationsModel.fromJson(res.data);
  }

  Future<StatisticsModel> getMatchStatistics({
    required int matchId,
    required Function(StatisticsModel) onSuccess,
    required Function(AppResponse) onError,
  }) async {
    final AppResponse res =
        await MatchDetailApi.instance.getMatchStatistics(matchId: matchId);
    if (res.status == 200) {
      onSuccess(StatisticsModel.fromJson(res.data));
    } else {
      onError(res.data);
    }
    return StatisticsModel.fromJson(res.data);
  }

  Future<MatchDetails?> getMatchDetails({required int matchId}) async {
    final response =
        await MatchDetailApi.instance.getMatchDetails(matchId: matchId);
    if (response.status == 200) {
      return MatchDetails.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<TopRated?> getTopRated({
    required int matchId,
    required Function(TopRated) onSuccess,
    required Function(AppResponse) onError,
  }) async {
    final AppResponse res =
        await MatchDetailApi.instance.getTopRated(matchId: matchId);
    if (res.status == 200) {
      onSuccess(TopRated.fromJson(res.data));
    } else {
      onError(res.data);
    }
    return TopRated.fromJson(res.data);
  }

  Future<LineupModel> getMatchLineups({
    required int matchId,
    required Function(LineupModel) onSuccess,
    required Function(AppResponse) onError,
  }) async {
    final AppResponse res =
        await MatchDetailApi.instance.getMatchLineups(matchId: matchId);
    if (res.status == 200) {
      onSuccess(LineupModel.fromJson(res.data));
    } else {
      onError(res.data);
    }
    return LineupModel.fromJson(res.data);
  }
}
