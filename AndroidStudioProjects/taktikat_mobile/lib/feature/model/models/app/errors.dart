class Errors {
  Errors({
    this.email = const [],
    this.mobile = const [],
    this.userName = const [],
  });

  List<String> email;
  List<String> mobile;
  List<String> userName;

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        email: json['email'] == null
            ? []
            : List<String>.from((json['email'] as List).map((x) => x)),
        mobile: json['mobile'] == null
            ? []
            : List<String>.from((json['mobile'] as List).map((x) => x)),
        userName: json['username'] == null
            ? []
            : List<String>.from((json['username'] as List).map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'mobile': mobile,
      };
}
