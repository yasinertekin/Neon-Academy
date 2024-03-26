import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authors.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
@immutable
final class Authors with EquatableMixin {
  Authors({
    this.id,
    this.title,
    this.content,
    this.thumbnail,
    this.author,
  });

  factory Authors.fromJson(Map<String, dynamic> json) =>
      _$AuthorsFromJson(json);
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'content')
  final String? content;
  @JsonKey(name: 'thumbnail')
  final String? thumbnail;
  @JsonKey(name: 'author')
  final String? author;

  Map<String, dynamic> toJson() => _$AuthorsToJson(this);

  @override
  List<Object?> get props => [id, title, content, thumbnail, author];

  Authors copyWith({
    String? id,
    String? title,
    String? content,
    String? thumbnail,
    String? author,
  }) {
    return Authors(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      thumbnail: thumbnail ?? this.thumbnail,
      author: author ?? this.author,
    );
  }
}
