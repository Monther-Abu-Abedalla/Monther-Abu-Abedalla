import 'package:taktikat/feature/model/models/match/general_matches_model.dart';

class GeneralFavorite {
  GeneralFavorite({
    this.matches = const [],
    this.championships = const [],
    this.teams = const [],
    this.players = const [],
    this.leagues = const [],
  });

  List<GeneralMatchesModel> matches;
  List<GeneralMatchesModel> championships;
  List<GeneralMatchesModel> teams;
  List<GeneralMatchesModel> players;
  List<GeneralMatchesModel> leagues;

  factory GeneralFavorite.fromJson(Map<String, dynamic> json) {
    return GeneralFavorite(
      players: json['players'] == null
          ? []
          : (json['players'] as List<dynamic>)
              .map((dynamic championship) => GeneralMatchesModel.fromJson(
                  championship as Map<String, dynamic>))
              .toList(),
      // todo avoid_dynamic_calls rule
      // List<GeneralMatchesModel>.from(
      //         json['players'].map(
      //           (x) => GeneralMatchesModel.fromJson(x),
      //         ),
      //       ),
      teams: json['teams'] == null
          ? []
          : (json['teams'] as List<dynamic>)
              .map((dynamic championship) => GeneralMatchesModel.fromJson(
                  championship as Map<String, dynamic>))
              .toList(),
      leagues: json['leagues'] == null
          ? []
          : (json['leagues'] as List<dynamic>)
              .map((dynamic championship) => GeneralMatchesModel.fromJson(
                  championship as Map<String, dynamic>))
              .toList(),
      championships: json['championships'] == null
          ? []
          : (json['championships'] as List<dynamic>)
              .map((dynamic championship) => GeneralMatchesModel.fromJson(
                  championship as Map<String, dynamic>))
              .toList(),
      matches: json['matches'] == null
          ? []
          : (json['matches'] as List<dynamic>)
              .map((dynamic championship) => GeneralMatchesModel.fromJson(
                  championship as Map<String, dynamic>))
              .toList(),
    );
  }
}
