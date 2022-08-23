import 'dart:convert';

import 'package:ecommerce/api/http_calls.dart';
import 'package:ecommerce/urls.dart';

import '/models/product.dart';
import '/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:collection/collection.dart';

class CartProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Cart> _carts = [];
  List<Cart> get cart => _carts;

  addToCart(Products product, int numberOfItem) {
    final cart = checkIsInCart(product.id);
    if (cart != null) {
      final indexOfCart = _carts.indexOf(cart);
      _carts.removeAt(indexOfCart);
      _carts.insert(indexOfCart,
          Cart(product: product, numOfItem: cart.numOfItem + numberOfItem));
    } else {
      _carts.add(Cart(product: product, numOfItem: numberOfItem));
    }
    notifyListeners();
  }

  Cart? checkIsInCart(String id) {
    return _carts.firstWhereOrNull(
      (element) => element.product.id == id,
    );
  }

  removeFromCart(Products product) {
    final cart = checkIsInCart(product.id);
    if (cart != null) {
      _carts.remove(cart);
    }
    notifyListeners();
  }

  int gettotalCartItems() {
    if (_carts.isEmpty) {
      return 0;
    }
    var numberOfItems = 0;
    for (var element in _carts) {
      numberOfItems += element.numOfItem;
    }
    return numberOfItems;
  }

  double getTotalCartSum() {
    if (_carts.isEmpty) {
      return 0;
    }
    var sumOfItems = 0.0;
    for (var element in _carts) {
      sumOfItems += element.numOfItem * element.product.price;
    }
    return sumOfItems;
  }

  Map getPrices() {
    final shippingPrice = getTotalCartSum() > 100 ? 0 : 100;
    final taxPrice = getTotalCartSum() * 0.15;
    final totalPrice = getTotalCartSum() + shippingPrice + taxPrice;

    final map = {
      "itemsPrice": getTotalCartSum(),
      "shippingPrice": shippingPrice,
      "taxPrice": taxPrice,
      "totalPrice": totalPrice,
    };
    return map;
  }

  checkout(Map shippingAddresses)async {
    try {
    final map = {
      // "orderItems": [],
      "shippingAddress":shippingAddresses,      
      "paymentMethod": "Paypal",
      ...getPrices()
    };
    print(map);
    final httpCalls = HTTPCalls();
    final response = await httpCalls.postData(orderUrl, (map));
  }catch (ex) {
    throw ex.toString();
  }
  }
}
