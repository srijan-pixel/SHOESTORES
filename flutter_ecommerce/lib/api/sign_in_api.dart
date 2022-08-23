import 'package:ecommerce/api/http_calls.dart';
import 'package:ecommerce/constant/constants.dart';
import 'package:ecommerce/providers/customer_provider.dart';
import 'package:ecommerce/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInApi {
  signInUser(BuildContext context,String email, String password) async{
    try {
    final body = {
      "email":email,
      "password":password
    };
    final httpCall = HTTPCalls();
    final response = await httpCall.postDataWithoutToken(loginUrl, body);
    Provider.of<CustomerProvider>(context, listen: false).updateCustomer(response);
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(tokenKey, response["token"]);
  // ignore: avoid_print
  print(response["token"]); 
    // ignore: avoid_print
    print("hello");
    } catch(ex) {
      throw ex.toString();
    }
  }
}