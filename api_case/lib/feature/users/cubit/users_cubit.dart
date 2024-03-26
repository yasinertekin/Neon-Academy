import 'package:api_case/feature/users/cubit/users_state.dart';
import 'package:api_case/product/service/food_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this._foodServie) : super(const UsersState()) {
    fetchUsers();
  }

  final IFoodServie _foodServie;

  void fetchUsers() {
    emit(state.copyWith(isLoading: true));
    _foodServie.getUsers().then((users) {
      emit(state.copyWith(users: users ?? [], isLoading: false));
    }).catchError((error) {
      emit(state.copyWith(error: error.toString(), isLoading: false));
    });
  }

  void postUsers() {
    emit(state.copyWith(isLoading: true));
    _foodServie.postUsers().then((_) {
      emit(state.copyWith(isLoading: false));
    }).catchError((error) {
      print(error);
      emit(state.copyWith(error: error.toString(), isLoading: false));
    });
  }
}
