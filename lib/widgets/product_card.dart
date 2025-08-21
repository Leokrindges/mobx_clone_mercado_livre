import 'package:flutter/material.dart';
import 'package:mobx_clone_mercado_livre/models/product.model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onAddCart;

  const ProductCard({super.key, required this.product, this.onAddCart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Colors.white,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    color: Colors.grey[350],
                    width: 150,
                    height: 200,
                    child: Image.asset(product.imagePath),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title, style: TextStyle(fontSize: 14)),
                    Text(
                      product.price,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(product.installment, style: TextStyle(fontSize: 12)),
                    Text(
                      product.shipping,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      product.colors,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < product.rating; i++) ...[
                          Icon(Icons.star, size: 16, color: Colors.blue),
                          SizedBox(width: 4),
                        ],
                        for (
                          int i = product.rating;
                          i < product.maxRating;
                          i++
                        ) ...[
                          Icon(Icons.star, size: 16, color: Colors.grey),
                          SizedBox(width: 4),
                        ],
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                padding: EdgeInsets.only(
                                  bottom: 20.0,
                                  left: 15.0,
                                ),
                                content: Text(
                                  'Produto adicionado!',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                showCloseIcon: true,
                                closeIconColor: Colors.black,
                                backgroundColor: Colors.yellow,
                              ),
                            );
                            if (onAddCart != null) onAddCart!();
                          },
                          child: Text(
                            'Add carrinho',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
