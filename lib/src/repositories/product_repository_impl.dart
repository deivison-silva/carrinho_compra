import 'package:carrinho_compra/src/models/product_model.dart';
import 'package:carrinho_compra/src/services/dio/dio_service_impl.dart';
import 'package:carrinho_compra/src/shared/expection/product_exception.dart';
import 'package:dio/dio.dart';
import './product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final DioServiceImpl _dioService;

  ProductRepositoryImpl({required DioServiceImpl dioService})
      : _dioService = dioService;

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      var request = await _dioService.getDio().get('/');
      var products = (request.data as List).map((e) => ProductModel.fromMap(e)).toList();
      return products;
    } on DioError catch (error, stacktrace) {
      throw ProductException(error: error, stackTrace: stacktrace);
    }
  }
}
