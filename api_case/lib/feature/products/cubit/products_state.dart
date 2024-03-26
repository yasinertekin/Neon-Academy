import 'package:api_case/product/model/products.dart';
import 'package:equatable/equatable.dart';

final class ProductsState extends Equatable {
  const ProductsState({
    this.products = const <Products>[],
    this.error,
    this.loading = false,
  });

  final List<Products>? products;
  final String? error;
  final bool? loading;

  ProductsState copyWith({
    List<Products>? products,
    String? error,
    bool? loading,
  }) {
    return ProductsState(
      products: products ?? this.products,
      error: error ?? this.error,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [products, error, loading];
}
