import '/models/product.dart';
import '/models/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:collection/collection.dart';

class WishListProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<WishList> _wishlists = [];
  List<WishList> get wishlists => _wishlists;

  addToWishList(
    Products product,
  ) {
    final wishListItem = checkIsInWishList(product.id);
    if (wishListItem != null) {
      final indexOfWishList = _wishlists.indexOf(wishListItem);
      _wishlists.removeAt(indexOfWishList);
    } else {
      _wishlists.add(
        WishList(product),
      );
    }
    notifyListeners();
  }

  WishList? checkIsInWishList(String id) {
    return _wishlists.firstWhereOrNull(
      (element) => element.product.id == id,
    );
  }

  removeFromWishList(Products product) {
    final wishListItem = checkIsInWishList(product.id);
    if (wishListItem != null) {
      _wishlists.remove(wishListItem);
    }
    notifyListeners();
  }
}
