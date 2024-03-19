import 'package:auth_case/product/model/comment_model.dart';
import 'package:auth_case/product/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@immutable
@JsonSerializable(
  explicitToJson: true,
)
final class PostModel extends Equatable {
  PostModel({
    required this.title,
    required this.body,
    required this.imageUrl,
    required this.comments,
    required this.user,
    String? id, // id artık null olabilir, çünkü oluşturulacak
  }) : id = id ??
            UniqueKey().toString(); // id null ise UniqueKey kullanarak oluştur

  /// From Json
  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  final String? id;
  final String? title;
  final String? body;
  final String? imageUrl;
  final List<CommentModel>? comments;
  final UserModel? user;

  /// To Json
  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  @override
  List<Object?> get props => [id, title, body, imageUrl, comments, user];

  /// CopyWith
  PostModel copyWith({
    String? id,
    String? title,
    String? body,
    String? imageUrl,
    List<CommentModel>? comments,
    UserModel? user,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      imageUrl: imageUrl ?? this.imageUrl,
      comments: comments ?? comments,
      user: user,
    );
  }
}
