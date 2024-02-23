import 'package:flutter/material.dart';
import 'package:future_tech/model/smart_home_category.dart';

/// SmartHome model
@immutable
final class SmartHome {
  /// SmartHome constructor
  const SmartHome({
    required this.name,
    required this.image,
    required this.category,
    this.isOpen = false,
  });

  /// SmartHome name
  final String name;

  /// SmartHome image
  final String image;

  /// SmartHome category
  final SmartHomeCategory category;

  /// SmartHome isOpen
  final bool isOpen;

  /// CopyWith
  SmartHome copyWith({
    String? name,
    String? image,
    SmartHomeCategory? category,
    bool? isOpen,
  }) {
    return SmartHome(
      name: name ?? this.name,
      image: image ?? this.image,
      category: category ?? this.category,
      isOpen: isOpen ?? this.isOpen,
    );
  }
}

@immutable

/// SmartHomeList class
final class SmartHomeList {
  const SmartHomeList._();

  /// SmartHomeList items
  static final List<SmartHome> items = [
    const SmartHome(
      name: 'Smart Security',
      isOpen: true,
      image: 'assets/images/smart_security.jpg',
      category: SmartHomeCategory(
        name: 'Living Room',
      ),
    ),
    const SmartHome(
      name: 'Smart Security',
      image: 'assets/images/smart_security.jpg',
      category: SmartHomeCategory(
        name: 'Living Room',
      ),
    ),
    const SmartHome(
      name: 'Smart Lighting',
      image: 'assets/images/smart_lighting.jpg',
      category: SmartHomeCategory(
        name: 'Bathroom',
      ),
    ),
    const SmartHome(
      name: 'Smart Lighting',
      isOpen: true,
      image: 'assets/images/smart_lighting.jpg',
      category: SmartHomeCategory(
        name: 'Bathroom',
      ),
    ),
    const SmartHome(
      name: 'Smart Thermostat',
      image: 'assets/images/smart_thermostat.jpg',
      category: SmartHomeCategory(
        name: 'Kitchen',
      ),
    ),
    const SmartHome(
      isOpen: true,
      name: 'Smart Thermostat',
      image: 'assets/images/smart_thermostat.jpg',
      category: SmartHomeCategory(
        name: 'Kitchen',
      ),
    ),
    const SmartHome(
      name: 'Smart Cameras',
      image: 'assets/images/smart_cameras.jpg',
      category: SmartHomeCategory(
        name: 'Bedroom',
      ),
    ),
    const SmartHome(
      isOpen: true,
      name: 'Smart Cameras',
      image: 'assets/images/smart_cameras.jpg',
      category: SmartHomeCategory(
        name: 'Bedroom',
      ),
    ),
  ];
}
