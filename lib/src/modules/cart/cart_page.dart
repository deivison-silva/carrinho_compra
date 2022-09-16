import 'package:flutter/material.dart';
import 'controllers/cart_controller.dart';

class CartPage extends StatefulWidget {
  final CartController controller;

  const CartPage({super.key, required this.controller});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seu Carrinho :)'),
      ),
      body: ListView.separated(
        separatorBuilder: (_, index) => const SizedBox(height: 4.0),
        itemCount: widget.controller.productsList.length,
        itemBuilder: (_, index) {
          final item = widget.controller.productsList[index];
          return Card(
            child: ListTile(
              title: Text(item.product.name),
              subtitle: Text('Preço: ${item.total}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      item.decrement();
                      setState(() {});
                    },
                  ),
                  Text("${item.quantity}"),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      item.increment();
                      setState(() {});
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red[300]),
                    onPressed: () {
                      widget.controller.removeProduct(item);
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Valor total: ', style: Theme.of(context).textTheme.headline6),
            Text(
              '${widget.controller.totalValue}',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .apply(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
