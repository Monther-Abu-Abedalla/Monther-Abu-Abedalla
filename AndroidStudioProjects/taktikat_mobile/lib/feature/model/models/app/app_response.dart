import 'package:taktikat/feature/model/models/app/meta.dart';

import 'errors.dart';

class AppResponse {
  AppResponse(
      {this.status,
      this.code,
      this.locale,
      this.message,
      this.data,
      this.errors,
      this.meta});

  int? status;
  int? code;
  String? locale;
  String? message;
  dynamic data;
  Meta? meta;
  Errors? errors;

  factory AppResponse.fromJson(Map<String, dynamic> json) => AppResponse(
        status: json['status'],
        code: json['code'],
        locale: json['locale'],
        message: json['message'],
        data: json['data'],
        errors: json['errors'] == null ? null : Errors.fromJson(json['errors']),
        meta: json['meta'] == null ? null : Meta.fromJson(json['meta']),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'code': code,
        'locale': locale,
        'message': message,
        'data': data,
        'errors': errors,
      };
}

