import 'package:api_case/product/model/post_model.dart';
import 'package:equatable/equatable.dart';

final class PostState extends Equatable {
  const PostState({
    this.posts,
    this.isLoading = false,
    this.error = '',
  });
  final List<PostModel>? posts;
  final bool isLoading;
  final String error;

  PostState copyWith({
    List<PostModel>? posts,
    bool? isLoading,
    String? error,
  }) {
    return PostState(
      posts: posts ?? this.posts,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [posts, isLoading, error];
}
