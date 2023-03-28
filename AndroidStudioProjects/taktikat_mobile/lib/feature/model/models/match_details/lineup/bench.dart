class Bench {
  Bench({
    required this.id,
    required this.name,
    required this.image,
    this.position,
    this.nationality,
  });

  int? id;
  String? name;
  String? image;
  String? position;
  dynamic nationality;

  factory Bench.fromJson(Map<String, dynamic> json) => Bench(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        position: json['position'],
        nationality: json['nationality'],
      );
}
