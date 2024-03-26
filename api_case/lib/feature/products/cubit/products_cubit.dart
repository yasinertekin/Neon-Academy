import 'package:api_case/feature/products/cubit/products_state.dart';
import 'package:api_case/product/service/food_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._productsService) : super(const ProductsState()) {
    getProducts();
  }

  final IFoodServie _productsService;

  Future<void> getProducts() async {
    emit(state.copyWith(loading: true));
    try {
      final products = await _productsService.getProducts();
      emit(state.copyWith(products: products, loading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> postArticle() async {
    emit(state.copyWith(loading: true));
    try {
      await _productsService.postProducts();
      emit(state.copyWith(loading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
