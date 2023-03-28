import 'bench.dart';

class Injury {
  Injury({
    required this.id,
    required this.playerId,
    required this.player,
    required this.matchId,
    required this.type,
    required this.reason,
    required this.createdAt,
  });

  int? id;
  int? playerId;
  Bench? player;
  int? matchId;
  String? type;
  String? reason;
  DateTime? createdAt;

  factory Injury.fromJson(Map<String, dynamic> json) => Injury(
        id: json['id'],
        playerId: json['player_id'],
        player: json['player'] == null ? null : Bench.fromJson(json['player']),
        matchId: json['match_id'],
        type: json['type'],
        reason: json['reason'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
      );
}
