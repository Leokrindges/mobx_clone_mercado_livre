import 'package:flutter/material.dart';
import 'package:mobx_clone_mercado_livre/stores/cart_store.dart';
import 'package:get_it/get_it.dart';

class ShoppingCart extends StatelessWidget {
  final cartStore = GetIt.I<CartStore>();
  ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Carrinho de compras',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...cartStore.cart.asMap().entries.map(
            (entry) => Text(
              '${entry.key} - ${entry.value.title} - ${entry.value.price}',
            ),
          ),
        ],
      ),
    );
  }
}
