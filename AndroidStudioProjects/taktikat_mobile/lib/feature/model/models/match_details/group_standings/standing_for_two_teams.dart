import 'package:taktikat/feature/model/shared_models.dart';

import '../group_standing.dart';

class StandingsForTwoTeams {
  //create constructor
  StandingsForTwoTeams({
    this.standings = const [],
    this.league,
  });

  List<Standing> standings;
  League? league;

  factory StandingsForTwoTeams.fromJson(Map<String, dynamic> json) {
    return StandingsForTwoTeams(
      standings: json['standings'] == null
          ? []
          : (json['standings'] as List<dynamic>)
              .map((dynamic json) =>
                  Standing.fromJson(json as Map<String, dynamic>))
              .toList(),
      league: json['league'] == null ? null : League.fromJson(json['league']),
    );
  }
}
