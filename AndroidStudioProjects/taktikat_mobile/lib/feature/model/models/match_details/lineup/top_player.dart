import 'package:taktikat/feature/model/models/match_details/lineup/top_player_team.dart';

import 'bench.dart';

class TopPlayer {
  TopPlayer({
    required this.id,
    required this.matchId,
    required this.playerId,
    required this.playerNumber,
    required this.rating,
    required this.isCaptain,
    required this.substitute,
    required this.position,
    required this.minutesPlayed,
    this.goals,
    this.assists,
    required this.accuracyPasses,
    required this.concededGoals,
    this.totalShots,
    this.totalShotsOn,
    this.tacklesInterceptions,
    this.blocks,
    this.duelsWon,
    this.duelsTotal,
    this.wasFouled,
    this.foulsCommitted,
    this.dribblesAttempts,
    this.dribblesPast,
    this.dribblesSuccess,
    this.penaltyWon,
    this.penaltyCommited,
    required this.penaltyScored,
    required this.penaltyMissed,
    this.player,
    this.team,
  });

  int? id;
  int? matchId;
  int? playerId;
  int? playerNumber;
  num? rating;
  bool? isCaptain;
  bool? substitute;
  String? position;
  String? minutesPlayed;
  int? goals;
  int? assists;
  String? accuracyPasses;
  int? concededGoals;
  int? totalShots;
  int? totalShotsOn;
  int? tacklesInterceptions;
  int? blocks;
  int? duelsWon;
  int? duelsTotal;
  int? wasFouled;
  int? foulsCommitted;
  int? dribblesAttempts;
  int? dribblesPast;
  int? dribblesSuccess;
  dynamic penaltyWon;
  dynamic penaltyCommited;
  int? penaltyScored;
  int? penaltyMissed;
  Bench? player;
  TopPlayerTeam? team;

  factory TopPlayer.fromJson(Map<String, dynamic> json) => TopPlayer(
        id: json['id'],
        matchId: json['match_id'],
        playerId: json['player_id'],
        playerNumber: json['player_number'],
        rating: json['rating'],
        isCaptain: json['is_captain'],
        substitute: json['substitute'],
        position: json['position'],
        minutesPlayed: json['minutes_played'],
        goals: json['goals'],
        assists: json['assists'],
        accuracyPasses: json['accuracy_passes'],
        concededGoals: json['conceded_goals'],
        totalShots: json['total_shots'],
        totalShotsOn: json['total_shots_on'],
        tacklesInterceptions: json['tackles_interceptions'],
        blocks: json['blocks'],
        duelsWon: json['duels_won'],
        duelsTotal: json['duels_total'],
        wasFouled: json['was_fouled'],
        foulsCommitted: json['fouls_committed'],
        dribblesAttempts: json['dribbles_attempts'],
        dribblesPast: json['dribbles_past'],
        dribblesSuccess: json['dribbles_success'],
        penaltyWon: json['penalty_won'],
        penaltyCommited: json['penalty_commited'],
        penaltyScored: json['penalty_scored'],
        penaltyMissed: json['penalty_missed'],
        player: json['player'] == null ? null : Bench.fromJson(json['player']),
        team:
            json['team'] == null ? null : TopPlayerTeam.fromJson(json['team']),
      );
}
