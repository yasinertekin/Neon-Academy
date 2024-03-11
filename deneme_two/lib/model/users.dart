import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
final class Users extends Equatable {
  const Users({
    required this.age,
    required this.imageUrl,
    required this.name,
  });
  final DateTime age;
  final String imageUrl;
  final String name;

  @override
  List<Object?> get props => [age, imageUrl, name];

  /// Copy With
  Users copyWith({
    DateTime? age,
    String? imageUrl,
    String? name,
  }) {
    return Users(
      age: age ?? this.age,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
    );
  }
}
