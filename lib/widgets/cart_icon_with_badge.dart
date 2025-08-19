import 'package:flutter/material.dart';

class CartIconWithBadge extends StatelessWidget {
  final int itemCount;
  const CartIconWithBadge({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(Icons.shopping_cart_outlined, color: Colors.black, size: 30),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: BoxConstraints(minWidth: 16, minHeight: 16),
            child: Text(
              '$itemCount',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
