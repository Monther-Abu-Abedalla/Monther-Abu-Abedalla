import '../../shared_models.dart';

class Competition {
  Competition({
    required this.id,
    required this.competitionType,
    required this.competition,
    required this.competitionLeagueLogo,
    required this.homeTeam,
    required this.awayTeam,
    required this.round,
    required this.startAt,
    required this.expectationsCompetition,
    required this.competitionResults,
    required this.myExpectationsCompetition,
    required this.isExpected,
    required this.isFinished,
    this.isReVote = false,
  });

  int? id;
  String? competitionType;
  String? competition;
  String? competitionLeagueLogo;
  Team? homeTeam;
  Team? awayTeam;
  String? round;
  DateTime? startAt;
  List<ExpectationsCompetition>? expectationsCompetition;
  CompetitionResult? competitionResults;
  MyExpectationsCompetition? myExpectationsCompetition;
  bool? isExpected;
  bool? isFinished;
  bool isReVote;
  String homeScore = '0';
  String awayScore = '0';

  factory Competition.fromJson(Map<String, dynamic> json) => Competition(
        id: json['id'],
        competitionType: json['competition_type'],
        competition: json['competition'],
        competitionLeagueLogo: json['competition_league_logo'],
        isExpected: json['is_expected'],
        isFinished: json['is_finished'],
        homeTeam:
            json['home_team'] == null ? null : Team.fromJson(json['home_team']),
        awayTeam:
            json['away_team'] == null ? null : Team.fromJson(json['away_team']),
        round: json['round'],
        startAt:
            json['start_at'] == null ? null : DateTime.parse(json['start_at']),
        expectationsCompetition: json['expectationsCompetition'] == null
            ? null
            : (json['expectationsCompetition'] as List<dynamic>)
                .map((dynamic competition) => ExpectationsCompetition.fromJson(
                    competition as Map<String, dynamic>))
                .toList(),
        competitionResults: json['competition_results'] == null
            ? null
            : CompetitionResult.fromJson(json['competition_results']),
        myExpectationsCompetition: json['myExpectationsCompetition'] == null
            ? null
            : MyExpectationsCompetition.fromJson(
                json['myExpectationsCompetition']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'competition_type': competitionType,
        'competition': competition,
        'competition_league_logo': competitionLeagueLogo,
        'home_team': homeTeam?.toJson(),
        'away_team': awayTeam?.toJson(),
        'round': round,
        'start_at': startAt?.toIso8601String(),
        'expectationsCompetition': expectationsCompetition == null
            ? null
            : List<dynamic>.from(
                expectationsCompetition!.map((x) => x.toJson())),
        'competition_results': competitionResults?.toJson(),
        'is_expected': isExpected,
      };
}

class MyExpectationsCompetition {
  MyExpectationsCompetition({
    required this.id,
    required this.homeTeamScore,
    required this.awayTeamScore,
    required this.isDraw,
    required this.customerId,
    required this.matchId,
    required this.winner,
    required this.createdAt,
    required this.updatedAt,
  });

  int? id;
  int? homeTeamScore;
  int? awayTeamScore;
  int? isDraw;
  int? customerId;
  int? matchId;
  String? winner;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory MyExpectationsCompetition.fromJson(Map<String, dynamic> json) =>
      MyExpectationsCompetition(
        id: json['id'],
        homeTeamScore: json['home_team_score'],
        awayTeamScore: json['away_team_score'],
        isDraw: json['is_draw'],
        customerId: json['customer_id'],
        matchId: json['match_id'],
        winner: json['winner'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'home_team_score': homeTeamScore,
        'away_team_score': awayTeamScore,
        'is_draw': isDraw,
        'customer_id': customerId,
        'match_id': matchId,
        'winner': winner,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}

class CompetitionResult {
  CompetitionResult({
    required this.total,
    required this.homeVotedRate,
    required this.awayVotedRate,
    required this.drawVotedRate,
  });

  int? total;
  VotedRate? homeVotedRate;
  VotedRate? awayVotedRate;
  VotedRate? drawVotedRate;

  factory CompetitionResult.fromJson(Map<String, dynamic> json) =>
      CompetitionResult(
        total: json['total'],
        homeVotedRate: json['home_voted_rate'] == null
            ? null
            : VotedRate.fromJson(json['home_voted_rate']),
        awayVotedRate: json['away_voted_rate'] == null
            ? null
            : VotedRate.fromJson(json['away_voted_rate']),
        drawVotedRate: json['draw_voted_rate'] == null
            ? null
            : VotedRate.fromJson(json['draw_voted_rate']),
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'home_voted_rate': homeVotedRate?.toJson(),
        'away_voted_rate': awayVotedRate?.toJson(),
        'draw_voted_rate': drawVotedRate?.toJson(),
      };
}

class ExpectationsCompetition {
  ExpectationsCompetition({
    required this.id,
    required this.homeTeamScore,
    required this.awayTeamScore,
    required this.isDraw,
    required this.customerId,
    required this.customer,
    required this.matchId,
    required this.winner,
    required this.createdAt,
    required this.updatedAt,
  });

  int? id;
  int? homeTeamScore;
  int? awayTeamScore;
  int? isDraw;
  int? customerId;
  Customer? customer;
  int? matchId;
  String? winner;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ExpectationsCompetition.fromJson(Map<String, dynamic> json) =>
      ExpectationsCompetition(
        id: json['id'],
        homeTeamScore: json['home_team_score'],
        awayTeamScore: json['away_team_score'],
        isDraw: json['is_draw'],
        customerId: json['customer_id'],
        customer: json['customer'] == null
            ? null
            : Customer.fromJson(json['customer']),
        matchId: json['match_id'],
        winner: json['winner'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'home_team_score': homeTeamScore,
        'away_team_score': awayTeamScore,
        'is_draw': isDraw,
        'customer_id': customerId,
        'customer': customer?.toJson(),
        'match_id': matchId,
        'winner': winner,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}

class Customer {
  Customer({
    required this.id,
    this.name,
    required this.image,
  });

  int? id;
  dynamic name;
  String? image;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json['id'],
        name: json['name'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}
