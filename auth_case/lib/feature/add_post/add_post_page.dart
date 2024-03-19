import 'dart:io';

import 'package:auth_case/feature/home/cubit/home_cubit.dart';
import 'package:auth_case/product/model/post_model.dart';
import 'package:auth_case/product/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

final class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AddPostView();
  }
}

final class _AddPostView extends StatefulWidget {
  const _AddPostView({super.key});

  @override
  State<_AddPostView> createState() => _AddPostViewState();
}

final class _AddPostViewState extends State<_AddPostView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _imagePicker = ImagePicker();
  String _imagePath = '';
  String _imageUrl = '';
  int _time = 0;

  /// Firebase storage
  final _storage = FirebaseStorage.instance;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _bodyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            Wrap(
              children: [
                IconButton(
                  onPressed: () async {
                    final image = await _imagePicker.pickImage(
                      source: ImageSource.camera,
                    );
                    if (image == null) return;
                    _imagePath = image.path;

                    setState(() {});
                  },
                  icon: const Icon(Icons.camera_alt),
                ),
                IconButton(
                  onPressed: () async {
                    final image = await _imagePicker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (image == null) return;
                    setState(() {
                      _imagePath = image.path;
                    });
                  },
                  icon: const Icon(Icons.image),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_imagePath.isNotEmpty)
              Image.file(
                File(_imagePath),
                height: 200,
                width: 200,
              ),
            _CustomForm(
              formKey: _formKey,
              titleController: _titleController,
              bodyController: _bodyController,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  _imagePath.isEmpty
                      ? ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select an image'),
                          ),
                        )
                      : null;

                  if (_formKey.currentState?.validate() ??
                      true && _imagePath.isNotEmpty) {
                    final dateTime = DateTime.now().microsecondsSinceEpoch;
                    _time = dateTime;
                    await _storage.ref('posts/$_time').putFile(
                          File(_imagePath),
                        );
                    _imageUrl =
                        await _storage.ref('posts/$_time').getDownloadURL();
                    await context.read<HomeCubit>().addPost(
                          PostModel(
                            title: _titleController.text,
                            body: _bodyController.text,
                            imageUrl: _imageUrl,
                            comments: const [],
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
                  }
                },
                child: const Text('Add Post'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomForm extends StatelessWidget {
  const _CustomForm({
    required GlobalKey<FormState> formKey,
    required TextEditingController titleController,
    required TextEditingController bodyController,
    super.key,
  })  : _formKey = formKey,
        _titleController = titleController,
        _bodyController = bodyController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _titleController;
  final TextEditingController _bodyController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _PostTitle(
            titleController: _titleController,
          ),
          _PostBody(
            bodyController: _bodyController,
          ),
        ],
      ),
    );
  }
}

class _PostBody extends StatelessWidget {
  const _PostBody({
    required this.bodyController,
    super.key,
  });
  final TextEditingController bodyController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: bodyController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Post Body',
      ),
    );
  }
}

class _PostTitle extends StatelessWidget {
  const _PostTitle({
    required this.titleController,
    super.key,
  });

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: titleController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Post Title',
      ),
    );
  }
}
