import 'package:taktikat/feature/model/models/app/app_response.dart';

abstract class MatchDetailRepo {
  Future<AppResponse> getMatchCommentaries({
    required int matchId,
  });

  Future<AppResponse> getStandings({
    required int matchId,
  });

  Future<AppResponse> getMatchStandingsComparison({
    required int matchId,
  });

  Future<AppResponse> getMatchConfrontations({
    required int matchId,
  });

  Future<AppResponse> getTopRated({
    required int matchId,
  });

  Future<AppResponse> getMatchStatistics({
    required int matchId,
  });

  ///matches/2718/lineups
  
  Future<AppResponse> getMatchLineups({
    required int matchId,
  });

}
