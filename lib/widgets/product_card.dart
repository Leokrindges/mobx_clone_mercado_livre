import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mobx_clone_mercado_livre/models/product.model.dart';
import 'package:mobx_clone_mercado_livre/stores/cart_store.dart';
import 'package:mobx_clone_mercado_livre/stores/product_rating_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_clone_mercado_livre/widgets/installment_text.dart';

final cartStore = GetIt.I<CartStore>();

class ProductCard extends StatelessWidget {
  final Product product;
  final ProductRatingStore ratingStore;

  const ProductCard({
    super.key,
    required this.product,
    required this.ratingStore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: ValueKey('productItem'),
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
                    child: Image.asset(
                      product.imagePath,
                      key: ValueKey('productImage'),
                    ),
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
                      'R\$ ${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InstallmentText(total: product.price, times: 10),
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
                    Observer(
                      builder: (_) => RatingBar.builder(
                        initialRating: ratingStore.rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemBuilder: (context, _) =>
                            Icon(Icons.star, color: Colors.blue),
                        onRatingUpdate: ratingStore.setRating,
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            if (cartStore.isInCart(product)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Produto não adicionado!',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  showCloseIcon: true,
                                  duration: Duration(seconds: 2),
                                  closeIconColor: Colors.black,
                                  backgroundColor: Color(0xFFE57373),
                                ),
                              );
                            } else {
                              cartStore.addToCart(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Produto adicionado!',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  closeIconColor: Colors.black,
                                  showCloseIcon: true,
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Colors.yellow[300],
                                ),
                              );
                            }
                          },
                          child: Text(
                            key: ValueKey('addProductToCart'),
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
