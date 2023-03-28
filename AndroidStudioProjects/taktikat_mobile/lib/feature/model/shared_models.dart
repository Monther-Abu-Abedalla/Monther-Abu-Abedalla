class NameValues {
  NameValues({
    required this.ar,
    required this.en,
  });

  String? ar;
  String? en;

  factory NameValues.fromJson(Map<String, dynamic> json) => NameValues(
        ar: json['ar'],
        en: json['en'],
      );

  Map<String, dynamic> toJson() => {
        'ar': ar,
        'en': en,
      };
}

class Stats {
  Stats({
    required this.id,
    required this.key,
    required this.title,
    required this.homeValue,
    required this.homePercentageValue,
    required this.awayValue,
    required this.awayPercentageValue,
  });

  int? id;
  String? key;
  String? title;
  int? homeValue;
  num? homePercentageValue;
  int? awayValue;
  num? awayPercentageValue;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        id: json['id'],
        key: json['key'],
        title: json['title'],
        homeValue: json['home_value'],
        homePercentageValue: json['home_percentage_value'],
        awayValue: json['away_value'],
        awayPercentageValue: json['away_percentage_value'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'key': key,
        'title': title,
        'home_value': homeValue,
        'home_percentage_value': homePercentageValue,
        'away_value': awayValue,
        'away_percentage_value': awayPercentageValue,
      };
}

// class League {
//   League({
//     required this.id,
//     required this.title,
//     required this.image,
//   });
//
//   int? id;
//   String? title;
//   String? image;
//
//   factory League.fromJson(Map<String, dynamic> json) => League(
//         id: json['id'],
//         title: json['title'],
//         image: json['image'],
//       );
//
//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'title': title,
//         'image': image,
//       };
// }
class League {
  League({
    required this.id,
    required this.preferenceType,
    required this.name,
    required this.nameValues,
    required this.logo,
    required this.isFavorite,
  });

  int? id;
  int? preferenceType;
  String? name;
  NameValues? nameValues;
  String? logo;
  bool? isFavorite;

  factory League.fromJson(Map<String, dynamic> json) => League(
        id: json['id'],
        preferenceType: json['preference_type'],
        name: json['name'],
        nameValues: json['name_values'] == null
            ? null
            : NameValues.fromJson(json['name_values']),
        logo: json['logo'],
        isFavorite: json['is_favorite'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'preference_type': preferenceType,
        'name': name,
        'name_values': nameValues,
        'logo': logo,
        'is_favorite': isFavorite,
      };
}

class VotedRate {
  VotedRate({
    required this.rate,
    required this.team,
    required this.count,
  });

  num? rate;
  String? team;
  int? count;

  factory VotedRate.fromJson(Map<String, dynamic> json) => VotedRate(
        rate: json['rate'],
        team: json['team'],
        count: json['count'],
      );

  Map<String, dynamic> toJson() => {
        'rate': rate,
        'team': team,
        'count': count,
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

  int? id;
  String? name;
  NameValues? nameValues;
  String? logo;
  String? homeColor;
  String? awayColor;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
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

class Cards {
  Cards({
    required this.red,
    required this.yellow,
  });

  int red;
  int yellow;

  factory Cards.fromJson(Map<String, dynamic> json) => Cards(
        red: json['red'],
        yellow: json['yellow'],
      );

  Map<String, dynamic> toJson() => {
        'red': red,
        'yellow': yellow,
      };
}

class Dribbles {
  Dribbles({
    this.past,
    this.success,
    this.attempts,
  });

  int? past;
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
    this.won,
    this.total,
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
    this.drawn,
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
    required this.number,
    required this.rating,
    required this.captain,
    required this.minutes,
    required this.position,
    required this.substitute,
  });

  int? number;
  String? rating;
  bool? captain;
  int? minutes;
  String? position;
  bool? substitute;

  factory Games.fromJson(Map<String, dynamic> json) => Games(
        number: json['number'],
        rating: json['rating'],
        captain: json['captain'],
        minutes: json['minutes'],
        position: json['position'],
        substitute: json['substitute'],
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'rating': rating,
        'captain': captain,
        'minutes': minutes,
        'position': position,
        'substitute': substitute,
      };
}

class Goals {
  Goals({
    this.saves,
    this.total,
    this.assists,
    required this.conceded,
  });

  int? saves;
  int? total;
  int? assists;
  int conceded;

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        saves: json['saves'],
        total: json['total'],
        assists: json['assists'],
        conceded: json['conceded'],
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
    this.key,
    required this.total,
    required this.accuracy,
  });

  int? key;
  int? total;
  String? accuracy;

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
  int? saved;
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
    this.on,
    this.total,
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
