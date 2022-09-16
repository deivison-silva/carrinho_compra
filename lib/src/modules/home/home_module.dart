import 'package:carrinho_compra/src/modules/cart/controllers/cart_controller.dart';
import 'package:carrinho_compra/src/modules/home/controllers/home_controller.dart';
import 'package:carrinho_compra/src/modules/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeController(i())),
        Bind.lazySingleton((i) => CartController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => HomePage(
            controller: Modular.get(),
            cartController: Modular.get(),
          ),
        ),
      ];
}
