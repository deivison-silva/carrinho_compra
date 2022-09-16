import 'package:carrinho_compra/src/models/product_model.dart';
import 'package:carrinho_compra/src/modules/home/controllers/home_state.dart';
import 'package:carrinho_compra/src/repositories/product_repository_impl.dart';
import 'package:flutter/foundation.dart';

class HomeController extends ValueNotifier<HomeState> {
  final ProductRepositoryImpl productRepository;

  HomeController(this.productRepository) : super(HomeInitial());

  Future<List<ProductModel>> getAllProducts() async {
    value = HomeLoading();
    try {
      var products = await productRepository.getAllProducts();
      value = HomeLoaded(products: products);
      return products;
    } catch (e) {
      value = HomeError(message: e.toString());
      rethrow;
    }
  }
}
