class LineupLineup {
  LineupLineup({
    required this.position,
    required this.grid,
    required this.teamPlayerType,
  });

  String? position;
  String? grid;
  String? teamPlayerType;

  factory LineupLineup.fromJson(Map<String, dynamic> json) => LineupLineup(
        position: json['position'],
        grid: json['grid'],
        teamPlayerType: json['team_player_type'],
      );

  Map<String, dynamic> toJson() => {
        'position': position,
        'grid': grid,
        'team_player_type': teamPlayerType,
      };
}
