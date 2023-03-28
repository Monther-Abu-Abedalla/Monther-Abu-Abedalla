import 'half.dart';

class TeamCommentaries {
  TeamCommentaries({
    this.firstHalf = const [],
    this.secondHalf = const [],
    this.extraFirstHalf = const [],
    this.extraSecondHalf = const [],
    this.penalties = const [],
  });

  List<Half> firstHalf;
  List<Half> secondHalf;
  List<Half> extraFirstHalf;
  List<Half> extraSecondHalf;
  List<Half> penalties;

  factory TeamCommentaries.fromJson(Map<String, dynamic> json) =>
      TeamCommentaries(
        firstHalf: json['first_half'] == null
            ? []
            : (json['first_half'] as List<dynamic>)
                .map((dynamic json) =>
                    Half.fromJson(json as Map<String, dynamic>))
                .toList(),
        secondHalf: json['second_half'] == null
            ? []
            : (json['second_half'] as List<dynamic>)
                .map((dynamic json) =>
                    Half.fromJson(json as Map<String, dynamic>))
                .toList(),
        extraFirstHalf: json['extra_first_half'] == null
            ? []
            : (json['extra_first_half'] as List<dynamic>)
                .map((dynamic json) =>
                    Half.fromJson(json as Map<String, dynamic>))
                .toList(),
        extraSecondHalf: json['extra_second_half'] == null
            ? []
            : (json['extra_second_half'] as List<dynamic>)
                .map((dynamic json) =>
                    Half.fromJson(json as Map<String, dynamic>))
                .toList(),
        penalties: json['penalties'] == null
            ? []
            : (json['penalties'] as List<dynamic>)
                .map((dynamic json) =>
                    Half.fromJson(json as Map<String, dynamic>))
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        'first_half': List<dynamic>.from(firstHalf.map((x) => x.toJson())),
        'second_half': List<dynamic>.from(secondHalf.map((x) => x.toJson())),
        'extra_first_half': List<dynamic>.from(extraFirstHalf.map((x) => x)),
        'extra_second_half': List<dynamic>.from(extraSecondHalf.map((x) => x)),
        'penalties': List<dynamic>.from(penalties.map((x) => x)),
      };
}
