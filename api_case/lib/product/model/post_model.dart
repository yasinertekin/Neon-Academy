import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable(
  checked: true,
  explicitToJson: true,
)
@immutable
final class PostModel with EquatableMixin {
  const PostModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
  @JsonKey(name: 'userId')
  final int? userId;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'body')
  final String? body;

  @override
  List<Object?> get props => [userId, id, title, body];

  PostModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
