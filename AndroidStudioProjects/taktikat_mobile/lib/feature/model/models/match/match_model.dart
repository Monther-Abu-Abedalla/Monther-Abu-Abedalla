import '../../shared_models.dart';

class Matches {
  Matches({
    required this.id,
    required this.homeTeamId,
    required this.homeTeam,
    required this.awayTeamId,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
    required this.league,
    required this.matchType,
    required this.status,
    required this.statusValue,
    required this.timezone,
    required this.date,
    required this.time,
    required this.startAt,
    required this.startAt2,
    required this.elapsed,
    required this.startAtWithTimezone,
    required this.timeElapsed,
    required this.isLive,
    required this.isFinished,
    this.penalties,
    // required this.expectationsCompetition,
    required this.competitionResults,
    required this.favoriteTeam,
    this.isFavorite = false,
  });

  int? id;
  int? idx;
  int? homeTeamId;
  Team? homeTeam;
  int? awayTeamId;
  Team? awayTeam;
  String? homeScore;
  String? awayScore;
  League? league;
  String? matchType;
  String? status;
  String? statusValue;
  String? timezone;
  String? date;
  String? time;
  DateTime? startAt;
  DateTime? startAt2;
  int? elapsed;
  DateTime? startAtWithTimezone;
  int? timeElapsed;
  bool? isLive;
  bool? isFinished;
  bool isFavorite;
  // List<dynamic>? expectationsCompetition;
  CompetitionResults? competitionResults;
  int? favoriteTeam;
  List<PenaltiesModel>? penalties;

  factory Matches.fromJson(Map<String, dynamic> json) => Matches(
        id: json['id'],
        favoriteTeam: json['favorite_team'],
        homeTeamId: json['home_team_id'] ?? json['title'],
        homeTeam:
            json['home_team'] == null ? null : Team.fromJson(json['home_team']),
        awayTeamId: json['away_team_id'],
        awayTeam:
            json['away_team'] == null ? null : Team.fromJson(json['away_team']),
        homeScore: json['home_score'],
        awayScore: json['away_score'],
        league:
            json['league'] == null || json['league'] is! Map<String, dynamic>
                ? null
                : League.fromJson(json['league']),
        matchType: json['match_type'],
        status: json['status'],
        statusValue: json['status_value'],
        timezone: json['timezone'],
        date: json['date'],
        time: json['time'],
        startAt:
            json['start_at'] == null ? null : DateTime.parse(json['start_at']),
        startAt2: json['start_at2'] == null
            ? null
            : DateTime.parse(json['start_at2']),
        elapsed: json['elapsed'] is String
            ? int.tryParse(json['elapsed'])
            : json['elapsed'],
        startAtWithTimezone: json['start_at_with_timezone'] == null
            ? null
            : DateTime.parse(json['start_at_with_timezone']),
        timeElapsed: json['time_elapsed'],
        isLive: json['is_live'],
        isFavorite: json['is_favorite'],
        isFinished: json['is_finished'],
        penalties: json['palatines'] == null
            ? null
            : (json['palatines'] as List<dynamic>)
                .map((dynamic json) =>
                    PenaltiesModel.fromJson(json as Map<String, dynamic>))
                .toList(),
        // expectationsCompetition: json['expectationsCompetition'] == null
        // ? null
        // : List<dynamic>.from(json['expectationsCompetition'].map((x) => x)),
        competitionResults: json['competition_results'] == null
            ? null
            : CompetitionResults.fromJson(json['competition_results']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'home_team_id': homeTeamId,
        'home_team': homeTeam?.toJson(),
        'away_team_id': awayTeamId,
        'away_team': awayTeam?.toJson(),
        'home_score': homeScore,
        'away_score': awayScore,
        'league': league?.toJson(),
        'match_type': matchType,
        'status': status,
        'status_value': statusValue,
        'timezone': timezone,
        'date': date,
        'time': time,
        'start_at': startAt?.toIso8601String(),
        'start_at2': startAt2?.toIso8601String(),
        'elapsed': elapsed,
        'start_at_with_timezone': startAtWithTimezone?.toIso8601String(),
        'time_elapsed': timeElapsed,
        'is_live': isLive,
        'is_finished': isFinished,
        // 'expectationsCompetition':
        //     List<dynamic>.from(expectationsCompetition!.map((x) => x)),
        'competition_results': competitionResults?.toJson(),
        'favorite_team': favoriteTeam,
      };

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //   other is Matches && runtimeType == other.runtimeType && name == other.id;

  // @override
  // int get hashCode => id.hashCode;

  // //List<Matches> data , data.remove(Oonropvwn);
}

class PenaltiesModel {
  PenaltiesModel({
    required this.team,
    required this.score,
  });

  String? team;
  int? score;

  factory PenaltiesModel.fromJson(Map<String, dynamic> json) => PenaltiesModel(
        team: json['team'],
        score: json['score'],
      );

  Map<String, dynamic> toJson() => {
        'team': team,
        'score': score,
      };
}

class CompetitionResults {
  CompetitionResults({
    required this.total,
  });

  int? total;

  factory CompetitionResults.fromJson(Map<String, dynamic> json) =>
      CompetitionResults(
        total: json['total'],
      );

  Map<String, dynamic> toJson() => {
        'total': total,
      };
}
