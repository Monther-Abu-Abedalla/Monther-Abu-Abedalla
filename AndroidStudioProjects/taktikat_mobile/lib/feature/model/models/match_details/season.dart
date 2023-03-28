class Season {
  Season({
    required this.id,
    required this.name,
  });

  int id;
  int name;

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
