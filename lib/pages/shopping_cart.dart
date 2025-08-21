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
        leading: BackButton(
          key: Key("backBtn"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Carrinho de compras',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: cartStore.cart.isEmpty
          ? Center(
              child: Image.asset(
                'assets/images/empty_cart.png',
                width: 200,
                key: ValueKey('imageCart'),
              ),
            )
          : Column(
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
