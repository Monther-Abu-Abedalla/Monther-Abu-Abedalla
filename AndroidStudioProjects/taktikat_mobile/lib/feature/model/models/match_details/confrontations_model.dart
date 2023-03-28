import '../../shared_models.dart';
import '../match/match_model.dart';

class ConfrontationsModel {
  ConfrontationsModel({
    required this.homeTeam,
    required this.awayTeam,
    required this.league,
    required this.h2HEnded,
    required this.h2HComing,
    required this.statistics,
    required this.homeTeamPrevMatches,
    required this.awayTeamPrevMatches,
  });

  Team? homeTeam;
  Team? awayTeam;
  League? league;
  List<Matches>? h2HEnded;
  List<Matches>? h2HComing;
  Statistics? statistics;
  List<Matches>? homeTeamPrevMatches;
  List<Matches>? awayTeamPrevMatches;

  factory ConfrontationsModel.fromJson(Map<String, dynamic> json) =>
      ConfrontationsModel(
        homeTeam:
            json['home_team'] == null ? null : Team.fromJson(json['home_team']),
        awayTeam:
            json['away_team'] == null ? null : Team.fromJson(json['away_team']),
        league: json['league'] == null ? null : League.fromJson(json['league']),
        h2HEnded: json['h2h_ended'] == null
            ? null
            : (json['h2h_ended'] as List<dynamic>)
                .map((dynamic json) =>
                    Matches.fromJson(json as Map<String, dynamic>))
                .toList(),
        h2HComing: json['h2h_coming'] == null
            ? null
            : (json['h2h_coming'] as List<dynamic>)
                .map((dynamic json) =>
                    Matches.fromJson(json as Map<String, dynamic>))
                .toList(),
        statistics: json['statistics'] == null
            ? null
            : Statistics.fromJson(json['statistics']),
        homeTeamPrevMatches: json['home_team_prev_matches'] == null
            ? null
            : (json['home_team_prev_matches'] as List<dynamic>)
                .map((dynamic json) =>
                    Matches.fromJson(json as Map<String, dynamic>))
                .toList(),
        awayTeamPrevMatches: json['away_team_prev_matches'] == null
            ? null
            : (json['away_team_prev_matches'] as List<dynamic>)
                .map((dynamic json) =>
                    Matches.fromJson(json as Map<String, dynamic>))
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        'home_team': homeTeam?.toJson(),
        'away_team': awayTeam?.toJson(),
        'h2h_ended': List<dynamic>.from(h2HEnded!.map((x) => x.toJson())),
        'h2h_coming': List<dynamic>.from(h2HComing!.map((x) => x.toJson())),
        'statistics': statistics?.toJson(),
        'home_team_prev_matches':
            List<dynamic>.from(homeTeamPrevMatches!.map((x) => x.toJson())),
        'away_team_prev_matches':
            List<dynamic>.from(awayTeamPrevMatches!.map((x) => x.toJson())),
      };
}

class Statistics {
  Statistics({
    required this.homeWins,
    required this.awayWins,
    required this.draws,
  });

  int? homeWins;
  int? awayWins;
  int? draws;

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        homeWins: json['home_wins'],
        awayWins: json['away_wins'],
        draws: json['draws'],
      );

  Map<String, dynamic> toJson() => {
        'home_wins': homeWins,
        'away_wins': awayWins,
        'draws': draws,
      };
}
