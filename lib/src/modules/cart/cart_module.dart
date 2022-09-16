import 'package:flutter_modular/flutter_modular.dart';
import 'controllers/cart_controller.dart';
import './cart_page.dart';

class CartModule extends Module {
    @override
    final List<Bind> binds = [
      Bind.lazySingleton((i) => CartController()),
    ];
 
    @override
    final List<ModularRoute> routes = [
      ChildRoute('/', child: (_, args) => CartPage(controller: Modular.get())),
    ];
 
}