import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';

@JsonSerializable(
  explicitToJson: true,
  nullable: true,
)
final class Users with EquatableMixin {
  Users({
    this.name,
    this.surname,
    this.age,
    int? id,
    this.email,
  }) : id = id ?? UniqueKey().hashCode;

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'surname')
  final String? surname;
  @JsonKey(name: 'age')
  final String? age;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'email')
  final String? email;

  Map<String, dynamic> toJson() => _$UsersToJson(this);

  @override
  List<Object?> get props => [name, surname, age, id, email];

  Users copyWith({
    String? username,
    String? description,
    String? linkedinUrl,
    int? id,
    String? email,
  }) {
    return Users(
      name: name ?? name,
      surname: surname ?? surname,
      age: linkedinUrl ?? age,
      id: id ?? this.id,
      email: email ?? this.email,
    );
  }
}
