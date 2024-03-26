import 'package:api_case/product/model/geo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
@immutable
final class Address with EquatableMixin {
  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  @JsonKey(name: 'street')
  final String? street;
  @JsonKey(name: 'suite')
  final String? suite;
  @JsonKey(name: 'city')
  final String? city;
  @JsonKey(name: 'zipcode')
  final String? zipcode;
  @JsonKey(name: 'geo')
  final Geo? geo;

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  List<Object?> get props => [street, suite, city, zipcode, geo];

  Address copyWith({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    Geo? geo,
  }) {
    return Address(
      street: street ?? this.street,
      suite: suite ?? this.suite,
      city: city ?? this.city,
      zipcode: zipcode ?? this.zipcode,
      geo: geo ?? this.geo,
    );
  }
}
