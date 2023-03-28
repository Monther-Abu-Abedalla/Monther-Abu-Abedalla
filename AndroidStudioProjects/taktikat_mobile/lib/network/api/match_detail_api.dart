import '../../feature/model/models/app/app_response.dart';
import 'package:taktikat/network/constance_network/constants_network.dart';
import 'package:taktikat/network/dio_manger/dio_manger.dart';

import '../repo/match_detail_repo.dart';

class MatchDetailApi extends MatchDetailRepo {
  static MatchDetailApi instance = MatchDetailApi._internal();
  MatchDetailApi._internal();

  @override
  Future<AppResponse> getMatchCommentaries({
    required int matchId,
  }) async {
    final res = await DioManager.getInstance.get(
      url: ConstanceNetwork.matchCommentaries(matchId: matchId),
      header: ConstanceNetwork.header(TypeToken.acceptLanguage),
    );
    return AppResponse.fromJson(res.data);
  }

  Future<AppResponse> getMatchDetails({
    required int matchId,
  }) async {
    final response = await DioManager.getInstance.get(
        url: ConstanceNetwork.matchDetails(matchId: matchId),
        header: ConstanceNetwork.header(TypeToken.acceptLanguage));
    if (response.statusCode == 200) {
      return AppResponse.fromJson(response.data);
    } else {
      return AppResponse(
          message: (response.data as Map<String, dynamic>)['message'],
          status: 400);
    }
  }

  @override
  Future<AppResponse> getStandings({required int matchId}) async {
    final res = await DioManager.getInstance.get(
      url: ConstanceNetwork.matchStandings(matchId: matchId),
      header: ConstanceNetwork.header(TypeToken.acceptLanguage),
    );
    return AppResponse.fromJson(res.data);
  }

  @override
  Future<AppResponse> getMatchStandingsComparison(
      {required int matchId}) async {
    final res = await DioManager.getInstance.get(
      url: ConstanceNetwork.matchStandingsComparison(matchId: matchId),
      header: ConstanceNetwork.header(TypeToken.acceptLanguage),
    );
    return AppResponse.fromJson(res.data);
  }

  @override
  Future<AppResponse> getMatchConfrontations({required int matchId}) async {
    final res = await DioManager.getInstance.get(
      url: ConstanceNetwork.matchConfrontations(matchId: matchId),
      header: ConstanceNetwork.header(TypeToken.acceptLanguage),
    );
    return AppResponse.fromJson(res.data);
  }

  @override
  Future<AppResponse> getMatchStatistics({required int matchId}) async {
    final res = await DioManager.getInstance.get(
      url: ConstanceNetwork.matchStatistics(matchId: matchId),
      header: ConstanceNetwork.header(TypeToken.acceptLanguage),
    );
    return AppResponse.fromJson(res.data);
  }

  @override
  Future<AppResponse> getTopRated({required int matchId}) async {
    final res = await DioManager.getInstance.get(
      url: ConstanceNetwork.topRated(matchId: matchId),
      header: ConstanceNetwork.header(TypeToken.acceptLanguage),
    );
    return AppResponse.fromJson(res.data);
  }

  @override
  Future<AppResponse> getMatchLineups({required int matchId}) async {
    final res = await DioManager.getInstance.get(
      url: ConstanceNetwork.matchLineups(matchId: matchId),
      header: ConstanceNetwork.header(TypeToken.acceptLanguage),
    );
    return AppResponse.fromJson(res.data);
  }
}
