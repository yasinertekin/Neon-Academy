import 'package:api_case/feature/home/cubit/home_state.dart';
import 'package:api_case/product/service/food_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._foodService) : super(const HomeState()) {
    getFood();
  }

  final IFoodServie _foodService;

  Future<void> getFood() async {
    emit(state.copyWith(isLoading: true));
    try {
      final food = await _foodService.getFood();
      emit(state.copyWith(food: food));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
    emit(state.copyWith(isLoading: false));
  }
}
