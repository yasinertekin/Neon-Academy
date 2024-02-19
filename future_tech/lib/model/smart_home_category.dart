import 'package:flutter/material.dart';

@immutable

/// SmartHomeCategory class
final class SmartHomeCategory {
  /// SmartHomeCategory constructor
  const SmartHomeCategory({
    required this.name,
  });

  /// SmartHomeCategory name
  final String name;
}

@immutable

/// SmartHomeCategoryList class
final class SmartHomeCategoryList {
  const SmartHomeCategoryList._();

  /// SmartHomeCategoryList items
  static final List<SmartHomeCategory> items = [
    const SmartHomeCategory(name: 'Security'),
    const SmartHomeCategory(name: 'Lighting'),
    const SmartHomeCategory(name: 'Thermostat'),
    const SmartHomeCategory(name: 'Cameras'),
  ];
}
