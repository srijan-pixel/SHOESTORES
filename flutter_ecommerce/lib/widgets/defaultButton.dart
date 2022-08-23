
// ignore_for_file: deprecated_member_use

import 'package:ecommerce/constant/color_properties.dart';
import 'package:ecommerce/constant/constants.dart';
import 'package:flutter/material.dart';

class DefaultBttn extends StatelessWidget {
  final String btnText;
  final VoidCallback onPressed;
  const DefaultBttn({
    Key? key, required this.btnText, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: FlatButton(
        padding: const EdgeInsets.symmetric(vertical: kLessPadding),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kShape)),
        color: secondaryColor,
        textColor: kWhiteColor,
        highlightColor: kTransparent,
        onPressed: onPressed,
        child: Text(btnText.toUpperCase()),
      ),
    );
  }
}