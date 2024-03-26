import 'package:api_case/feature/post/cubit/post_state.dart';
import 'package:api_case/product/service/service_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class PostCubit extends Cubit<PostState> {
  PostCubit(this._serviceManager) : super(const PostState());

  final IServiceManager _serviceManager;

  Future<void> getPosts() async {
    emit(state.copyWith(isLoading: true));
    try {
      final posts = await _serviceManager.getPosts();
      emit(state.copyWith(posts: posts, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
