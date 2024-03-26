import 'package:api_case/product/service/food_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// Dio manager class
@immutable
final class DioManager {
  /// Constructor
  DioManager(String? baseUrl) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? ServiceUrl.baseUrl.value,
      ),
    );
  }
  late final Dio _dio;

  /// Get the Dio service
  Dio get dio => _dio;
}
