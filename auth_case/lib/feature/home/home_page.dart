import 'dart:io';

import 'package:auth_case/feature/add_post/add_post_page.dart';
import 'package:auth_case/feature/auth/login_page.dart';
import 'package:auth_case/feature/home/cubit/home_cubit.dart';
import 'package:auth_case/feature/home/cubit/state/home_state.dart';
import 'package:auth_case/product/model/comment_model.dart';
import 'package:auth_case/product/model/post_model.dart';
import 'package:auth_case/product/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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
  final _imagePicker = ImagePicker();

  String _imagePath = '';
  String _imageUrl = '';
  final int _time = 0;
  final _storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => const AddPostPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: const _HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                final image = await _imagePicker.pickImage(
                  source: ImageSource.gallery,
                );
                if (image == null) return;
                _imagePath = image.path;

                // Resmi Firebase Storage'a yükle
                await _storage
                    .ref('posts/${FirebaseAuth.instance.currentUser?.uid}.jpg')
                    .putFile(
                      File(_imagePath),
                    );

                // Resmin URL'sini al
                _imageUrl = await _storage
                    .ref('posts/${FirebaseAuth.instance.currentUser?.uid}.jpg')
                    .getDownloadURL();

                // Kullanıcının fotoğraf URL'sini güncelle
                await FirebaseAuth.instance.currentUser
                    ?.updatePhotoURL(_imageUrl);

                setState(() {});
              },
              child: const Text('Update Profile Photo'),
            ),
            const SizedBox(height: 10),
            Center(
              child: BlocBuilder<HomeCubit, HomeState>(
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
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.builder(
                      reverse: true,
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) {
                        final post = state.posts[index];
                        return _PostCard(post: post);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
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
      leading: FirebaseAuth.instance.currentUser?.photoURL != null &&
              FirebaseAuth.instance.currentUser?.photoURL?.isNotEmpty == true
          ? CircleAvatar(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    FirebaseAuth.instance.currentUser?.photoURL ?? '',
                    height: 300,
                    width: 300,
                  ),
                ),
              ),
            )
          : const CircleAvatar(
              child: Icon(Icons.person),
            ),
      title: Text(
        FirebaseAuth.instance.currentUser?.displayName ?? '',
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => const LoginPage(),
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
