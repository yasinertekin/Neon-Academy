import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable

/// [Users] is a class that holds the user's information.
final class Users extends Equatable {
  /// [Users] requires a [name], [age], [imagePath], and [fontStyle].
  ///
  const Users({
    required this.name,
    required this.age,
    required this.imagePath,
    required this.fontStyle,
  });

  /// [name] is a [String] that holds the user's name.
  final String name;

  /// [age] is a [DateTime] that holds the user's age.
  final DateTime age;

  /// [imagePath] is a [String] that holds the user's image path.
  final String imagePath;

  /// [fontStyle] is a [FontStyle] that holds the user's font style.
  final FontStyle fontStyle;

  @override
  List<Object?> get props => [name, age, imagePath, fontStyle];

  /// [copyWith] is a method that creates a new [Users] with the provided
  /// parameters.
  Users copyWith({
    String? name,
    DateTime? age,
    String? imagePath,
    FontStyle? fontStyle,
  }) {
    return Users(
      name: name ?? this.name,
      fontStyle: fontStyle ?? this.fontStyle,
      age: age ?? this.age,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
