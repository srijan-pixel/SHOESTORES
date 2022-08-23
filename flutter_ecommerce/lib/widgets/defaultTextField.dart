import 'package:ecommerce/constant/color_properties.dart';
import 'package:ecommerce/constant/constants.dart';

import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String ?hintText;
  final IconData ?icon;
  final keyboardType, obscureText;
  const DefaultTextField({
    Key? key,
    this.hintText,
    this.icon,
    this.keyboardType,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(kShape)),
        color: kAccentColor,
      ),
      child: TextField(
        cursorColor: kPrimaryColor,
        textInputAction: TextInputAction.next,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(icon, color: kPrimaryColor),
          hintText: hintText,
        ),
      ),
    );
  }
}
