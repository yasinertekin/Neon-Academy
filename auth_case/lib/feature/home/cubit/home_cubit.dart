import 'package:auth_case/feature/home/cubit/state/home_state.dart';
import 'package:auth_case/product/model/comment_model.dart';
import 'package:auth_case/product/model/post_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// This is the cubit for the Home feature
final class HomeCubit extends Cubit<HomeState> {
  /// This is the constructor for the HomeCubit
  HomeCubit() : super(const HomeState(error: ''));
  final _postModel = FirebaseFirestore.instance
      .collection('products')
      .withConverter<PostModel>(
        fromFirestore: (snapshot, _) => PostModel.fromJson(snapshot.data()!),
        toFirestore: (movie, _) => movie.toJson(),
      );

  /// This method gets the posts from the Firestore database
  Future<void> getPosts() async {
    try {
      final postsSnapshot =
          await _postModel.get(); // Firestore'dan belgeleri al
      final posts = postsSnapshot.docs.map(
        (doc) {
          // Belgeyi PostModel'e dönüştür
          return doc.data();
        },
      ).toList();

      emit(state.copyWith(posts: posts)); // Durumu güncelle
    } catch (e) {
      emit(
        state.copyWith(
          error: e.toString(),
        ),
      ); // Hata durumunda durumu güncelle
    }
  }

  /// This method adds a post to the Firestore database
  /// and updates the state
  ///
  /// [post] is the post to be added
  Future<void> addPost(PostModel post) async {
    try {
      final postId = post.id;

      // Belirlediğiniz ID ile post'u ekleyin
      await _postModel.doc(postId).set(
            post,
          );

      // Ekleme işlemi başarılıysa, state'i güncelleyin
      emit(state.copyWith(posts: [...state.posts, post]));
    } catch (e) {
      // Hata durumunda, state'i hata ile güncelleyin
      emit(state.copyWith(error: e.toString()));
    }
  }

  /// Delete Post and update state
  ///
  /// [post] is the post to be deleted
  Future<void> deletePost(PostModel post) async {
    try {
      await _postModel.doc(post.id).delete();
      emit(
        state.copyWith(
          posts: state.posts.where((element) => element.id != post.id).toList(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  /// Update Post and update state
  ///
  /// [post] is the post to be updated
  Future<void> updatePost(PostModel post) async {
    try {
      await _postModel.doc(post.id).update(post.toJson());
      emit(
        state.copyWith(
          posts: state.posts.map((e) => e.id == post.id ? post : e).toList(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  /// Add Comment to Post and update state
  ///
  /// [post] is the post to be updated
  /// [comment] is the comment to be added
  Future<void> addComment(PostModel post, CommentModel comment) async {
    try {
      final postIndex =
          state.posts.indexWhere((element) => element.id == post.id);
      final updatedPost = post.copyWith(comments: [...?post.comments, comment]);
      await _postModel.doc(post.id).update(updatedPost.toJson());
      emit(
        state.copyWith(
          posts: [
            ...state.posts.sublist(0, postIndex),
            updatedPost,
            ...state.posts.sublist(postIndex + 1),
          ],
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
