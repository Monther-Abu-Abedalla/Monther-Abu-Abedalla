import 'package:taktikat/feature/model/models/match_details/lineup/top_player.dart';

import 'bench.dart';
import 'fluffy_extra_data.dart';
import 'lineup_lineup.dart';

class HomeLineup {
  HomeLineup({
    required this.player,
    required this.playerMatchStatistics,
    required this.lineup,
    required this.extraData,
  });

  Bench? player;
  TopPlayer? playerMatchStatistics;
  LineupLineup? lineup;
  FluffyExtraData? extraData;

  factory HomeLineup.fromJson(Map<String, dynamic> json) => HomeLineup(
        player: json['player'] == null ? null : Bench.fromJson(json['player']),
        playerMatchStatistics: json['player_match_statistics'] == null
            ? null
            : TopPlayer.fromJson(json['player_match_statistics']),
        lineup: json['lineup'] == null
            ? null
            : LineupLineup.fromJson(json['lineup']),
        extraData: json['extra_data'] == null
            ? null
            : FluffyExtraData.fromJson(json['extra_data']),
      );
}
