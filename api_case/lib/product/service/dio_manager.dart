import 'package:api_case/product/service/food_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// Dio manager class
@immutable
final class DioManager {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ServiceUrl.baseUrl.value,
    ),
  );

  /// Get Dio instance
  static Dio get dioInstance => _dio;
}
