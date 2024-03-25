import 'dart:io';

import 'package:api_case/product/model/food.dart';
import 'package:api_case/product/model/recipes.dart';
import 'package:dio/dio.dart';

/// Service to fetch books from the Google Books API
abstract final class IFoodServie {
  /// Fetch books from the Google Books API
  IFoodServie({required this.service});

  /// The Dio service
  final Dio service;

  Future<Food?> getFood();
}

final class FoodServiceImpl implements IFoodServie {
  FoodServiceImpl({required this.service});

  @override
  final Dio service;

  @override
  @override
  Future<Food?> getFood() async {
    final response = await service.get<dynamic>(
      ServiceUrl.recipes.value,
    );
    if (response.statusCode == HttpStatus.ok) {
      final responseData = response.data;
      if (responseData != null) {
        if (responseData is List<dynamic>) {
          final listData = responseData;
          final recipesList = listData
              .map((item) => Recipes.fromJson(item as Map<String, dynamic>))
              .toList();
          // Handle or return the recipesList as needed
        } else if (responseData is Map<String, dynamic>) {
          final mapData = responseData;
          return Food.fromJson(mapData);
        }
      }
    }
    return null;
  }
}

enum ServiceUrl {
  baseUrl('https://dummyjson.com/'),
  recipes('recipes');

  final String value;

  const ServiceUrl(this.value);
}
