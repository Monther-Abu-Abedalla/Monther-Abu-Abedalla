import 'package:taktikat/feature/model/models/match_details/player.dart';

import '../../shared_models.dart';

class TopRated {
  TopRated({
    required this.homeTeam,
    required this.awayTeam,
  });

  Ratings? homeTeam;
  Ratings? awayTeam;

  factory TopRated.fromJson(Map<String, dynamic> json) => TopRated(
        homeTeam: json['home_team'] == null
            ? null
            : Ratings.fromJson(json['home_team']),
        awayTeam: json['home_team'] == null
            ? null
            : Ratings.fromJson(json['away_team']),
      );

  Map<String, dynamic> toJson() => {
        'home_team': homeTeam?.toJson(),
        'away_team': awayTeam?.toJson(),
      };
}

class Ratings {
  Ratings({
    required this.topScorer,
    required this.topAssist,
    required this.topRating,
  });

  Top? topScorer;
  Top? topAssist;
  Top? topRating;

  factory Ratings.fromJson(Map<String, dynamic> json) => Ratings(
        topScorer: json['top_scorer'] is List
            ? null
            : Top.fromJson(json['top_scorer']),
        topAssist: json['top_assist'] is List
            ? null
            : Top.fromJson(json['top_assist']),
        topRating: json['top_rating'] is List
            ? null
            : Top.fromJson(json['top_rating']),
      );

  Map<String, dynamic> toJson() => {
        'top_scorer': topScorer?.toJson(),
        'top_assist': topAssist?.toJson(),
        'top_rating': topRating?.toJson(),
      };
}

class Top {
  Top({
    required this.id,
    required this.playerId,
    required this.player,
    required this.numberOfGoals,
    required this.numberOfShots,
    required this.numberOfMatches,
    required this.assists,
    this.typeableId,
    required this.teamId,
    required this.team,
    required this.games,
    required this.substitutes,
    required this.shots,
    required this.goals,
    required this.passes,
    required this.tackles,
    required this.duels,
    required this.dribbles,
    required this.fouls,
    required this.cards,
    required this.penalty,
  });

  int? id;
  int? playerId;
  Player? player;
  int? numberOfGoals;
  int? numberOfShots;
  int? numberOfMatches;
  int? assists;
  dynamic typeableId;
  int? teamId;
  TeamClass? team;
  Games? games;
  Substitutes? substitutes;
  Shots? shots;
  Goals? goals;
  Passes? passes;
  Tackles? tackles;
  Duels? duels;
  Dribbles? dribbles;
  Fouls? fouls;
  Cards? cards;
  Penalty? penalty;

  factory Top.fromJson(Map<String, dynamic> json) => Top(
        id: json['id'],
        playerId: json['player_id'],
        player: json['player'] == null ? null : Player.fromJson(json['player']),
        numberOfGoals: json['number_of_goals'],
        numberOfShots: json['number_of_shots'],
        numberOfMatches: json['number_of_matches'],
        assists: json['assists'],
        typeableId: json['typeable_id'],
        teamId: json['team_id'],
        team: json['team'] == null ? null : TeamClass.fromJson(json['team']),
        games: json['games'] == null ? null : Games.fromJson(json['games']),
        substitutes: json['substitutes'] == null
            ? null
            : Substitutes.fromJson(json['substitutes']),
        shots: json['shots'] == null ? null : Shots.fromJson(json['shots']),
        goals: json['goals'] == null ? null : Goals.fromJson(json['goals']),
        passes: json['passes'] == null ? null : Passes.fromJson(json['passes']),
        tackles:
            json['tackles'] == null ? null : Tackles.fromJson(json['tackles']),
        duels: json['duels'] == null ? null : Duels.fromJson(json['duels']),
        dribbles: json['dribbles'] == null
            ? null
            : Dribbles.fromJson(json['dribbles']),
        fouls: json['fouls'] == null ? null : Fouls.fromJson(json['fouls']),
        cards: json['cards'] == null ? null : Cards.fromJson(json['cards']),
        penalty:
            json['penalty'] == null ? null : Penalty.fromJson(json['penalty']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'player_id': playerId,
        'player': player?.toJson(),
        'number_of_goals': numberOfGoals,
        'number_of_shots': numberOfShots,
        'number_of_matches': numberOfMatches,
        'assists': assists,
        'typeable_id': typeableId,
        'team_id': teamId,
        'team': team?.toJson(),
        'games': games?.toJson(),
        'substitutes': substitutes?.toJson(),
        'shots': shots?.toJson(),
        'goals': goals?.toJson(),
        'passes': passes?.toJson(),
        'tackles': tackles?.toJson(),
        'duels': duels?.toJson(),
        'dribbles': dribbles?.toJson(),
        'fouls': fouls?.toJson(),
        'cards': cards?.toJson(),
        'penalty': penalty?.toJson(),
      };
}

class Cards {
  Cards({
    required this.red,
    required this.yellow,
    required this.yellowred,
  });

  int? red;
  int? yellow;
  int? yellowred;

  factory Cards.fromJson(Map<String, dynamic> json) => Cards(
        red: json['red'],
        yellow: json['yellow'],
        yellowred: json['yellowred'],
      );

  Map<String, dynamic> toJson() => {
        'red': red,
        'yellow': yellow,
        'yellowred': yellowred,
      };
}

class Dribbles {
  Dribbles({
    this.past,
    required this.success,
    required this.attempts,
  });

