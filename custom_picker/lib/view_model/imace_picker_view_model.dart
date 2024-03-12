import 'package:custom_picker/model/users.dart';
import 'package:custom_picker/service/image_picker_service.dart';
import 'package:flutter/material.dart';

/// [ImagePickerViewmodel] is a [ChangeNotifier] class that provides the
/// functionality to pick an image from the gallery.
final class ImagePickerViewmodel extends ChangeNotifier {
  /// [ImagePickerViewmodel] requires an [ImagePickerService] to pick an image.
  ImagePickerViewmodel({required this.imagePickerService});

  /// [imagePickerService] is the service used to pick an image.
  final ImagePickerService imagePickerService;

  String? _imagePath;

  /// [imagePath] is the path of the picked image.
  String? get imagePath => _imagePath;

  /// [pickImage] is a method that picks an image from the gallery.
  Future<void> pickImage() async {
    final imagePath = await imagePickerService.pickImage();
    if (imagePath != null) {
      _imagePath = imagePath;
      notifyListeners();
    }
  }

  Users users = Users(
    name: 'John Doe',
    age: DateTime.now(),
    imagePath: '',
    fontStyle: FontStyle.normal,
    backgroundColor: '0XFFFFFFFF',
  );

  ///update age
  void updateAge(DateTime age) {
    users = users.copyWith(age: age);
    notifyListeners();
  }

  /// update users photo
  void updatePhoto(String imagePath) {
    users = users.copyWith(imagePath: imagePath);
    notifyListeners();
  }

  /// update font style
  void updateFontStyle(FontStyle fontStyle) {
    users = users.copyWith(fontStyle: fontStyle);
    notifyListeners();
  }

  /// update background color
  void updateBackgroundColor(String backgroundColor) {
    users = users.copyWith(backgroundColor: backgroundColor);
    notifyListeners();
  }
}
