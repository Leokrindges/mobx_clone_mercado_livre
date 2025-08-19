import 'package:flutter/material.dart';
import 'package:mobx_clone_mercado_livre/widgets/search_input_widget.dart';
import 'package:mobx_clone_mercado_livre/widgets/cart_icon_with_badge.dart';
import 'package:mobx_clone_mercado_livre/widgets/cep_info_row.dart';

class ListProducts extends StatelessWidget {
  const ListProducts({super.key});

  @override
  Widget build(BuildContext context) {
    int cartItemCount = 0;
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
                CartIconWithBadge(itemCount: cartItemCount),
              ],
            ),
            SizedBox(height: 10),
            CepInfoRow(),
          ],
        ),
      ),
      body: Center(child: Text('No products available')),
    );
  }
}
