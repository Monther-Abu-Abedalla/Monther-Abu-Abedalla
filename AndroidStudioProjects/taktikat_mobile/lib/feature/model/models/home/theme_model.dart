class ThemeModel {
  ThemeModel({
    this.id,
    this.name,
    this.image,
    this.primaryColor,
    this.secondaryColor,
    this.borderColor,
    this.bgImage,
  });

  int? id;
  String? name;
  String? image;
  String? primaryColor;
  String? secondaryColor;
  String? borderColor;
  String? bgImage;

  factory ThemeModel.fromJson(Map<String, dynamic> json) => ThemeModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        primaryColor: json['primary_color'],
        secondaryColor: json['secondary_color'],
        borderColor: json['border_color'],
        bgImage: json['bg_image'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'primary_color': primaryColor,
        'secondary_color': secondaryColor,
        'border_color': borderColor,
        'bg_image': bgImage,
      };
}
