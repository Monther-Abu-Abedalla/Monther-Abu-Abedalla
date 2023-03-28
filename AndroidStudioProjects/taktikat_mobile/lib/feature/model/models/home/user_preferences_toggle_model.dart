import '../profile/profile_preference.dart';

class UserPreferencesToggle {
  UserPreferencesToggle({
    required this.event,
    required this.customerPreferences,
  });

  Event? event;
  CustomerPreferencesTypes? customerPreferences;

  factory UserPreferencesToggle.fromJson(Map<String, dynamic> json) =>
      UserPreferencesToggle(
        event: json['event'] == null ? null : Event.fromJson(json['event']),
        customerPreferences: json['customerPreferences'] != null &&
                json['customerPreferences'] is Map<String, dynamic>
            ? CustomerPreferencesTypes.fromJson(json['customerPreferences'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'event': event?.toJson(),
        'customerPreferences': event?.toJson(),
      };
}

class CustomerPreferencesTypes {
  CustomerPreferencesTypes({
    required this.team,
    required this.nationalTeam,
    required this.championship,
    required this.league,
    required this.player,
  });

  List<ProfilePreference>? team;
  List<ProfilePreference>? nationalTeam;
  List<ProfilePreference>? championship;
  List<ProfilePreference>? league;
  List<ProfilePreference>? player;

  factory CustomerPreferencesTypes.fromJson(Map<String, dynamic> json) =>
      CustomerPreferencesTypes(
        team: json['team'] == null
            ? null
            : (json['team'] as List<dynamic>)
                .map((dynamic json) =>
                    ProfilePreference.fromJson(json as Map<String, dynamic>))
                .toList(),
        nationalTeam: json['national_team'] == null
            ? null
            : (json['national_team'] as List<dynamic>)
                .map((dynamic json) =>
                    ProfilePreference.fromJson(json as Map<String, dynamic>))
                .toList(),
        championship: json['championship'] == null
            ? null
            : (json['championship'] as List<dynamic>)
                .map((dynamic json) =>
                    ProfilePreference.fromJson(json as Map<String, dynamic>))
                .toList(),
        league: json['league'] == null
            ? null
            : (json['league'] as List<dynamic>)
                .map((dynamic json) =>
                    ProfilePreference.fromJson(json as Map<String, dynamic>))
                .toList(),
        player: json['player'] == null
            ? null
            : (json['player'] as List<dynamic>)
                .map((dynamic json) =>
                    ProfilePreference.fromJson(json as Map<String, dynamic>))
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        'team': team == null
            ? null
            : List<dynamic>.from(team!.map((x) => x.toJson())),
        'national_team': nationalTeam == null
            ? null
            : List<dynamic>.from(nationalTeam!.map((x) => x.toJson())),
        'championship': championship == null
            ? null
            : List<dynamic>.from(championship!.map((x) => x.toJson())),
        'league': league == null
            ? null
            : List<dynamic>.from(league!.map((x) => x.toJson())),
        'player': player == null
            ? null
            : List<dynamic>.from(player!.map((x) => x.toJson())),
      };
}

class Event {
  Event({
    required this.event,
  });

  String? event;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        event: json['event'],
      );

  Map<String, dynamic> toJson() => {
        'event': event,
      };
}
