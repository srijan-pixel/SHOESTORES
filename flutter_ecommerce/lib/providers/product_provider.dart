

import 'package:ecommerce/api/http_calls.dart';
import 'package:ecommerce/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/models/product.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  static const String description =
      "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";

  final List<Products> _products = [
    
  ];

  List<Products> get products => _products;

  List<Products> searchedProducts = [];
  fetchProduct() async{
    try {
    final httpCall = HTTPCalls();
    // final sharedPreferences = await SharedPreferences.getInstance();
    final response = await httpCall.getDataWithoutToken(productsUrl, );
    for (var e in List.from(response['products'])) {
      _products.add(Products.fromJson(e));
    }
    // print(response);
    notifyListeners();
    } catch(ex) {
      throw ex.toString();
    }
  }


  searchProducts(String name) {
    searchedProducts.clear();
    searchedProducts = _products
        .where((element) => element.name.toLowerCase().contains(name))
        .toList();
  }

  filterProductByPrice(String name, double startValue, double endValue) {
    searchProducts(name);
    searchedProducts = searchedProducts
        .where(
          (element) => element.price >= startValue && element.price <= endValue,
        )
        .toList();
    notifyListeners();
  }
}