  dynamic past;
  int? success;
  int? attempts;

  factory Dribbles.fromJson(Map<String, dynamic> json) => Dribbles(
        past: json['past'],
        success: json['success'],
        attempts: json['attempts'],
      );

  Map<String, dynamic> toJson() => {
        'past': past,
        'success': success,
        'attempts': attempts,
      };
}

class Duels {
  Duels({
    required this.won,
    required this.total,
  });

  int? won;
  int? total;

  factory Duels.fromJson(Map<String, dynamic> json) => Duels(
        won: json['won'],
        total: json['total'],
      );

  Map<String, dynamic> toJson() => {
        'won': won,
        'total': total,
      };
}

class Fouls {
  Fouls({
    required this.drawn,
    this.committed,
  });

  int? drawn;
  int? committed;

  factory Fouls.fromJson(Map<String, dynamic> json) => Fouls(
        drawn: json['drawn'],
        committed: json['committed'],
      );

  Map<String, dynamic> toJson() => {
        'drawn': drawn,
        'committed': committed,
      };
}

class Games {
  Games({
    this.number,
    required this.rating,
    required this.captain,
    required this.lineups,
    required this.minutes,
    required this.position,
    required this.appearences,
  });

  dynamic number;
  String? rating;
  bool? captain;
  int? lineups;
  int? minutes;
  String? position;
  int? appearences;

  factory Games.fromJson(Map<String, dynamic> json) => Games(
        number: json['number'],
        rating: json['rating'],
        captain: json['captain'],
        lineups: json['lineups'],
        minutes: json['minutes'],
        position: json['position'],
        appearences: json['appearences'],
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'rating': rating,
        'captain': captain,
        'lineups': lineups,
        'minutes': minutes,
        'position': position,
        'appearences': appearences,
      };
}

class Goals {
  Goals({
    this.saves,
    required this.total,
    required this.assists,
    required this.conceded,
  });

  dynamic saves;
  int? total;
  int? assists;
  int? conceded;

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        saves: json['saves'] ?? 0,
        total: json['total'] ?? 0,
        assists: json['assists'] ?? 0,
        conceded: json['conceded'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'saves': saves,
        'total': total,
        'assists': assists,
        'conceded': conceded,
      };
}

class Passes {
  Passes({
    required this.key,
    required this.total,
    required this.accuracy,
  });

  int? key;
  int? total;
  int? accuracy;

  factory Passes.fromJson(Map<String, dynamic> json) => Passes(
        key: json['key'],
        total: json['total'],
        accuracy: json['accuracy'],
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'total': total,
        'accuracy': accuracy,
      };
}

class Penalty {
  Penalty({
    this.won,
    this.saved,
    required this.missed,
    required this.scored,
    this.commited,
  });

  dynamic won;
  dynamic saved;
  int? missed;
  int? scored;
  dynamic commited;

  factory Penalty.fromJson(Map<String, dynamic> json) => Penalty(
        won: json['won'],
        saved: json['saved'],
        missed: json['missed'],
        scored: json['scored'],
        commited: json['commited'],
      );

  Map<String, dynamic> toJson() => {
        'won': won,
        'saved': saved,
        'missed': missed,
        'scored': scored,
        'commited': commited,
      };
}

class Shots {
  Shots({
    required this.on,
    required this.total,
  });

  int? on;
  int? total;

  factory Shots.fromJson(Map<String, dynamic> json) => Shots(
        on: json['on'],
        total: json['total'],
      );

  Map<String, dynamic> toJson() => {
        'on': on,
        'total': total,
      };
}

class Substitutes {
  Substitutes({
    required this.substitutesIn,
    required this.out,
    required this.bench,
  });

  int? substitutesIn;
  int? out;
  int? bench;

  factory Substitutes.fromJson(Map<String, dynamic> json) => Substitutes(
        substitutesIn: json['in'],
        out: json['out'],
        bench: json['bench'],
      );

  Map<String, dynamic> toJson() => {
        'in': substitutesIn,
        'out': out,
        'bench': bench,
      };
}

class Tackles {
  Tackles({
    this.total,
    this.blocks,
    this.interceptions,
  });

  int? total;
  int? blocks;
  int? interceptions;

  factory Tackles.fromJson(Map<String, dynamic> json) => Tackles(
        total: json['total'],
        blocks: json['blocks'],
        interceptions: json['interceptions'],
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'blocks': blocks,
        'interceptions': interceptions,
      };
}

class TeamClass {
  TeamClass({
    required this.id,
    required this.name,
    required this.nameValues,
    required this.logo,
    required this.homeColor,
    required this.awayColor,
  });

  int? id;
  String? name;
  NameValues? nameValues;
  String? logo;
  String? homeColor;
  String? awayColor;

  factory TeamClass.fromJson(Map<String, dynamic> json) => TeamClass(
        id: json['id'],
        name: json['name'],
        nameValues: json['name_values'] == null
            ? null
            : NameValues.fromJson(json['name_values']),
        logo: json['logo'],
        homeColor: json['home_color'],
        awayColor: json['away_color'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'name_values': nameValues?.toJson(),
        'logo': logo,
        'home_color': homeColor,
        'away_color': awayColor,
      };
}
