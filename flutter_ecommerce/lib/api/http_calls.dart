import 'dart:convert';

import 'package:ecommerce/constant/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HTTPCalls {
  postDataWithoutToken(String url, Map body) async {
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          "Content-Type": "application/json"
        }
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } 
      throw jsonDecode(response.body)["message"];
    } catch (ex) {
      throw ex.toString();
    }
  }

  
  getDataWithToken(String url, ) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final token = sharedPreferences.get(tokenKey);

      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"   
        }
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } 
      throw jsonDecode(response.body)["message"];
    } catch (ex) {
      throw ex.toString();
    }
  }

  getDataWithoutToken(String url, ) async {
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json"
        }
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } 
      throw jsonDecode(response.body)["message"];
    } catch (ex) {
      throw ex.toString();
    }
  }

  putData(String url, Map body) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final token = sharedPreferences.get(tokenKey);
      http.Response response = await http.put(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"    
        }    
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } 
      throw jsonDecode(response.body)["message"];
    } catch (ex) {
      throw ex.toString();
    }
  }

  postData(String url, Map body) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final token = sharedPreferences.get(tokenKey);
      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"    
        }    
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } 
      throw jsonDecode(response.body)["message"];
    } catch (ex) {
      throw ex.toString();
    }
  }
}
