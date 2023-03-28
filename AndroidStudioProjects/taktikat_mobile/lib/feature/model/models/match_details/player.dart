class Player {
  Player({
    required this.id,
    this.name,
    this.image,
    this.position,
    this.nationality,
  });

  int? id;
  String? name;
  String? image;
  dynamic position;
  dynamic nationality;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json['id'],
        name: json['name'] is String ? json['name'] : null,
        image: json['image'],
        position: json['position'],
        nationality: json['nationality'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'position': position,
        'nationality': nationality,
      };
}
