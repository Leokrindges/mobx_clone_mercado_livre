class Product {
  String imagePath;
  String title;
  String price;
  String installment;
  String shipping;
  String colors;
  int rating;
  int maxRating;

  Product({
    required this.imagePath,
    required this.title,
    required this.price,
    required this.installment,
    required this.shipping,
    required this.colors,
    required this.rating,
    this.maxRating = 5,
  });
}
