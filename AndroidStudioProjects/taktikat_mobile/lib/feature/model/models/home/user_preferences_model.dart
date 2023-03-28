class Preferences {
  Preferences({
    required this.lists,
    required this.results,
  });

  Lists? lists;
  int? results;

  factory Preferences.fromJson(Map<String, dynamic> json) => Preferences(
        lists: Lists.fromJson(json['lists']),
        results: json['results'],
      );

  Map<String, dynamic> toJson() => {
        'lists': lists?.toJson(),
        'results': results,
      };
}

class Lists {
  Lists({
    required this.teams,
    required this.nationalTeams,
    required this.allPlayers,
    required this.topPlayers,
    required this.championships,
    required this.leagues,
  });

  List<PreferencesItemModel>? teams;
  List<PreferencesItemModel>? nationalTeams;
  List<PreferencesItemModel>? allPlayers;
  List<PreferencesItemModel>? topPlayers;
  List<PreferencesItemModel>? championships;
  List<PreferencesItemModel>? leagues;

  factory Lists.fromJson(Map<String, dynamic> json) => Lists(
        teams: json['teams'] == null
            ? null
            : (json['teams'] as List<dynamic>)
                .map((dynamic teams) => PreferencesItemModel.fromJson(
                    teams as Map<String, dynamic>))
                .toList(),
        nationalTeams: json['national_teams'] == null
            ? null
            : (json['national_teams'] as List<dynamic>)
                .map((dynamic nationalTeams) => PreferencesItemModel.fromJson(
                    nationalTeams as Map<String, dynamic>))
                .toList(),
        allPlayers: json['all_players'] == null
            ? null
            : (json['all_players'] as List<dynamic>)
                .map((dynamic json) =>
                    PreferencesItemModel.fromJson(json as Map<String, dynamic>))
                .toList(),
        topPlayers: json['top_players'] == null
            ? null
            : (json['top_players'] as List<dynamic>)
                .map((dynamic json) =>
                    PreferencesItemModel.fromJson(json as Map<String, dynamic>))
                .toList(),
        championships: json['championships'] == null
            ? null
            : (json['championships'] as List<dynamic>)
                .map((dynamic json) =>
                    PreferencesItemModel.fromJson(json as Map<String, dynamic>))
                .toList(),
        leagues: json['leagues'] == null
            ? null
            : (json['leagues'] as List<dynamic>)
                .map((dynamic json) =>
                    PreferencesItemModel.fromJson(json as Map<String, dynamic>))
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        'teams': List<dynamic>.from(teams!.map((x) => x.toJson())),
        'national_teams':
            List<dynamic>.from(nationalTeams!.map((x) => x.toJson())),
        'all_players': List<dynamic>.from(allPlayers!.map((x) => x.toJson())),
        'top_players': List<dynamic>.from(topPlayers!.map((x) => x.toJson())),
        'championships':
            List<dynamic>.from(championships!.map((x) => x.toJson())),
        'leagues': List<dynamic>.from(leagues!.map((x) => x.toJson())),
      };
}

class PreferencesItemModel {
  PreferencesItemModel({
    this.id,
    this.title,
    this.image,
  });

  int? id;
  String? title;
  String? image;

  factory PreferencesItemModel.fromJson(Map<String, dynamic> json) =>
      PreferencesItemModel(
        id: json['id'],
        title: json['title'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
      };
}
