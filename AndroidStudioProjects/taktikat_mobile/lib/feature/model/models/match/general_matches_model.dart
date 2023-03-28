import '../../shared_models.dart';
import 'match_model.dart';

class GeneralMatchesModel {
  GeneralMatchesModel({
    required this.leagueTitle,
    required this.leagueValues,
    required this.leagueId,
    required this.leagueImage,
    required this.matches,
    // required this.type,
    // required this.leagueTitleValue,
  });

  String? leagueTitle;
  LeagueValues? leagueValues;
  int? leagueId;
  String? leagueImage;
  List<Matches>? matches;
  // String? type;
  // LeagueTitleValue? leagueTitleValue;

  factory GeneralMatchesModel.fromJson(Map<String, dynamic> json) =>
      GeneralMatchesModel(
        leagueTitle: json['league'],
        leagueValues: json['league_values'] == null
            ? null
            : LeagueValues.fromJson(json['league_values']),
        leagueId: json['league_id'],
        leagueImage: json['league_image'],
        matches: json['matches'] == null
            ? null
            : (json['matches'] as List<dynamic>)
                .map((dynamic json) =>
                    Matches.fromJson(json as Map<String, dynamic>))
                .toList(),

        // type: json['type'],
        // leagueTitleValue: json['league_title_value'] == null
        //     ? null
        //     : LeagueTitleValue.fromJson(json['league_title_value']),
      );

  Map<String, dynamic> toJson() => {
        'league_title': leagueTitle,
        'league_id': leagueId,
        'league_image': leagueImage,
        'matches': List<dynamic>.from(matches!.map((x) => x.toJson())),
        // 'league_title_value': leagueTitleValue?.toJson(),
        // 'type': type,
      };
}

class LeagueValues {
  LeagueValues({
    required this.nameValues,
    this.preferenceType,
  });

  NameValues? nameValues;
  int? preferenceType;

  factory LeagueValues.fromJson(Map<String, dynamic> json) => LeagueValues(
        preferenceType: json['preference_type'],
        nameValues: json['name_values'] == null
            ? null
            : NameValues.fromJson(json['name_values']),
      );

  Map<String, dynamic> toJson() => {
        'name_values': nameValues?.toJson(),
      };
}

class LeagueTitleValue {
  LeagueTitleValue({
    required this.ar,
    required this.en,
  });

  String? ar;
  String? en;

  factory LeagueTitleValue.fromJson(Map<String, dynamic> json) =>
      LeagueTitleValue(
        ar: json['ar'],
        en: json['en'],
      );

  Map<String, dynamic> toJson() => {
        'ar': ar,
        'en': en,
      };
}
