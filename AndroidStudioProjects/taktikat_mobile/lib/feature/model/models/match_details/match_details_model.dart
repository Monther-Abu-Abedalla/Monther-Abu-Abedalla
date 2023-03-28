import '../../shared_models.dart';

class MatchDetails {
  MatchDetails({
    required this.id,
    required this.homeTeamId,
    required this.homeTeam,
    required this.awayTeamId,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
    required this.homePlayersGoals,
    required this.awayPlayersGoals,
    required this.league,
    required this.referee,
    required this.stadium,
    required this.statistics,
    required this.matchType,
    required this.matchTypeValue,
    required this.status,
    required this.statusValue,
    required this.timezone,
    required this.date,
    required this.time,
    required this.startAtTimeNewLabelV2,
    required this.startAt,
    required this.startAt2,
    required this.elapsed,
    required this.startAtWithTimezone,
    required this.timeElapsed,
    required this.timeElapsedLabel,
    required this.isLive,
    required this.isFinished,
    required this.isFavorite,
    required this.isExpected,
    // required this.expectationsCompetition,
    this.favoriteTeam,
    required this.competitionResults,
    this.hasCompetition,
    this.isCompetitionFinished,
  });

  int? id;
  int? homeTeamId;
  Team? homeTeam;
  int? awayTeamId;
  Team? awayTeam;
  String? homeScore;
  String? awayScore;
  List<PlayersGoal>? homePlayersGoals;
  List<PlayersGoal>? awayPlayersGoals;
  League? league;
  Referee? referee;
  Stadium? stadium;
  List<Stats>? statistics;
  String? matchType;
  String? matchTypeValue;
  String? status;
  String? statusValue;
  String? timezone;
  String? date;
  String? time;
  String? startAtTimeNewLabelV2;
  DateTime? startAt;
  DateTime? startAt2;
  int? elapsed;
  DateTime? startAtWithTimezone;
  int? timeElapsed;
  int? timeElapsedLabel;
  bool? isLive;
  bool? isFinished;
  bool? isFavorite;
  bool? isExpected;
  bool? hasCompetition;
  bool? isCompetitionFinished;
  // List<dynamic>? expectationsCompetition;
  dynamic favoriteTeam;
  CompetitionResultsDetails? competitionResults;

  factory MatchDetails.fromJson(Map<String, dynamic> json) => MatchDetails(
        id: json['id'],
        homeTeamId: json['home_team_id'],
        homeTeam:
            json['home_team'] == null ? null : Team.fromJson(json['home_team']),
        awayTeamId: json['away_team_id'],
        awayTeam:
            json['away_team'] == null ? null : Team.fromJson(json['away_team']),
        homeScore: json['home_score'],
        awayScore: json['away_score'],
        homePlayersGoals: json['home_players_goals'] == []
            ? null
            : (json['home_players_goals'] as List<dynamic>)
                .map((dynamic json) =>
                    PlayersGoal.fromJson(json as Map<String, dynamic>))
                .toList(),
        awayPlayersGoals: json['away_players_goals'] == null
            ? null
            : (json['away_players_goals'] as List<dynamic>)
                .map((dynamic json) =>
                    PlayersGoal.fromJson(json as Map<String, dynamic>))
                .toList(),
        league: json['league'] == null ? null : League.fromJson(json['league']),
        referee:
            json['referee'] == null ? null : Referee.fromJson(json['referee']),
        stadium:
            json['stadium'] == null ? null : Stadium.fromJson(json['stadium']),
        statistics: json['statistics'] == null
            ? null
            : (json['statistics'] as List<dynamic>)
                .map((dynamic json) =>
                    Stats.fromJson(json as Map<String, dynamic>))
                .toList(),
        matchType: json['match_type'],
        matchTypeValue: json['match_type_value'],
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
        startAtWithTimezone: json['start_at_with_timezone'] == null
            ? null
            : DateTime.parse(json['start_at_with_timezone']),
        timeElapsed: json['time_elapsed'],
        timeElapsedLabel: json['time_elapsed_label'],
        isLive: json['is_live'],
        isFinished: json['is_finished'],
        isFavorite: json['is_favorite'],
        isExpected: json['is_expected'],
        // expectationsCompetition: json['expectationsCompetition'] == null
        //  ? null
        //  : List<dynamic>.from(json['expectationsCompetition'].map((x) => x)),
        favoriteTeam: json['favorite_team'],
        hasCompetition: json['has_competition'],
        isCompetitionFinished: json['is_competition_finished'],
        competitionResults: json['competition_results'] == null
            ? null
            : CompetitionResultsDetails.fromJson(json['competition_results']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'home_team_id': homeTeamId,
        'home_team': homeTeam?.toJson(),
        'away_team_id': awayTeamId,
        'away_team': awayTeam?.toJson(),
        'home_score': homeScore,
        'away_score': awayScore,
        'home_players_goals':
            List<dynamic>.from(homePlayersGoals!.map((x) => x.toJson())),
        'away_players_goals':
            List<dynamic>.from(awayPlayersGoals!.map((x) => x.toJson())),
        'league': league?.toJson(),
        'referee': referee?.toJson(),
        'stadium': stadium?.toJson(),
        'statistics': List<dynamic>.from(statistics!.map((x) => x)),
        'match_type': matchType,
        'match_type_value': matchTypeValue,
        'status': status,
        'status_value': statusValue,
        'timezone': timezone,
        'date': date,
        'time': time,
        'start_at_time_new_label_v2': startAtTimeNewLabelV2,
        'start_at': startAt?.toIso8601String(),
        'start_at2': startAt2?.toIso8601String(),
        'elapsed': elapsed,
        'has_competition': hasCompetition,
        'is_competition_finished': isCompetitionFinished,
        'start_at_with_timezone': startAtWithTimezone?.toIso8601String(),
        'time_elapsed': timeElapsed,
        'time_elapsed_label': timeElapsedLabel,
        'is_live': isLive,
        'is_finished': isFinished,
        'is_favorite': isFavorite,
        'is_expected': isExpected,
        // 'expectationsCompetition':
        //     List<dynamic>.from(expectationsCompetition!.map((x) => x)),
        'favorite_team': favoriteTeam,
        'competition_results': competitionResults?.toJson(),
      };
}

class PlayersGoal {
  PlayersGoal({
    required this.name,
    required this.minutes,
  });

