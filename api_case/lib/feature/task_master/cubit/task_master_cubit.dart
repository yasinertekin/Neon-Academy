import 'package:api_case/feature/task_master/cubit/task_master_state.dart';
import 'package:api_case/product/model/task_master.dart';
import 'package:api_case/product/service/cache_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class TaskMasterCubit extends Cubit<TaskMasterState> {
  TaskMasterCubit(
    this._taskMasterRepository,
  ) : super(const TaskMasterState()) {
    getTaskMasters();
  }

  final ICacheManager<TaskMaster> _taskMasterRepository;

  Future<void> getTaskMasters() async {
    await _taskMasterRepository.init();
    try {
      emit(state.copyWith(isLoading: true));
      final taskMasters = _taskMasterRepository.getValues();
      emit(state.copyWith(taskMasters: taskMasters, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> addTaskMaster(TaskMaster taskMaster) async {
    try {
      emit(state.copyWith(isLoading: true));
      await _taskMasterRepository.putItem(taskMaster.id!, taskMaster);
      final taskMasters = _taskMasterRepository.getValues();
      emit(state.copyWith(taskMasters: taskMasters, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  /// Delete TaskMaster
  Future<void> deleteTaskMaster(String id) async {
    try {
      emit(state.copyWith(isLoading: true));
      await _taskMasterRepository.removeItem(id);
      final taskMasters = _taskMasterRepository.getValues();
      emit(state.copyWith(taskMasters: taskMasters, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
