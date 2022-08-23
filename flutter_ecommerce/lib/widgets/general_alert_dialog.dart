import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralAlertDialog {
  showAlertDialog(String message, BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Ok"),
          ),
        ],
      ),
    );
  }

  showLoadingDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Row(
          children: const [
            CircularProgressIndicator(),
            SizedBox(width: 10,),
            Text("Loading")
          ],
        ),
      ),
    );
  }
}
