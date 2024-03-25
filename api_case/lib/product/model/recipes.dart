import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipes.g.dart';

@JsonSerializable()
@immutable
final class Recipes with EquatableMixin {
  Recipes({
    this.id,
    this.name,
    this.ingredients,
    this.instructions,
    this.prepTimeMinutes,
    this.cookTimeMinutes,
    this.servings,
    this.difficulty,
    this.cuisine,
    this.caloriesPerServing,
    this.tags,
    this.userId,
    this.image,
    this.rating,
    this.reviewCount,
    this.mealType,
  });

  factory Recipes.fromJson(Map<String, dynamic> json) =>
      _$RecipesFromJson(json);
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'ingredients')
  final List<String>? ingredients;
  @JsonKey(name: 'instructions')
  final List<String>? instructions;
  @JsonKey(name: 'prepTimeMinutes')
  final int? prepTimeMinutes;
  @JsonKey(name: 'cookTimeMinutes')
  final int? cookTimeMinutes;
  @JsonKey(name: 'servings')
  final int? servings;
  @JsonKey(name: 'difficulty')
  final String? difficulty;
  @JsonKey(name: 'cuisine')
  final String? cuisine;
  @JsonKey(name: 'caloriesPerServing')
  final int? caloriesPerServing;
  @JsonKey(name: 'tags')
  final List<String>? tags;
  @JsonKey(name: 'userId')
  final int? userId;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'rating')
  final double? rating;
  @JsonKey(name: 'reviewCount')
  final int? reviewCount;
  @JsonKey(name: 'mealType')
  final List<String>? mealType;

  Map<String, dynamic> toJson() => _$RecipesToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        ingredients,
        instructions,
        prepTimeMinutes,
        cookTimeMinutes,
        servings,
        difficulty,
        cuisine,
        caloriesPerServing,
        tags,
        userId,
        image,
        rating,
        reviewCount,
        mealType,
      ];
}
