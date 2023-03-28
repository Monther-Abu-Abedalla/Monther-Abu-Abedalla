import 'package:taktikat/feature/model/models/match_details/team_commentaries.dart';

import '../../shared_models.dart';

class Commentaries {
  Commentaries({
    required this.matchId,
    this.homeTeam,
    this.awayTeam,
    this.homeTeamCommentaries,
    this.awayTeamCommentaries,
    this.halfCommentaries,
  });

  int matchId;
  Team? homeTeam;
  Team? awayTeam;
  TeamCommentaries? homeTeamCommentaries;
  TeamCommentaries? awayTeamCommentaries;
  TeamCommentaries? halfCommentaries;

  factory Commentaries.fromJson(Map<String, dynamic> json) => Commentaries(
        matchId: json['match_id'],
        homeTeam:
            json['home_team'] == null ? null : Team.fromJson(json['home_team']),
        awayTeam:
            json['away_team'] == null ? null : Team.fromJson(json['away_team']),
        homeTeamCommentaries: json['home_team_commentaries'] == null
            ? null
            : TeamCommentaries.fromJson(json['home_team_commentaries']),
        awayTeamCommentaries: json['away_team_commentaries'] == null
            ? null
            : TeamCommentaries.fromJson(json['away_team_commentaries']),
        halfCommentaries: json['half_commentaries'] == null
            ? null
            : TeamCommentaries.fromJson(json['half_commentaries']),
      );

  Map<String, dynamic> toJson() => {
        'match_id': matchId,
        'home_team': homeTeam?.toJson(),
        'away_team': awayTeam?.toJson(),
        'home_team_commentaries': homeTeamCommentaries?.toJson(),
        'away_team_commentaries': awayTeamCommentaries?.toJson(),
      };
}
