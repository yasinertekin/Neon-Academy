import 'dart:io';

import 'package:auth_case/feature/auth/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SettingsView();
  }
}

final class _SettingsView extends StatefulWidget {
  const _SettingsView();

  @override
  State<_SettingsView> createState() => _SettingsViewState();
}

final class _SettingsViewState extends State<_SettingsView> {
  final _currentUser = FirebaseAuth.instance.currentUser;
  final _nameController = TextEditingController();
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _userName = _currentUser?.displayName ?? '';
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_currentUser?.photoURL != null)
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(_currentUser!.photoURL!),
              )
            else
              const Icon(Icons.account_circle, size: 100),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UpdateProfileImageButton(),
                SizedBox(width: 20),
                SignOutButton(),
              ],
            ),
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: _userName,
                  ),
                  controller: _nameController,
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_nameController.text.isEmpty) return;
                    _currentUser?.updateDisplayName(_nameController.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Name updated'),
                      ),
                    );
                    setState(() {});
                  },
                  icon: const Icon(Icons.person),
                  label: const Text('Update Name'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final class UpdateProfileImageButton extends StatefulWidget {
  const UpdateProfileImageButton({super.key});

  @override
  State<UpdateProfileImageButton> createState() =>
      _UpdateProfileImageButtonState();
}

final class _UpdateProfileImageButtonState
    extends State<UpdateProfileImageButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
        );
        if (image == null) return;
        final imagePath = image.path;
        final dateTimeNow = DateTime.now().millisecondsSinceEpoch;
        final time = dateTimeNow;

        // Resmi Firebase Storage'a yükle
        await FirebaseStorage.instance
            .ref(
              'posts/${FirebaseAuth.instance.currentUser?.uid}$time.jpg',
            )
            .putFile(
              File(imagePath),
            );

        // Resmin URL'sini al
        final imageUrl = await FirebaseStorage.instance
            .ref(
              'posts/${FirebaseAuth.instance.currentUser?.uid}$time.jpg',
            )
            .getDownloadURL();

        // Kullanıcının fotoğraf URL'sini güncelle
        await FirebaseAuth.instance.currentUser?.updatePhotoURL(imageUrl);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile photo updated'),
          ),
        );
        setState(() {});
      },
      child: const Text('Update Profile Photo'),
    );
  }
}

final class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (context) => const LoginPage()),
        );
      },
      child: const Text('Sign Out'),
    );
  }
}
