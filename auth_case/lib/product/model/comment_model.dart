import 'package:auth_case/product/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@immutable
@JsonSerializable(
  explicitToJson: true,
)
final class CommentModel extends Equatable {
  const CommentModel({
    required this.id,
    required this.comment,
    required this.user,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  final String? id;
  final String? comment;
  final UserModel? user;

  @override
  List<Object?> get props => [id, comment, user];

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);

  CommentModel copyWith({
    String? id,
    String? comment,
    UserModel? user,
  }) {
    return CommentModel(
      id: id ?? this.id,
      comment: comment ?? this.comment,
      user: user,
    );
  }
}
