import 'package:api_case/product/model/task_master.dart';
import 'package:equatable/equatable.dart';

final class TaskMasterState extends Equatable {
  const TaskMasterState({
    this.taskMasters = const [],
    this.isLoading = false,
    this.error,
  });

  final List<TaskMaster> taskMasters;
  final bool isLoading;
  final String? error;

  @override
  List<Object?> get props => [taskMasters, isLoading, error];

  TaskMasterState copyWith({
    List<TaskMaster>? taskMasters,
    bool? isLoading,
    String? error,
  }) {
    return TaskMasterState(
      taskMasters: taskMasters ?? this.taskMasters,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
