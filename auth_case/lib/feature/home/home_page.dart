import 'package:auth_case/feature/add_post/add_post_page.dart';
import 'package:auth_case/feature/home/cubit/home_cubit.dart';
import 'package:auth_case/feature/home/cubit/state/home_state.dart';
import 'package:auth_case/feature/settings/settings_page.dart';
import 'package:auth_case/product/model/comment_model.dart';
import 'package:auth_case/product/model/post_model.dart';
import 'package:auth_case/product/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeView();
  }
}

final class _HomeView extends StatefulWidget {
  const _HomeView({super.key});

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _HomeAppBar(),
      floatingActionButton: const _AddPostFloatingActionButton(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.error.isNotEmpty) {
            return Text(state.error);
          }
          if (state.posts.isEmpty) {
            return const Text('No posts');
          }
          return ListView.builder(
            reverse: true,
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              final post = state.posts[index];
              return _PostCard(post: post);
            },
          );
        },
      ),
    );
  }
}

final class _AddPostFloatingActionButton extends StatelessWidget {
  const _AddPostFloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => const AddPostPage(),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}

final class _PostCard extends StatelessWidget {
  const _PostCard({
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.network(
              post.imageUrl ?? '',
              height: 200,
              width: 200,
            ),
            _PostTitle(post: post),
            const SizedBox(height: 10),
            _CommentList(post: post),
            _AddCommandButton(
              post,
            ),
          ],
        ),
      ),
    );
  }
}

final class _PostTitle extends StatelessWidget {
  const _PostTitle({
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          post.title ?? '',
        ),
      ),
    );
  }
}

final class _AddCommandButton extends StatefulWidget {
  const _AddCommandButton(
    this.post,
  );
  final PostModel post;

  @override
  State<_AddCommandButton> createState() => _AddCommandButtonState();
}

class _AddCommandButtonState extends State<_AddCommandButton> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog<void>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Add Comment'),
              content: TextField(
                controller: _commentController,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    context.read<HomeCubit>().addComment(
                          widget.post,
                          CommentModel(
                            id: '',
                            comment: _commentController.text,
                            user: UserModel(
                              id: FirebaseAuth.instance.currentUser?.uid ?? '',
                              name: FirebaseAuth
                                      .instance.currentUser?.displayName ??
                                  '',
                              email: FirebaseAuth.instance.currentUser?.email ??
                                  '',
                              password: '',
                            ),
                          ),
                        );
                  },
                  child: const Text('Add'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      },
      child: const Text('Add Comment'),
    );
  }
}

final class _CommentList extends StatelessWidget {
  const _CommentList({
    required this.post,
    super.key,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.13,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: post.comments?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            trailing: Text(
              post.comments?[index].user?.email ?? 'sdf',
            ),
            title: Text(
              post.comments?[index].comment ?? '',
            ),
          );
        },
      ),
    );
  }
}

final class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: FirebaseAuth.instance.currentUser?.photoURL != null
            ? CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  FirebaseAuth.instance.currentUser!.photoURL!,
                ),
              )
            : const Icon(Icons.account_circle, size: 40),
      ),
      title: Text(
        FirebaseAuth.instance.currentUser?.displayName ?? '',
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => const SettingsPage(),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
