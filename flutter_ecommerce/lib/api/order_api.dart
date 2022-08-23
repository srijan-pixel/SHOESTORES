import 'package:ecommerce/api/http_calls.dart';
import 'package:ecommerce/urls.dart';

class OrderApi  {


  Future<dynamic> getOrders() async {
    final httpCalls = HTTPCalls();

    final res = await httpCalls.getDataWithToken(orderUrl);

     return res;
  }
}