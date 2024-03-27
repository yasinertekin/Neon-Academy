import 'package:api_case/product/service/food_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

@immutable
final class DioManager {
  DioManager(String? baseUrl) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? ServiceUrl.baseUrl.value,
        connectTimeout: Durations.extralong2,
        receiveTimeout: Durations.extralong2,
        sendTimeout: Durations.extralong2,
        contentType: Headers.jsonContentType,

        headers: {
          Headers.contentTypeHeader: Headers.jsonContentType,
          Headers.acceptHeader: Headers.jsonContentType,
        },
        validateStatus: (status) {
          return status != null && status >= 200 && status < 300;
        },
        maxRedirects: 5,
        followRedirects: true,
        // responseType: ResponseType.json,
        // extra: {
        //   'isCached': false,
        // },
        // method: 'GET',
        persistentConnection: true,
      ),
    );

    // Interceptors for error handling and request customization
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // const authToken = 'YourAuthToken';
          // options.headers['Authorization'] = 'Bearer $authToken';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          // if (error.type == DioExceptionType.connectionTimeout) {
          //   return handler.resolve(
          //     await dio.request(
          //       error.requestOptions.path,
          //       options: Options(
          //         method: error.requestOptions.method,
          //         headers: error.requestOptions.headers,
          //       ),
          //     ),
          //   );
          // } else {
          //   return handler.next(error);
          // }
        },
      ),
    );
  }
  late final Dio _dio;

  /// Returns the Dio instance
  Dio get dio => _dio;
}
