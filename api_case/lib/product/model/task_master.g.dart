// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_master.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskMasterAdapter extends TypeAdapter<TaskMaster> {
  @override
  final int typeId = 0;

  @override
  TaskMaster read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskMaster(
      id: fields[0] as String?,
      title: fields[1] as String?,
      description: fields[2] as String?,
      dueDate: fields[3] as DateTime?,
      isCompleted: fields[4] as bool?,
      priority: fields[5] as int?,
      tags: (fields[6] as List?)?.cast<String>(),
      userId: fields[7] as String?,
      categoryId: fields[8] as String?,
      createdAt: fields[9] as DateTime?,
      updatedAt: fields[10] as DateTime?,
      imagePath: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskMaster obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.dueDate)
      ..writeByte(4)
      ..write(obj.isCompleted)
      ..writeByte(5)
      ..write(obj.priority)
      ..writeByte(6)
      ..write(obj.tags)
      ..writeByte(7)
      ..write(obj.userId)
      ..writeByte(8)
      ..write(obj.categoryId)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.updatedAt)
      ..writeByte(11)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskMasterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskMaster _$TaskMasterFromJson(Map<String, dynamic> json) => TaskMaster(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      isCompleted: json['isCompleted'] as bool?,
      priority: json['priority'] as int?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      userId: json['userId'] as String?,
      categoryId: json['categoryId'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$TaskMasterToJson(TaskMaster instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'dueDate': instance.dueDate?.toIso8601String(),
      'isCompleted': instance.isCompleted,
      'priority': instance.priority,
      'tags': instance.tags,
      'userId': instance.userId,
      'categoryId': instance.categoryId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'imagePath': instance.imagePath,
    };
