// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authors _$AuthorsFromJson(Map<String, dynamic> json) => Authors(
      id: json['id'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      thumbnail: json['thumbnail'] as String?,
      author: json['author'] as String?,
    );

Map<String, dynamic> _$AuthorsToJson(Authors instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'thumbnail': instance.thumbnail,
      'author': instance.author,
    };
