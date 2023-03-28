import 'package:taktikat/feature/model/models/match_details/lineup/team_element.dart';

import '../../../shared_models.dart';
import '../player.dart';

class FluffyExtraData {
  FluffyExtraData({
    required this.id,
    required this.playerId,
    required this.matchId,
    required this.teamId,
    required this.position,
    required this.minutesPlayed,
    required this.captain,
    this.offsides,
    required this.shots,
    required this.goals,
    this.eventId,
    this.updateAt,
    required this.passes,
    required this.tackles,
    required this.duels,
    required this.dribbles,
    required this.fouls,
    required this.cards,
    required this.penalty,
    required this.integrationAttributes,
    required this.createdAt,
    required this.updatedAt,
    required this.games,
    this.player,
    this.team,
  });

  int? id;
  int? playerId;
  int? matchId;
  int? teamId;
  String? position;
  String? minutesPlayed;
  String? captain;
  int? offsides;
  Shots? shots;
  Goals? goals;
  dynamic eventId;
  dynamic updateAt;
  Passes? passes;
  Tackles? tackles;
  Duels? duels;
  Dribbles? dribbles;
  Fouls? fouls;
  Cards? cards;
  Penalty? penalty;
  int? integrationAttributes;
  DateTime? createdAt;
  DateTime? updatedAt;
  Games? games;
  Player? player;
  TeamElement? team;

  factory FluffyExtraData.fromJson(Map<String, dynamic> json) =>
      FluffyExtraData(
        id: json['id'],
        playerId: json['player_id'],
        matchId: json['match_id'],
        teamId: json['team_id'],
        position: json['position'],
        minutesPlayed: json['minutes_played'],
        captain: json['captain'],
        offsides: json['offsides'],
        shots: json['shots'] == null ? null : Shots.fromJson(json['shots']),
        goals: json['goals'] == null ? null : Goals.fromJson(json['goals']),
        eventId: json['event_id'],
        updateAt: json['updateAt'],
        passes: json['passes'] == null ? null : Passes.fromJson(json['passes']),
        tackles:
            json['tackles'] == null ? null : Tackles.fromJson(json['tackles']),
        duels: json['duels'] == null ? null : Duels.fromJson(json['duels']),
        dribbles: json['dribbles'] == null
            ? null
            : Dribbles.fromJson(json['dribbles']),
        fouls: json['fouls'] == null ? null : Fouls.fromJson(json['fouls']),
        cards: json['cards'] == null ? null : Cards.fromJson(json['cards']),
        penalty:
            json['penalty'] == null ? null : Penalty.fromJson(json['penalty']),
        integrationAttributes: json['integration_attributes'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        games: json['games'] == null ? null : Games.fromJson(json['games']),
        player: json['player'] == null ? null : Player.fromJson(json['player']),
        team: json['team'] == null ? null : TeamElement.fromJson(json['team']),
      );
}
