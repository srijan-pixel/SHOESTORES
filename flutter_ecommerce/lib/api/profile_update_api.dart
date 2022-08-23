import 'package:ecommerce/api/http_calls.dart';
import 'package:ecommerce/providers/customer_provider.dart';
import 'package:ecommerce/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProfileUpdateApi {
  updateProfile(BuildContext context,String name, String email, String password) async{
    try {
    final body = {
      "name": name,
      "email":email,
      "password":password
    };
    final httpCall = HTTPCalls();

    final response = await httpCall.putData(profileUrl, body);
    
    Provider.of<CustomerProvider>(context, listen: false).updateCustomer(response);
    } catch(ex) {
      throw ex.toString();
    }
  }
}