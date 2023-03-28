import '../../shared_models.dart';

class StatisticsModel {
  StatisticsModel({
    required this.id,
    required this.homeTeamId,
    required this.homeTeam,
    required this.awayTeamId,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
    required this.statistics,
    required this.matchType,
    required this.status,
    required this.statusValue,
    required this.timezone,
    required this.date,
    required this.time,
    required this.startAtTimeNewLabelV2,
    required this.startAt,
    required this.startAt2,
    required this.elapsed,
    required this.startAtWithIS,
    required this.startAtWithTimezone,
    required this.timeElapsed,
    required this.timeElapsedLabel,
    required this.isLive,
    required this.orderIsLive,
    required this.isFinished,
    required this.isFavorite,
  });

  int? id;
  int? homeTeamId;
  Team? homeTeam;
  int? awayTeamId;
  Team? awayTeam;
  String? homeScore;
  String? awayScore;
  List<Stats>? statistics;
  String? matchType;
  String? status;
  String? statusValue;
  String? timezone;
  String? date;
  String? time;
  String? startAtTimeNewLabelV2;
  DateTime? startAt;
  DateTime? startAt2;
  int? elapsed;
  String? startAtWithIS;
  DateTime? startAtWithTimezone;
  int? timeElapsed;
  int? timeElapsedLabel;
  bool? isLive;
  int? orderIsLive;
  bool? isFinished;
  bool? isFavorite;

  factory StatisticsModel.fromJson(Map<String, dynamic> json) =>
      StatisticsModel(
        id: json['id'],
        homeTeamId: json['home_team_id'],
        homeTeam:
            json['home_team'] == null ? null : Team.fromJson(json['home_team']),
        awayTeamId: json['away_team_id'],
        awayTeam:
            json['away_team'] == null ? null : Team.fromJson(json['away_team']),
        homeScore: json['home_score'],
        awayScore: json['away_score'],
        statistics: json['statistics'] == null
            ? null
            : (json['statistics'] as List<dynamic>)
                .map((dynamic json) =>
                    Stats.fromJson(json as Map<String, dynamic>))
                .toList(),
        matchType: json['match_type'],
        status: json['status'],
        statusValue: json['status_value'],
        timezone: json['timezone'],
        date: json['date'],
        time: json['time'],
        startAtTimeNewLabelV2: json['start_at_time_new_label_v2'],
        startAt:
            json['start_at'] == null ? null : DateTime.parse(json['start_at']),
        startAt2: json['start_at2'] == null
            ? null
            : DateTime.parse(json['start_at2']),
        elapsed: json['elapsed'],
        startAtWithIS: json['start_at_with_i_s'],
        startAtWithTimezone: DateTime.parse(json['start_at_with_timezone']),
        timeElapsed: json['time_elapsed'],
        timeElapsedLabel: json['time_elapsed_label'],
        isLive: json['is_live'],
        orderIsLive: json['order_is_live'],
        isFinished: json['is_finished'],
        isFavorite: json['is_favorite'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'home_team_id': homeTeamId,
        'home_team': homeTeam?.toJson(),
        'away_team_id': awayTeamId,
        'away_team': awayTeam?.toJson(),
        'home_score': homeScore,
        'away_score': awayScore,
        'statistics': List<dynamic>.from(statistics!.map((x) => x.toJson())),
        'match_type': matchType,
        'status': status,
        'status_value': statusValue,
        'timezone': timezone,
        'date': date,
        'time': time,
        'start_at_time_new_label_v2': startAtTimeNewLabelV2,
        'start_at': startAt?.toIso8601String(),
        'start_at2': startAt2?.toIso8601String(),
        'elapsed': elapsed,
        'start_at_with_i_s': startAtWithIS,
        'start_at_with_timezone': startAtWithTimezone?.toIso8601String(),
        'time_elapsed': timeElapsed,
        'time_elapsed_label': timeElapsedLabel,
        'is_live': isLive,
        'order_is_live': orderIsLive,
        'is_finished': isFinished,
        'is_favorite': isFavorite,
      };
}
