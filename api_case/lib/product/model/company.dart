import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
@immutable
final class Company with EquatableMixin {
  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'catchPhrase')
  final String? catchPhrase;
  @JsonKey(name: 'bs')
  final String? bs;

  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  @override
  List<Object?> get props => [name, catchPhrase, bs];

  Company copyWith({
    String? name,
    String? catchPhrase,
    String? bs,
  }) {
    return Company(
      name: name ?? this.name,
      catchPhrase: catchPhrase ?? this.catchPhrase,
      bs: bs ?? this.bs,
    );
  }
}
