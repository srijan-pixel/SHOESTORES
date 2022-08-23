

import 'package:flutter/cupertino.dart';


class UpdateProvider with ChangeNotifier {
  Customer? customer;

  updateCustomer(Map<String, dynamic> obj) {
    customer = Customer.fromJson(obj);
    notifyListeners();
  }
}

class Customer {
  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.isAdmin,
    required this.createdAt,
  });
  late final String id;
  late final String name;
  late final String email;
  late final bool isAdmin;
  late final String createdAt;
  
  Customer.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    isAdmin = json['isAdmin'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['isAdmin'] = isAdmin;
    _data['createdAt'] = createdAt;
    return _data;
  }
}