import 'package:carrinho_compra/src/models/product_model.dart';

class CartItemController {
  final ProductModel product;

  CartItemController(this.product);

  var quantity = 1;

  double get total => quantity * product.price;

  void increment() {
    if (quantity < 10) {
      quantity++;
    }
  }

  void decrement() {
    if (quantity > 1) {
      quantity--;
    }
  }

  @override
  int get hashCode => product.hashCode;

  @override
  bool operator ==(other) => other is CartItemController && other.product == product;
}
