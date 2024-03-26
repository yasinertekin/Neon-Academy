// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      age: json['age'] as String?,
      id: json['id'] as int?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'age': instance.age,
      'id': instance.id,
      'email': instance.email,
    };
