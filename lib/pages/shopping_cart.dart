import 'package:flutter/material.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Carrinho de compras',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Image.asset('assets/images/empty_cart.png', width: 200),
      ),
    );
  }
}
