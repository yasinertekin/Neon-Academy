import 'package:api_case/product/model/recipes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food.g.dart';

@JsonSerializable()
@immutable
final class Food with EquatableMixin {
  Food({
    this.recipes,
    this.total,
    this.skip,
    this.limit,
  });

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);
  @JsonKey(name: 'recipes')
  final List<Recipes>? recipes;
  @JsonKey(name: 'total')
  final int? total;
  @JsonKey(name: 'skip')
  final int? skip;
  @JsonKey(name: 'limit')
  final int? limit;

  Map<String, dynamic> toJson() => _$FoodToJson(this);

  @override
  List<Object?> get props => [recipes, total, skip, limit];
}
