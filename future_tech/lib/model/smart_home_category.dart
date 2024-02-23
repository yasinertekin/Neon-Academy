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
    const SmartHomeCategory(name: 'Living Room'),
    const SmartHomeCategory(name: 'Bathroom'),
    const SmartHomeCategory(name: 'Kitchen'),
    const SmartHomeCategory(name: 'Bedroom'),
  ];
}
