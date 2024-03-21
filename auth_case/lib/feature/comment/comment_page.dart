import 'package:auth_case/product/model/comment_model.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({required this.comments, super.key});
  final List<CommentModel>? comments;

  @override
  Widget build(BuildContext context) {
    return _CommentView(
      comments: comments,
    );
  }
}

class _CommentView extends StatelessWidget {
  const _CommentView({
    required this.comments,
    super.key,
  });

  final List<CommentModel>? comments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: ListView.builder(
        itemCount: comments?.length ?? 0,
        itemBuilder: (context, index) {
          final commentIndex = comments!.length - 1 - index;
          final comment = comments![commentIndex];
          return ListTile(
            title: Text(comment.comment ?? ''),
            trailing: Text(comment.user?.name ?? ''),
            subtitle: Text(comment.user?.email ?? ''),
          );
        },
      ),
    );
  }
}
