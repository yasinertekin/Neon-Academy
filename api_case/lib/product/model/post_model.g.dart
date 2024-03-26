// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'PostModel',
      json,
      ($checkedConvert) {
        final val = PostModel(
          userId: $checkedConvert('userId', (v) => v as int?),
          id: $checkedConvert('id', (v) => v as int?),
          title: $checkedConvert('title', (v) => v as String?),
          body: $checkedConvert('body', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
