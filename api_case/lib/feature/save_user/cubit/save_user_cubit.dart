import 'package:api_case/feature/save_user/cubit/save_user_state.dart';
import 'package:api_case/product/model/users.dart';
import 'package:api_case/product/service/cache_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class SaveUserCubit extends Cubit<SaveUserState> {
  SaveUserCubit() : super(const SaveUserState(users: [], isLoading: false)) {
    initializeDatabase();
  }

  final NoteDatabase _noteDatabase = NoteDatabase();

  Future<void> saveUser(Users users) async {
    await _noteDatabase.insert(users);

    final updatedUsers =
        List<Users>.from(state.users); // Yeni bir liste oluştur
    updatedUsers.add(users); // Yeni kullanıcıyı ekle
    await _noteDatabase
        .getList(); // Belki burada bir işlem yapmanız gerekiyor mu?

    emit(state.copyWith(users: updatedUsers)); // Yeni durumu yayınla
  }

  /// initialize the list of users
  Future<void> initializeDatabase() async {
    await _noteDatabase.open();
    final users = await _noteDatabase.getList();
    emit(state.copyWith(users: users));
  }

  Future<void> deleteUser(Users user) async {
    await _noteDatabase.delete(user.id!);
    final updatedUsers = List<Users>.from(state.users);
    updatedUsers.remove(user);
    emit(state.copyWith(users: updatedUsers));
  }
}
