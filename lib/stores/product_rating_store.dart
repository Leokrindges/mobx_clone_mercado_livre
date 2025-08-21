import 'package:mobx/mobx.dart';

part 'product_rating_store.g.dart';

class ProductRatingStore = ProductRatingStoreBase with _$ProductRatingStore;

abstract class ProductRatingStoreBase with Store {
  @observable
  double rating = 0;

  @action
  void setRating(double value) {
    rating = value;
  }
}
