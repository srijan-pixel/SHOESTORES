import 'package:ecommerce/api/http_calls.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/providers/customer_provider.dart';
import 'package:ecommerce/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DeliveryAddressApi {
  sendDeliveryAddress( BuildContext context,String address, String city, String country, String pinCode) async{
    try {   
    final httpCall = HTTPCalls();

    final body = {
      "address": address,
      "city":city,
      "country":country,
      "postalCode":pinCode,

    };

   await  Provider.of<CartProvider>(context, listen: false).checkout(body);
    } catch(ex) {
      throw ex.toString();
    }
  }
}