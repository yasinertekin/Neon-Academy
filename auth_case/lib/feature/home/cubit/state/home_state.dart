import 'package:auth_case/product/model/post_model.dart';
import 'package:equatable/equatable.dart';

/// This is the state for the Home Cubit
final class HomeState extends Equatable {
  /// This is the constructor for the HomeState
  const HomeState({
    required this.error,
    this.posts = const [],
    this.isLoading = false,
  });

  /// This is the list of posts
  final List<PostModel> posts;

  /// This is the loading state
  final bool isLoading;

  /// This is the error message
  final String error;

  /// This is the copyWith method
  HomeState copyWith({
    List<PostModel>? posts,
    bool? isLoading,
    String? error,
  }) {
    return HomeState(
      posts: posts ?? this.posts,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [posts, isLoading, error];
}
