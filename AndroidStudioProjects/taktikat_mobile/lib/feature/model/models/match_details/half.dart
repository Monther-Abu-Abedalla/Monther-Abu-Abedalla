import 'package:taktikat/feature/model/models/match_details/player.dart';

import '../../shared_models.dart';

class Half {
  Half({
    required this.id,
    this.generationUniqueKey,
    this.matchId,
    this.isHomeTeam,
    this.isAwayTeam,
    this.teamId,
    this.team,
    this.playerId,
    this.player,
    this.assistPlayerId,
    this.assistPlayer,
    this.originalMinutes,
    this.extraMinutes,
    this.totalMinutes,
    this.description,
    this.type,
    this.icon,
    this.event,
  });

  int id;
  String? generationUniqueKey;
  int? matchId;
  bool? isAwayTeam;
  bool? isHomeTeam;
  int? teamId;
  Team? team;
  int? playerId;
  Player? player;
  int? assistPlayerId;
  Player? assistPlayer;
  int? originalMinutes;
  int? extraMinutes;
  int? totalMinutes;
  String? description;
  String? type;
  String? icon;
  String? event;

  factory Half.fromJson(Map<String, dynamic> json) => Half(
        id: json['id'],
        generationUniqueKey: json['generation_unique_key'],
        matchId: json['match_id'],
        isHomeTeam: json['is_home_team'],
        isAwayTeam: json['is_away_team'],
        teamId: json['team_id'],
        team: json['team'] == null ? null : Team.fromJson(json['team']),
        playerId: json['player_id'],
        player: json['player'] == null ? null : Player.fromJson(json['player']),
        assistPlayerId: json['assist_player_id'],
        assistPlayer: json['assist_player'] == null
            ? null
            : Player.fromJson(json['assist_player']),
        originalMinutes: json['original_minutes'],
        extraMinutes: json['extra_minutes'],
        totalMinutes: json['total_minutes'],
        description: json['description'],
        type: json['type'],
        icon: json['icon'],
        event: json['event'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'generation_unique_key': generationUniqueKey,
        'match_id': matchId,
        'is_home_team': isHomeTeam,
        'is_away_team': isAwayTeam,
        'team_id': teamId,
        'team': team?.toJson(),
        'player_id': playerId,
        'player': player?.toJson(),
        'assist_player_id': assistPlayerId,
        'assist_player': assistPlayer,
        'original_minutes': originalMinutes,
        'extra_minutes': extraMinutes,
        'total_minutes': totalMinutes,
        'description': description,
        'type': type,
        'icon': icon,
        'event': event,
      };
}
