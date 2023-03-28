class Coach {
  Coach({
    required this.id,
    required this.name,
    required this.photo,
  });

  int? id;
  String? name;
  String? photo;

  factory Coach.fromJson(Map<String, dynamic> json) => Coach(
        id: json['id'],
        name: json['name'],
        photo: json['photo'],
      );
}
