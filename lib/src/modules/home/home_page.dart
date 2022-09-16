import 'package:carrinho_compra/src/modules/cart/cart_page.dart';
import 'package:carrinho_compra/src/modules/cart/controllers/cart_item_controller.dart';
import 'package:carrinho_compra/src/modules/home/controllers/home_controller.dart';
import 'package:carrinho_compra/src/modules/home/controllers/home_state.dart';
import 'package:flutter/material.dart';
import '../cart/controllers/cart_controller.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;
  final CartController cartController;

  const HomePage({
    Key? key,
    required this.controller,
    required this.cartController,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.controller.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho de Compras'),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(
                  Icons.shopping_cart,
                  size: 32.0,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    radius: 9.0,
                    child: Text(
                      widget.cartController.itemsCart.toString(),
                      style: const TextStyle(fontSize: 8.0),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(controller: widget.cartController),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lista de Produtos',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24.0),
            Expanded(
              child: ValueListenableBuilder<HomeState>(
                valueListenable: widget.controller,
                builder: (context, value, __) {
                  if (value is HomeLoading) {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  }
                  if (value is HomeLoaded) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemCount: value.products.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.network(
                                value.products[index].image,
                                width: 150.0,
                                height: 150.0,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(value.products[index].name),
                            const SizedBox(height: 8.0),
                            Expanded(
                                child: Text(value.products[index].description)),
                            const SizedBox(height: 8.0),
                            Text(value.products[index].price.toString()),
                            const SizedBox(height: 8.0),
                            Row(
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    if (widget.cartController
                                        .contains(value.products[index])) {
                                      widget.cartController.removeProduct(
                                          CartItemController(
                                              value.products[index]));
                                      setState(() {});
                                    } else {
                                      widget.cartController
                                          .addProduct(value.products[index]);
                                      setState(() {});
                                    }
                                  },
                                  label: const Text('Adicionar'),
                                  icon: Icon(
                                    widget.cartController
                                            .contains(value.products[index])
                                        ? Icons.remove_shopping_cart_rounded
                                        : Icons.add_shopping_cart_rounded,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  }
                  if (value is HomeError) {
                    return const Center(
                      child: Text('Erro ao obter os produtos :(.'),
                    );
                  }
                  return const Center(
                      child: Text('Lista de produtos está vazia :(.'));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
