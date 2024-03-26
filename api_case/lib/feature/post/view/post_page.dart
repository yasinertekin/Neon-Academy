import 'package:api_case/feature/post/cubit/post_cubit.dart';
import 'package:api_case/feature/post/cubit/post_state.dart';
import 'package:api_case/product/service/service_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

final class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostCubit>(
      create: (context) => PostCubit(
        ServiceManager(
          http.Client(),
        ),
      ),
      child: const _PostView(),
    );
  }
}

final class _PostView extends StatelessWidget {
  const _PostView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: const Column(
        children: <Widget>[
          _PostListsBuilder(),
          _GetPostsListButton(),
        ],
      ),
    );
  }
}

final class _GetPostsListButton extends StatelessWidget {
  const _GetPostsListButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<PostCubit>().getPosts();
      },
      child: const Text('Load Posts'),
    );
  }
}

final class _PostListsBuilder extends StatelessWidget {
  const _PostListsBuilder();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.error.isNotEmpty) {
            return Center(
              child: Text(state.error),
            );
          } else if (state.posts == null) {
            return const Center(
              child: Text('No data'),
            );
          } else {
            return ListView.builder(
              itemCount: state.posts!.length,
              itemBuilder: (context, index) {
                final post = state.posts![index];
                return ListTile(
                  title: Text(post.title!),
                  subtitle: Text(post.body!),
                );
              },
            );
          }
        },
      ),
    );
  }
}
