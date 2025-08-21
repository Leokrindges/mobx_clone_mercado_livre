// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin $CartStore on CartStoreBase, Store {
  Computed<int>? _$itemCountComputed;

  @override
  int get itemCount => (_$itemCountComputed ??= Computed<int>(
    () => super.itemCount,
    name: 'CartStoreBase.itemCount',
  )).value;

  late final _$cartAtom = Atom(name: 'CartStoreBase.cart', context: context);

  @override
  ObservableList<Product> get cart {
    _$cartAtom.reportRead();
    return super.cart;
  }

  @override
  set cart(ObservableList<Product> value) {
    _$cartAtom.reportWrite(value, super.cart, () {
      super.cart = value;
    });
  }

  late final _$CartStoreBaseActionController = ActionController(
    name: 'CartStoreBase',
    context: context,
  );

  @override
  bool addToCart(Product product) {
    final _$actionInfo = _$CartStoreBaseActionController.startAction(
      name: 'CartStoreBase.addToCart',
    );
    try {
      return super.addToCart(product);
    } finally {
      _$CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isInCart(Product product) {
    final _$actionInfo = _$CartStoreBaseActionController.startAction(
      name: 'CartStoreBase.isInCart',
    );
    try {
      return super.isInCart(product);
    } finally {
      _$CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cart: ${cart},
itemCount: ${itemCount}
    ''';
  }
}
