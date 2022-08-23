import 'package:ecommerce/api/http_calls.dart';
import 'package:ecommerce/urls.dart';

class SignUpApi {
  signUpUser(String name, String email, String password) async{
    try {
    final body = {
      "name": name,
      "email":email,
      "password":password
    };
    final httpCall = HTTPCalls();
    return await httpCall.postDataWithoutToken(userUrl, body);
    } catch(ex) {
      throw ex.toString();
    }
  }
}