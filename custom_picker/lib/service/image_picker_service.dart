import 'package:image_picker/image_picker.dart';

/// [ImagePickerService] is a mixin that provides a method to pick an image.
mixin ImagePickerService {
  /// [pickImage] is a method that returns a [Future] of [String]
  /// that represents
  Future<String?> pickImage();
}

/// [ImagePickerServiceImpl] is a class that implements [ImagePickerService].
final class ImagePickerServiceImpl implements ImagePickerService {
  /// [imagePicker] is an instance of [ImagePicker].
  final imagePicker = ImagePicker();

  @override
  Future<String?> pickImage() async {
    try {
      final pickedFile =
          await imagePicker.pickImage(source: ImageSource.gallery);
      return pickedFile?.path;
    } on Exception catch (e) {
      print('Error: $e');
    }
    return null;
  }
}
