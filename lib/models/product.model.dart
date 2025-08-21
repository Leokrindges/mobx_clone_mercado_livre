import 'package:mobx/mobx.dart';

class Product {
  int id;
  String imagePath;
  String title;
  double price;
  String installment;
  String shipping;
  String colors;
  Observable<double> rating = Observable(0);
  int maxRating;

  Product({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.installment,
    required this.shipping,
    required this.colors,
    this.maxRating = 5,
    double initialRating = 0,
  }) : rating = Observable(initialRating);
}
