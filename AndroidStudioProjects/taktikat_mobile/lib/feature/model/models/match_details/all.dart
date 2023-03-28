import 'goals.dart';

class All {
  All({
    this.win,
    this.draw,
    this.lose,
    this.goals,
    this.played,
  });

  int? win;
  int? draw;
  int? lose;
  Goals? goals;
  int? played;

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
        'goals': goals?.toJson(),
        'played': played,
      };
}
