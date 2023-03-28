import 'package:taktikat/feature/model/models/home/search_models/search_result.dart';

class MainSearch {
  MainSearch({
    this.teams = const [],
    this.players = const [],
    this.nationalTeams = const [],
    this.leagues = const [],
    this.championships = const [],
    this.news = const [],
    this.reels = const [],
    this.analytics = const [],
    this.blogs = const [],
    this.matches = const [],
  });
  List<SearchResult> teams;
  List<SearchResult> players;
  List<SearchResult> nationalTeams;
  List<SearchResult> leagues;
  List<SearchResult> championships;
  List<SearchResult> news;
  List<SearchResult> reels;
  List<SearchResult> analytics;
  List<SearchResult> blogs;
  List<SearchResult> matches;

  //create from json
  factory MainSearch.fromJson(Map<String, dynamic> json) {
    return MainSearch(
      teams: json['teams'] != null
          ? (json['teams'] as List)
              .map((i) => SearchResult.fromJson(i))
              .toList()
          : [],
      players: json['players'] != null
          ? (json['players'] as List)
              .map((i) => SearchResult.fromJson(i))
              .toList()
          : [],
      nationalTeams: json['national_teams'] != null
          ? (json['national_teams'] as List)
              .map((i) => SearchResult.fromJson(i))
              .toList()
          : [],
      leagues: json['leagues'] != null
          ? (json['leagues'] as List)
              .map((i) => SearchResult.fromJson(i))
              .toList()
          : [],
      championships: json['championships'] != null
          ? (json['championships'] as List)
              .map((i) => SearchResult.fromJson(i))
              .toList()
          : [],
      news: json['news'] != null
          ? (json['news'] as List).map((i) => SearchResult.fromJson(i)).toList()
          : [],
      reels: json['reels'] != null
          ? (json['reels'] as List)
              .map((i) => SearchResult.fromJson(i))
              .toList()
          : [],
      analytics: json['analytics'] != null
          ? (json['analytics'] as List)
              .map((i) => SearchResult.fromJson(i))
              .toList()
          : [],
      blogs: json['blogs'] != null
          ? (json['blogs'] as List)
              .map((i) => SearchResult.fromJson(i))
              .toList()
          : [],
      matches: json['matches'] != null
          ? (json['matches'] as List)
              .map((i) => SearchResult.fromJson(i))
              .toList()
          : [],
    );
  }
}
