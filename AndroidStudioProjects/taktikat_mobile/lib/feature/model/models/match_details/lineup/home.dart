import 'package:taktikat/feature/model/models/match_details/lineup/top_player_team.dart';

import 'bench.dart';
import 'home_lineup.dart';
import 'injury.dart';

class Home {
  Home({
    required this.team,
    this.lineup = const [],
    this.bench = const [],
    this.injuries = const [],
    required this.formation,
  });

  TopPlayerTeam? team;
  List<HomeLineup> lineup;
  List<Bench>? bench;
  List<Injury>? injuries;
  String? formation;

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        team:
            json['team'] == null ? null : TopPlayerTeam.fromJson(json['team']),
        lineup: json['lineup'] == null
            ? []
            : (json['lineup'] as List<dynamic>)
                .map((dynamic json) =>
                    HomeLineup.fromJson(json as Map<String, dynamic>))
                .toList(),
        bench: json['bench'] == null
            ? []
            : (json['bench'] as List<dynamic>)
                .map((dynamic json) =>
                    Bench.fromJson(json as Map<String, dynamic>))
                .toList(),
        injuries: json['injuries'] == null
            ? []
            : (json['injuries'] as List<dynamic>)
                .map((dynamic json) =>
                    Injury.fromJson(json as Map<String, dynamic>))
                .toList(),
        formation: json['formation'],
      );
}
