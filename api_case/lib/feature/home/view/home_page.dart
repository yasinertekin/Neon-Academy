import 'package:api_case/feature/home/cubit/home_cubit.dart';
import 'package:api_case/feature/home/cubit/home_state.dart';
import 'package:api_case/product/model/recipes.dart';
import 'package:api_case/product/service/dio_manager.dart';
import 'package:api_case/product/service/food_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widget/empty_data.dart';
part 'widget/error_widget.dart';
part 'widget/food_card.dart';
part 'widget/food_list.dart';
part 'widget/loading_widget.dart';

/// Home page
final class HomePage extends StatelessWidget {
  /// Home page constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(
        FoodServiceImpl(
          service: DioManager(
            ServiceUrl.baseUrl.value,
          ).dio,
        ),
      ),
      child: const _HomeView(),
    );
  }
}

final class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const _LoadingWidget();
          }
          if (state.error.isNotEmpty) {
            return _ErrorWidget(
              error: state.error,
            );
          }
          if (state.food != null) {
            final food = state.food;
            return _FoodList(
              recipes: food!.recipes,
            );
          }
          return const _EmptyData();
        },
      ),
    );
  }
}
