import 'package:carrinho_compra/src/models/product_model.dart';
import 'package:carrinho_compra/src/modules/cart/controllers/cart_item_controller.dart';

class CartController {
  var productsList = <CartItemController>[];

  int get itemsCart => productsList.length;

  double get totalValue => productsList.fold(
      0.0,
      (double previousValue, element) =>
          previousValue + (element.product.price * element.quantity));

  void addProduct(ProductModel product) {
    productsList.add(CartItemController(product));
  }

  void removeProduct(CartItemController product) {
    productsList.remove(product);
  }

  bool contains(ProductModel product) {
    if (productsList.contains(CartItemController(product))) {
      return true;
    }
    return false;
  }
}