  String? name;
  List<int>? minutes;

  factory PlayersGoal.fromJson(Map<String, dynamic> json) => PlayersGoal(
        name: json['name'],
        minutes: json['minutes'] == null
            ? null
            : (json['minutes'] as List<dynamic>)
                .map((dynamic json) => json as int)
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'minutes': List<dynamic>.from(minutes!.map((x) => x)),
      };
}

class CompetitionResultsDetails {
  CompetitionResultsDetails({
    required this.total,
    required this.homeVotedRate,
    required this.awayVotedRate,
    required this.drawVotedRate,
  });

  int? total;
  VotedRate? homeVotedRate;
  VotedRate? awayVotedRate;
  VotedRate? drawVotedRate;

  factory CompetitionResultsDetails.fromJson(Map<String, dynamic> json) =>
      CompetitionResultsDetails(
        total: json['total'],
        homeVotedRate: json['home_voted_rate'] == null
            ? null
            : VotedRate.fromJson(json['home_voted_rate']),
        awayVotedRate: json['away_voted_rate'] == null
            ? null
            : VotedRate.fromJson(json['away_voted_rate']),
        drawVotedRate: json['draw_voted_rate'] == null
            ? null
            : VotedRate.fromJson(json['draw_voted_rate']),
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'home_voted_rate': homeVotedRate?.toJson(),
        'away_voted_rate': awayVotedRate?.toJson(),
        'draw_voted_rate': drawVotedRate?.toJson(),
      };
}

class Referee {
  Referee({
    required this.id,
    required this.name,
    this.avatar,
  });

  int? id;
  String? name;
  dynamic avatar;

  factory Referee.fromJson(Map<String, dynamic> json) => Referee(
        id: json['id'],
        name: json['name'],
        avatar: json['avatar'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'avatar': avatar,
      };
}

class Stadium {
  Stadium({
    required this.id,
    required this.title,
    required this.description,
    required this.titleValue,
    required this.descriptionValue,
    this.yearCreation,
    required this.isClosed,
    required this.numberOfSeats,
    this.width,
    this.luminousPower,
    this.length,
    this.latitude,
    this.longitude,
    this.image,
  });

  int? id;
  String? title;
  String? description;
  NameValues? titleValue;
  NameValues? descriptionValue;
  dynamic yearCreation;
  int? isClosed;
  int? numberOfSeats;
  dynamic width;
  dynamic luminousPower;
  dynamic length;
  dynamic latitude;
  dynamic longitude;
  dynamic image;

  factory Stadium.fromJson(Map<String, dynamic> json) => Stadium(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        titleValue: json['title_value'] == null
            ? null
            : NameValues.fromJson(json['title_value']),
        descriptionValue: json['description_value'] == null
            ? null
            : NameValues.fromJson(json['description_value']),
        yearCreation: json['year_creation'],
        isClosed: json['is_closed'],
        numberOfSeats: json['number_of_seats'],
        width: json['width'],
        luminousPower: json['luminous_power'],
        length: json['length'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'title_value': titleValue?.toJson(),
        'description_value': descriptionValue?.toJson(),
        'year_creation': yearCreation,
        'is_closed': isClosed,
        'number_of_seats': numberOfSeats,
        'width': width,
        'luminous_power': luminousPower,
        'length': length,
        'latitude': latitude,
        'longitude': longitude,
        'image': image,
      };
}
