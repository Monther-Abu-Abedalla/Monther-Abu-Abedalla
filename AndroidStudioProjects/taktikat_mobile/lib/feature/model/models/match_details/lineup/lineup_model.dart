import 'package:taktikat/feature/model/models/match_details/lineup/top_player.dart';

import 'home.dart';

class LineupModel {
  LineupModel({
    required this.topPlayer,
    required this.away,
    required this.home,
  });

  TopPlayer? topPlayer;
  Home? away;
  Home? home;

  factory LineupModel.fromJson(Map<String, dynamic> json) => LineupModel(
        topPlayer: json['top_player'] == null
            ? null
            : TopPlayer.fromJson(json['top_player']),
        away: json['away'] == null ? null : Home.fromJson(json['away']),
        home: json['home'] == null ? null : Home.fromJson(json['home']),
      );

}


