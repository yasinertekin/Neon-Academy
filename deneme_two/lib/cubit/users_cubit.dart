import 'package:deneme_two/model/users.dart';
import 'package:deneme_two/service/image_picker_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class UsersCubit extends Cubit<Users> {
  UsersCubit(this.imagePickerService)
      : super(
          Users(
            age: DateTime(2000),
            imageUrl: '',
            name: '',
          ),
        );

  void changeAge(DateTime age) => emit(state.copyWith(age: age));
  void changeImageUrl(String imageUrl) =>
      emit(state.copyWith(imageUrl: imageUrl));
  void changeName(String name) => emit(state.copyWith(name: name));

  ImagePickerService imagePickerService;

  Future<String> pickImage() async {
    final imageUrl = await imagePickerService.pickImage();
    emit(state.copyWith(imageUrl: imageUrl));
    return imageUrl;
  }
}
