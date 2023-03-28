import '../../../shared_models.dart';
import 'coach.dart';

class TopPlayerTeam {
  TopPlayerTeam({
    required this.id,
    required this.name,
    required this.nameValues,
    required this.logo,
    this.homeColor,
    this.awayColor,
    this.coach,
  });

  int? id;
  String? name;
  NameValues? nameValues;
  String? logo;
  String? homeColor;
  String? awayColor;
  Coach? coach;

  factory TopPlayerTeam.fromJson(Map<String, dynamic> json) => TopPlayerTeam(
        id: json['id'],
        name: json['name'],
        nameValues: json['name_values'] == null
            ? null
            : NameValues.fromJson(json['name_values']),
        logo: json['logo'],
        homeColor: json['home_color'],
        awayColor: json['away_color'],
        coach: json['coach'] == null ? null : Coach.fromJson(json['coach']),
      );
}
