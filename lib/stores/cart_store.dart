import 'package:mobx/mobx.dart';
import 'package:mobx_clone_mercado_livre/models/product.model.dart';

part 'cart_store.g.dart';

class CartStore = CartStoreBase with Store;

abstract class CartStoreBase with Store {
  @observable
  ObservableList<Product> cart = ObservableList<Product>();

  @computed
  int get itemCount => cart.length;

  @action
  bool addToCart(Product product) {
    if (cart.any((p) => p.id == product.id)) {
      return false;
    }
    cart.add(product);
    return true;
  }

  @action
  bool isInCart(Product product) {
    return cart.any((p) => p.id == product.id);
  }
}
