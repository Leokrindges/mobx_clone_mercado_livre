import 'package:flutter/material.dart';
import 'package:mobx_clone_mercado_livre/pages/list_products.dart';
import 'package:mobx_clone_mercado_livre/stores/cart_store.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerSingleton<CartStore>(CartStore());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: const ListProducts(),
      debugShowCheckedModeBanner: false,
    );
  }
}
