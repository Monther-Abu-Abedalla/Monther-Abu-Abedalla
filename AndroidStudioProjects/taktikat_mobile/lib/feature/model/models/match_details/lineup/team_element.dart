import '../../../shared_models.dart';

class TeamElement {
  TeamElement({
    required this.id,
    this.countryId,
    required this.name,
    required this.description,
    required this.code,
    required this.image,
    required this.logo,
    required this.slug,
    this.mergedWith,
    this.teamType,
    this.teamClass,
    this.sports,
    required this.status,
    this.images,
    this.closedDate,
    this.establishingDate,
    required this.leagueId,
    required this.createdAt,
    required this.updatedAt,
    required this.stadiumId,
    this.videoUrl,
    this.order,
    this.isTranslated,
    this.deletedAt,
    required this.homeColor,
    required this.awayColor,
    // required this.actions,
    required this.nameLabel,
    required this.statusValue,
    required this.typeLabel,
    required this.leagueLabel,
    required this.league,
  });

  int id;
  dynamic countryId;
  NameValues? name;
  NameValues? description;
  String? code;
  String? image;
  String? logo;
  NameValues? slug;
  dynamic mergedWith;
  dynamic teamType;
  dynamic teamClass;
  dynamic sports;
  String? status;
  dynamic images;
  dynamic closedDate;
  dynamic establishingDate;
  int? leagueId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? stadiumId;
  dynamic videoUrl;
  dynamic order;
  dynamic isTranslated;
  dynamic deletedAt;
  String? homeColor;
  String? awayColor;
  // List<dynamic> actions;
  String? nameLabel;
  String? statusValue;
  String? typeLabel;
  String? leagueLabel;
  League? league;

  factory TeamElement.fromJson(Map<String, dynamic> json) => TeamElement(
        id: json['id'],
        countryId: json['country_id'],
        name: json['name'] == null ? null : NameValues.fromJson(json['name']),
        description: json['description'] == null
            ? null
            : NameValues.fromJson(json['description']),
        code: json['code'],
        image: json['image'],
        logo: json['logo'],
        slug: json['slug'] == null ? null : NameValues.fromJson(json['slug']),
        mergedWith: json['merged_with'],
        teamType: json['team_type'],
        teamClass: json['class'],
        sports: json['sports'],
        status: json['status'],
        images: json['images'],
        closedDate: json['closed_date'],
        establishingDate: json['establishing_date'],
        leagueId: json['league_id'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        stadiumId: json['stadium_id'],
        videoUrl: json['video_url'],
        order: json['order'],
        isTranslated: json['is_translated'],
        deletedAt: json['deleted_at'],
        homeColor: json['home_color'],
        awayColor: json['away_color'],
        // actions: List<dynamic>.from(json['actions'].map((x) => x)),
        nameLabel: json['name_label'],
        statusValue: json['status_value'],
        typeLabel: json['type_label'],
        leagueLabel: json['league_label'],
        league: json['league'] == null ? null : League.fromJson(json['league']),
      );
}
