import 'package:taktikat/feature/model/models/match_details/group_standing.dart';

import '../../../shared_models.dart' as shared;

class StandingsModel {
  StandingsModel({
    required this.league,
    this.standingRow = const [],
    this.round,
    this.group,
  });

  shared.League? league;
  Round? round;
  String? group;
  List<StandingRow> standingRow;

  factory StandingsModel.fromJson(Map<String, dynamic> json) => StandingsModel(
        league: shared.League.fromJson(json['league']),
        round: json['round'] == null ? null : Round.fromJson(json['round']),
        group: json['group'],
        standingRow: json['standings'] == null
            ? []
            :

            ///  best practice
            (json['standings'] as List<dynamic>)
                .map((dynamic json) =>
                    StandingRow.fromJson(json as Map<String, dynamic>))
                .toList(),

        /// bad way
        // List<StandingRow>.from(
        //         json['standings'].map((x) => StandingRow.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'league': league?.toJson(),
        'standings': List<StandingRow>.from(standingRow.map((x) => x.toJson())),
      };
}

class StandingRow {
  StandingRow({
    required this.id,
    this.team,
    this.season,
    this.all,
    this.home,
    this.away,
    this.points,
    this.rank,
    this.goalsDiff,
  });
  int id;
  Team? team;
  Season? season;
  All? all;
  All? home;
  All? away;
  int? rank;
  int? points;
  int? goalsDiff;

  factory StandingRow.fromJson(Map<String, dynamic> json) => StandingRow(
        id: json['id'],
        team: json['team'] == null ? null : Team.fromJson(json['team']),
        season: json['season'] == null ? null : Season.fromJson(json['season']),
        all: json['all'] == null ? null : All.fromJson(json['all']),
        home: json['home'] == null ? null : All.fromJson(json['home']),
        away: json['away'] == null ? null : All.fromJson(json['away']),
        rank: json['rank'],
        points: json['points'],
        goalsDiff: json['goalsDiff'],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'team': team?.toJson(),
        'season': season?.toJson(),
        'all': all?.toJson(),
        'home': home?.toJson(),
        'away': away?.toJson(),
        'rank': rank,
        'points': points,
        'goalsDiff': goalsDiff,
      };
}
