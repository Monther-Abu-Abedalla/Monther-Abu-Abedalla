class Goals {
  Goals({
    this.goalsFor,
    this.against,
  });

  int? goalsFor;
  int? against;

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        goalsFor: json['for'],
        against: json['against'],
      );

  Map<String, dynamic> toJson() => {
        'for': goalsFor,
        'against': against,
      };
}
