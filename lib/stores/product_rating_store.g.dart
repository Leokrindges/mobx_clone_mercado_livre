// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_rating_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductRatingStore on ProductRatingStoreBase, Store {
  late final _$ratingAtom = Atom(
    name: 'ProductRatingStoreBase.rating',
    context: context,
  );

  @override
  double get rating {
    _$ratingAtom.reportRead();
    return super.rating;
  }

  @override
  set rating(double value) {
    _$ratingAtom.reportWrite(value, super.rating, () {
      super.rating = value;
    });
  }

  late final _$ProductRatingStoreBaseActionController = ActionController(
    name: 'ProductRatingStoreBase',
    context: context,
  );

  @override
  void setRating(double value) {
    final _$actionInfo = _$ProductRatingStoreBaseActionController.startAction(
      name: 'ProductRatingStoreBase.setRating',
    );
    try {
      return super.setRating(value);
    } finally {
      _$ProductRatingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rating: ${rating}
    ''';
  }
}
