import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_clone_mercado_livre/pages/shopping_cart.dart';
import 'package:mobx_clone_mercado_livre/widgets/product_card.dart';

class CartIconWithBadge extends StatelessWidget {
  const CartIconWithBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => const ShoppingCart())),
      child: Stack(
        children: [
          Icon(Icons.shopping_cart_outlined, color: Colors.black, size: 30),
          Positioned(
            top: 0,
            right: 0,
            child: Observer(
              builder: (_) => Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: BoxConstraints(minWidth: 16, minHeight: 16),
                alignment: Alignment.center,
                child: Text(
                  '${cartStore.itemCount}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
