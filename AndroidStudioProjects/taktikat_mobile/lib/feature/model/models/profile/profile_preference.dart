class ProfilePreference {
  ProfilePreference({
    required this.id,
    this.customerId,
    this.preferenceId,
    this.preferenceType,
    this.value,
    this.model,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int? customerId;
  int? preferenceId;
  String? preferenceType;
  int? value;
  Model? model;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ProfilePreference.fromJson(Map<String, dynamic> json) =>
      ProfilePreference(
        id: json['id'],
        customerId: json['customer_id'],
        preferenceId: json['preference_id'],
        preferenceType: json['preference_type'],
        value: json['value'],
        model: json['model'] == null ? null : Model.fromJson(json['model']),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'customer_id': customerId,
        'preference_id': preferenceId,
        'preference_type': preferenceType,
        'value': value,
        'model': model?.toJson(),
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

// @override
// bool operator ==(Object other) =>
//     identical(this, other) ||
// other is ProfilePreference && runtimeType == other.runtimeType 
//&& model?.name == other.model?.name;
//
//
// @override
// int? get hashCode => model?.name.hashCode;
//
// // //List<Matches> data , data.remove(Oonropvwn);
}

class Model {
  Model({
    required this.id,
    required this.name,
    required this.image,
  });

  int? id;
  String? name;
  String? image;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
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
