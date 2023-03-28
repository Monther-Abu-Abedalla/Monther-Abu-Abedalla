import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:taktikat/network/constance_network/constants_network.dart';
import 'dart:async';

import 'api_interceptors.dart';

class DioManager {
  DioManager._();
  static final DioManager getInstance = DioManager._();

  Dio? _dio;
  Dio init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ConstanceNetwork.baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        responseType: ResponseType.json,
        receiveDataWhenStatusError: true,
        validateStatus: (status) {
          return true;
        },
      ),
    );
    _dio?.interceptors.add(ApiInterceptors());
    return _dio!;
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? header,
    var queryParameters,
  }) async {
    Logger().i(
        'dioGet url: $url header: $header queryParameters: $queryParameters}');

    return await _dio!.get(
      url,
      options: Options(headers: header),
      queryParameters: queryParameters,
    );
  }

  Future<Response> post({
    required String url,
    Map<String, dynamic>? header,
    var body,
    Map<String, dynamic>? queryParameters,
  }) async {
    Logger().i('dioPost url: $url');
    Logger().i('dioPost header: $header');
    return await _dio!.post(
      url,
      queryParameters: queryParameters,
      options: Options(headers: header),
      data: body,
      onSendProgress: (count, total) {},
    );
  }

  Future<Response> postForm(
      {required String url, Map<String, dynamic>? header, var body}) async {
    Logger().i('dioPostForm url: $url');
    Logger().i('dioPostForm header: $header');
    Logger().i('dioPostForm body: $body');

    return await _dio!.post(
      url,
      options: Options(headers: header),
      data: FormData.fromMap(body ?? {}),
      onSendProgress: (count, total) {},
    );
  }

  Future<Response> update({
    required String url,
    Map<String, dynamic>? header,
    Map<String, dynamic>? body,
  }) async {
    return await _dio!.put(url, options: Options(headers: header), data: body);
  }

  Future<Response> delete({
    required String url,
    Map<String, dynamic>? header,
    Map<String, dynamic>? body,
  }) async {
    return await _dio!
        .delete(url, options: Options(headers: header), data: body);
  }

  Future<Response> putForm({
    required String url,
    Map<String, dynamic>? header,
    var body,
  }) async {
    Logger().i('dioPutForm url: $url');
    Logger().i('dioPutForm header: $header');
    Logger().i('dioPutForm body: $body');

    return await _dio!.put(
      url,
      options: Options(headers: header),
      data: body,
    );
  }

  Future<Response> patchForm({
    required String url,
    Map<String, dynamic>? header,
    var body,
  }) async {
    Logger().i('dioPutForm url: $url');
    Logger().i('dioPutForm header: $header');
    Logger().i('dioPutForm body: $body');

    return await _dio!.patch(
      url,
      options: Options(headers: header),
      data: body,
    );
  }

  Future<Response> put({
    required String url,
    Map<String, dynamic>? header,
    var body,
  }) async {
    Logger().i('dioPutForm url: $url');
    Logger().i('dioPutForm header: $header');
    Logger().i('dioPutForm body: $body');

    return await _dio!.put(
      url,
      options: Options(headers: header),
      data: body,
    );
  }

  Future<Response<dynamic>> downloadFile(
      {required String url,
      required var body,
      required Map<String, String> header,
      required String savePath}) {
    Logger().i('dioDownloadFile url: $url');
    Logger().i('dioDownloadFile header: $header');

    return _dio!.download(
      url,
      savePath,
      data: body,
      options: Options(headers: header),
      onReceiveProgress: (received, total) {
        if (total != -1) {
          Logger().i('${(received / total * 100).toStringAsFixed(0)}%');
        }
      },
    );
  }
}
