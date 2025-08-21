import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobx_clone_mercado_livre/widgets/search_input_widget.dart';
import 'package:mobx_clone_mercado_livre/widgets/cart_icon_with_badge.dart';
import 'package:mobx_clone_mercado_livre/widgets/cep_info_row.dart';
import 'package:mobx_clone_mercado_livre/widgets/product_card.dart';
import 'package:mobx_clone_mercado_livre/models/product.model.dart';
import 'package:mobx_clone_mercado_livre/stores/product_rating_store.dart';

class ListProducts extends StatefulWidget {
  const ListProducts({super.key});

  @override
  State<ListProducts> createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  bool _loading = true;

  final List<Product> produtos = List.generate(
    15,
    (index) => Product(
      id: Random().nextInt(1000),
      imagePath: 'assets/images/iphone.png',
      title: 'Apple Iphone 11 Pro (128gb) - Preto',
      price: 'R\$ ${599.99 * (index + 1)}',
      installment:
          'Em 10x de R\$ ${((599.99 * (index + 1)) / 10).toStringAsFixed(2)} sem juros',
      shipping: 'Frete Grátis',
      colors: 'Disponível em 6 cores',
      maxRating: 5,
    ),
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: SearchInputWidget()),
                SizedBox(width: 10),
                CartIconWithBadge(),
              ],
            ),
            SizedBox(height: 10),
            CepInfoRow(),
          ],
        ),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator(color: Colors.yellow))
          : Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: SizedBox(
                    height: 55,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('15 resultados', style: TextStyle(fontSize: 16)),
                          Row(
                            children: [
                              Text(
                                'Filtrar (2)',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.expand_more,
                                size: 22,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: produtos.length,
                    itemBuilder: (context, index) {
                      final produto = produtos[index];
                      final ratingStore = ProductRatingStore();
                      return ProductCard(
                        product: produto,
                        ratingStore: ratingStore,
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
