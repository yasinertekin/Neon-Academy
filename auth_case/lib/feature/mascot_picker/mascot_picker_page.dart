import 'dart:io';

import 'package:auth_case/feature/mascot_download_page/mascot_download_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final class MascotPickerPage extends StatelessWidget {
  const MascotPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _MascotPickerView();
  }
}

final class _MascotPickerView extends StatefulWidget {
  const _MascotPickerView();

  @override
  State<_MascotPickerView> createState() => _MascotPickerViewState();
}

class _MascotPickerViewState extends State<_MascotPickerView> {
  String _imageFolderPath = '';
  String _imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mascot Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Mascot Picker'),
            const SizedBox(height: 20),
            if (_imageFolderPath.isNotEmpty)
              Image.file(File(_imageFolderPath))
            else
              const Icon(Icons.account_circle, size: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final image = await ImagePicker().pickImage(
                        source: ImageSource.gallery,
                      );
                      if (image == null) return;
                      _imageFolderPath = image.path;
                      setState(() {});
                    },
                    child: const Text('Pick Mascot Image'),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final dateTimeNow = DateTime.now().millisecondsSinceEpoch;
                      final time = dateTimeNow;
                      // Resmi Firebase Storage'a yükle
                      await FirebaseStorage.instance
                          .ref(
                            'posts/${FirebaseAuth.instance.currentUser?.uid}$time.jpg',
                          )
                          .putFile(
                            File(_imageFolderPath),
                          );
                      // Resmin URL'sini al
                      final imageUrl = await FirebaseStorage.instance
                          .ref(
                            'posts/${FirebaseAuth.instance.currentUser?.uid}$time.jpg',
                          )
                          .getDownloadURL();
                      _imageUrl = imageUrl;
                      setState(() {});
                    },
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _imageUrl.isEmpty
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) {
                            return MascotDownloadPage(imageUrl: _imageUrl);
                          },
                        ),
                      );
                    },
              child: const Text('Go to Mascot Download Page'),
            ),
          ],
        ),
      ),
    );
  }
}
