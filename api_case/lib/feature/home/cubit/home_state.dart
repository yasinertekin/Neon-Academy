import 'package:api_case/product/model/food.dart';
import 'package:equatable/equatable.dart';

final class HomeState extends Equatable {
  const HomeState({
    this.error = '',
    this.food,
    this.isLoading = false,
  });
  final String error;

  final Food? food;

  final bool isLoading;

  HomeState copyWith({
    String? error,
    Food? food,
    bool? isLoading,
  }) {
    return HomeState(
      error: error ?? this.error,
      food: food ?? this.food,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [error, food, isLoading];
}
