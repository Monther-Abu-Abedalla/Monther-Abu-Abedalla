import '../../../shared_models.dart';

class PurpleExtraData {
  PurpleExtraData({
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
  });

  int? id;
  int? playerId;
  int? matchId;
  int? teamId;
  String? position;
  String minutesPlayed;
  String captain;
  int? offsides;
  Shots shots;
  Goals goals;
  dynamic eventId;
  dynamic updateAt;
  Passes passes;
  Tackles tackles;
  Duels duels;
  Dribbles dribbles;
  Fouls fouls;
  Cards cards;
  Penalty penalty;
  int integrationAttributes;
  DateTime createdAt;
  DateTime updatedAt;
  Games games;

  factory PurpleExtraData.fromJson(Map<String, dynamic> json) =>
      PurpleExtraData(
        id: json['id'],
        playerId: json['player_id'],
        matchId: json['match_id'],
        teamId: json['team_id'],
        position: json['position'],
        minutesPlayed: json['minutes_played'],
        captain: json['captain'],
        offsides: json['offsides'],
        shots: Shots.fromJson(json['shots']),
        goals: Goals.fromJson(json['goals']),
        eventId: json['event_id'],
        updateAt: json['updateAt'],
        passes: Passes.fromJson(json['passes']),
        tackles: Tackles.fromJson(json['tackles']),
        duels: Duels.fromJson(json['duels']),
        dribbles: Dribbles.fromJson(json['dribbles']),
        fouls: Fouls.fromJson(json['fouls']),
        cards: Cards.fromJson(json['cards']),
        penalty: Penalty.fromJson(json['penalty']),
        integrationAttributes: json['integration_attributes'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        games: Games.fromJson(json['games']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'player_id': playerId,
        'match_id': matchId,
        'team_id': teamId,
        'position': position,
        'minutes_played': minutesPlayed,
        'captain': captain,
        'offsides': offsides,
        'shots': shots.toJson(),
        'goals': goals.toJson(),
        'event_id': eventId,
        'updateAt': updateAt,
        'passes': passes.toJson(),
        'tackles': tackles.toJson(),
        'duels': duels.toJson(),
        'dribbles': dribbles.toJson(),
        'fouls': fouls.toJson(),
        'cards': cards.toJson(),
        'penalty': penalty.toJson(),
        'integration_attributes': integrationAttributes,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'games': games.toJson(),
      };
}
