import 'package:taktikat/feature/model/models/home/theme_model.dart';

class User {
  User({
    required this.id,
    this.name,
    this.username,
    this.email,
    this.mobile,
    this.countryLabel,
    this.favoriteSettingsIsShown,
    this.token,
    this.image,
    this.themeModel,
  });

  int id;
  String? name;
  String? username;
  String? email;
  String? mobile;
  String? countryLabel;
  int? favoriteSettingsIsShown;
  String? token;
  String? image;
  ThemeModel? themeModel;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        mobile: json['mobile'],
        countryLabel: json['country_label'],
        favoriteSettingsIsShown: json['favorite_settings_is_shown'],
        token: json['token'],
        image: json['image'],
        themeModel: json['theme_model'] == null
            ? null
            : ThemeModel.fromJson(json['theme_model']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'mobile': mobile,
        'country_label': countryLabel,
        'favorite_settings_is_shown': favoriteSettingsIsShown,
        'token': token,
        'image': image,
        'theme_model': themeModel?.toJson(),
      };
}
