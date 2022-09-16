import 'package:carrinho_compra/src/repositories/product_repository_impl.dart';
import 'package:carrinho_compra/src/services/dio/dio_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/cart/cart_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => DioServiceImpl()),
        Bind.singleton((i) => ProductRepositoryImpl(dioService: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ModuleRoute('/cart', module: CartModule()),
      ];
}
