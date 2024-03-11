// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:image_picker/image_picker.dart';

abstract class ImagePickerService {
  Future<String> pickImage();
  late final ImagePicker imagePicker;
}

final class ImagePickerServiceImpl implements ImagePickerService {
  @override
  final ImagePicker imagePicker = ImagePicker();

  @override
  Future<String> pickImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return image.path;
    } else {
      throw Exception('No image selected');
    }
  }

  @override
  set imagePicker(ImagePicker newImagePicker) => imagePicker = newImagePicker;
}
