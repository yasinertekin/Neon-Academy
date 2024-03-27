import 'dart:io';

import 'package:api_case/product/model/food.dart';
import 'package:api_case/product/model/products.dart';
import 'package:api_case/product/model/recipes.dart';
import 'package:api_case/product/model/users.dart';
import 'package:dio/dio.dart';

abstract final class IFoodServie {
  IFoodServie({required this.service});

  /// The Dio service
  final Dio service;

  /// Fetches the food from the API
  Future<Food?> getFood();

  /// Fetches Products from the API
  Future<List<Products>?> getProducts();

  /// Post Products to the API
  Future<void> postProducts();

  Future<List<Users>?> getUsers();

  /// Post Users to the API
  Future<void> postUsers();
}

final class FoodServiceImpl implements IFoodServie {
  FoodServiceImpl({required this.service});

  @override
  final Dio service;

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

  @override
  Future<List<Products>?> getProducts() async {
    final response = await service.get<dynamic>(
      options: Options(headers: {'cache-control': 'no-cache'}),
      ServiceUrl.products.value,
    );
    if (response.statusCode == HttpStatus.ok) {
      final responseData = response.data;
      if (responseData != null) {
        if (responseData is List<dynamic>) {
          final listData = responseData;
          final recipesList = listData
              .map((item) => Products.fromJson(item as Map<String, dynamic>))
              .toList();
          return recipesList;
        }
      }
    }
    return null;
  }

  @override
  Future<bool> postProducts() async {
    final products = Products(
      id: 1,
      title: 'Product 1',
      price: 100,
      description: 'Product 1 description',
      category: 'Product 1 category',
      image: 'Product 1 image',
      rating: Rating(rate: 4.5, count: 100),
    );
    final result = await service.post<dynamic>(
      ServiceUrl.products.value,
      data: products.toJson(),
    );
    if (result.statusCode == HttpStatus.ok) {
      print('Uploaded!');
      final responseData = result.data;
      print(responseData);

      return true;
    } else {
      print('Failed to upload!');
      return false;
    }
  }

  @override
  Future<List<Users>?> getUsers() async {
    final response = await service.get<dynamic>(
      ServiceUrl.users.value,
    );
    if (response.statusCode == HttpStatus.ok) {
      final responseData = response.data;
      if (responseData != null) {
        if (responseData is List<dynamic>) {
          final listData = responseData;
          final usersList = listData
              .map((item) => Users.fromJson(item as Map<String, dynamic>))
              .toList();
          return usersList;
        }
      }
    }
    return null;
  }

  @override
  Future<void> postUsers() {
    // final users = Users(
    //   username: 'Hasan',
    //   description: 'User 1 description',
    //   linkedinUrl: 'User 1 linkedinUrl',
    // );
    // final result = service.post<dynamic>(
    //   ServiceUrl.users.value,
    //   data: users.toJson(),
    // );

    // return result;
    return Future.value();
  }
}

enum ServiceUrl {
  baseUrl('https://dummyjson.com/'),
  productsBaseUrl('https://fakestoreapi.com/'),
  products('products'),
  recipes('recipes'),
  usersBaseUrl('https://jsonblob.com/'),
  users('api/jsonBlob/1170375797302484992');

  final String value;

  const ServiceUrl(this.value);
}
