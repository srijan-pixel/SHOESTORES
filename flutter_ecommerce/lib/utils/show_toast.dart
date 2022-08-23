import 'package:fluttertoast/fluttertoast.dart';


void showToast({required String text}) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
  );
}
