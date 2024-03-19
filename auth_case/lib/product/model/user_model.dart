import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@immutable
@JsonSerializable()
final class UserModel {
  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  /// From Json
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  final String? id;
  final String? name;
  final String? email;
  final String? password;

  /// To Json
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  /// CopyWith
  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
