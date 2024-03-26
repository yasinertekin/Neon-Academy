import 'package:api_case/feature/products/cubit/products_cubit.dart';
import 'package:api_case/feature/products/cubit/products_state.dart';
import 'package:api_case/product/service/dio_manager.dart';
import 'package:api_case/product/service/food_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (context) => ProductsCubit(
        FoodServiceImpl(
          service: DioManager(
            ServiceUrl.productsBaseUrl.value,
          ).dio,
        ),
      ),
      child: const _ProductsView(),
    );
  }
}

final class _ProductsView extends StatelessWidget {
  const _ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ProductsCubit>().postArticle();
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state.loading ?? false) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.error != null) {
                  return Center(
                    child: Text(state.error!),
                  );
                } else {
                  return ListView.builder(
                    itemCount: state.products?.length ?? 0,
                    itemBuilder: (context, index) {
                      final product = state.products?[index];
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          child: ListTile(
                            title: Text(product?.title ?? 'asd'),
                            subtitle: Text(product?.id.toString() ?? ''),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
