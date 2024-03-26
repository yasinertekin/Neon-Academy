import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_master.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
@immutable
final class TaskMaster extends Equatable {
  TaskMaster({
    String? id,
    this.title,
    this.description,
    this.dueDate,
    this.isCompleted,
    this.priority,
    this.tags,
    this.userId,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
  }) : id = UniqueKey().toString();

  /// From Json
  factory TaskMaster.fromJson(Map<String, dynamic> json) =>
      _$TaskMasterFromJson(json);
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final DateTime? dueDate;
  @HiveField(4)
  final bool? isCompleted;
  @HiveField(5)
  final int? priority;
  @HiveField(6)
  final List<String>? tags;
  @HiveField(7)
  final String? userId;
  @HiveField(8)
  final String? categoryId;
  @HiveField(9)
  final DateTime? createdAt;
  @HiveField(10)
  final DateTime? updatedAt;
  @HiveField(11)
  final String? imagePath;

  /// To Json
  Map<String, dynamic> toJson() => _$TaskMasterToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        dueDate,
        isCompleted,
        priority,
        tags,
        userId,
        categoryId,
        createdAt,
        updatedAt,
        imagePath,
      ];

  /// CopyWith
  TaskMaster copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? dueDate,
    bool? isCompleted,
    int? priority,
    List<String>? tags,
    String? userId,
    String? categoryId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? imagePath,
  }) {
    return TaskMaster(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      isCompleted: isCompleted ?? this.isCompleted,
      priority: priority ?? this.priority,
      tags: tags ?? this.tags,
      userId: userId ?? this.userId,
      categoryId: categoryId ?? this.categoryId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}


// final String id: Görevlerin benzersiz tanımlayıcısı olarak kullanılacak bir ID alanı.
// final String title: Görevin başlığını temsil eden bir metin alanı.
// final String description: Görevin açıklamasını içeren bir metin alanı.
// final DateTime dueDate: Görevin son tarihini temsil eden bir tarih/zaman alanı.
// final bool isCompleted: Görevin tamamlanıp tamamlanmadığını belirten bir boolean alanı.
// final int priority: Görevin öncelik düzeyini belirten bir tamsayı alanı (örneğin, 1'den 5'e kadar bir öncelik derecesi).
// final List<String> tags: Görevin etiketlerini içeren bir dize listesi alanı.
// final String userId: Görevin atanmış olduğu kullanıcının ID'sini temsil eden bir dize alanı (eğer uygulama birden fazla kullanıcıyı destekliyorsa).
// final String categoryId: Görevin ait olduğu kategorinin ID'sini temsil eden bir dize alanı.
// final DateTime createdAt: Görevin oluşturulma tarihini temsil eden bir tarih/zaman alanı.
// final DateTime updatedAt: Görevin en son güncellenme tarihini temsil eden bir tarih/zaman alanı.
// final String imagePath: Göreve ilişkilendirilmiş bir resmin dosya yolu veya URL'sini temsil eden bir dize alanı.