import '../../shared_models.dart';

class GroupStanding {
  GroupStanding({
    required this.league,
    required this.round,
    this.standings = const [],
  });

  League? league;
  Round? round;
  List<Standing>? standings;

  factory GroupStanding.fromJson(Map<String, dynamic> json) => GroupStanding(
        league:
            json['standings'] == null ? null : League.fromJson(json['league']),
        round: json['standings'] == null ? null : Round.fromJson(json['round']),
        standings: json['standings'] == null
            ? null
            : (json['standings'] as List<dynamic>)
                .map((dynamic json) =>
                    Standing.fromJson(json as Map<String, dynamic>))
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        'league': league?.toJson(),
        'round': round?.toJson(),
        'standings': List<dynamic>.from(standings!.map((x) => x.toJson())),
      };
}

class Round {
  Round({
    required this.id,
    required this.name,
  });

  int? id;
  String? name;

  factory Round.fromJson(Map<String, dynamic> json) => Round(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class Standing {
  Standing({
    required this.id,
    required this.league,
    required this.team,
    required this.season,
    required this.rank,
    required this.points,
    required this.goalsDiff,
    required this.group,
    required this.form,
    required this.status,
    required this.description,
    required this.all,
    required this.home,
    required this.away,
  });

  int id;
  League league;
  Team team;
  Season season;
  int rank;
  int points;
  int goalsDiff;
  String group;
  String form;
  String status;
  String description;
  All all;
  All home;
  All away;

  factory Standing.fromJson(Map<String, dynamic> json) => Standing(
        id: json['id'],
        league: League.fromJson(json['league']),
        team: Team.fromJson(json['team']),
        season: Season.fromJson(json['season']),
        rank: json['rank'],
        points: json['points'],
        goalsDiff: json['goalsDiff'],
        group: json['group'],
        form: json['form'],
        status: json['status'],
        description: json['description'],
        all: All.fromJson(json['all']),
        home: All.fromJson(json['home']),
        away: All.fromJson(json['away']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'league': league.toJson(),
        'team': team.toJson(),
        'season': season.toJson(),
        'rank': rank,
        'points': points,
        'goalsDiff': goalsDiff,
        'group': group,
        'form': form,
        'status': status,
        'description': description,
        'all': all.toJson(),
        'home': home.toJson(),
        'away': away.toJson(),
      };
}

class All {
  All({
    required this.win,
    required this.draw,
    required this.lose,
    required this.goals,
    required this.played,
  });

  int win;
  int draw;
  int lose;
  Goals goals;
  int played;

  factory All.fromJson(Map<String, dynamic> json) => All(
        win: json['win'],
        draw: json['draw'],
        lose: json['lose'],
        goals: Goals.fromJson(json['goals']),
        played: json['played'],
      );

  Map<String, dynamic> toJson() => {
        'win': win,
        'draw': draw,
        'lose': lose,
        'goals': goals.toJson(),
        'played': played,
      };
}

class Goals {
  Goals({
    required this.goalsFor,
    required this.against,
  });

  int goalsFor;
  int against;

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        goalsFor: json['for'],
        against: json['against'],
      );

  Map<String, dynamic> toJson() => {
        'for': goalsFor,
        'against': against,
      };
}

class Season {
  Season({
    required this.id,
    required this.name,
  });

  int id;
  int name;

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class Team {
  Team({
    required this.id,
    required this.name,
    required this.nameValues,
    required this.logo,
    this.homeColor,
    this.awayColor,
  });

  int id;
  String name;
  NameValues nameValues;
  String logo;
  dynamic homeColor;
  dynamic awayColor;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json['id'],
        name: json['name'],
        nameValues: NameValues.fromJson(json['name_values']),
        logo: json['logo'],
        homeColor: json['home_color'],
        awayColor: json['away_color'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'name_values': nameValues.toJson(),
        'logo': logo,
        'home_color': homeColor,
        'away_color': awayColor,
      };
}
