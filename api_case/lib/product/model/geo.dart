import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'geo.g.dart';

@JsonSerializable()
@immutable
final class Geo with EquatableMixin {
  Geo({
    this.lat,
    this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
  @JsonKey(name: 'lat')
  final String? lat;
  @JsonKey(name: 'lng')
  final String? lng;

  Map<String, dynamic> toJson() => _$GeoToJson(this);

  @override
  List<Object?> get props => [lat, lng];

  Geo copyWith({
    String? lat,
    String? lng,
  }) {
    return Geo(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }
}
