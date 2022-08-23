import 'package:ecommerce/constant/color_properties.dart';
import 'package:ecommerce/constant/constants.dart';
import 'package:flutter/material.dart';



class HeaderLabel extends StatelessWidget {
  final String ?headerText;
  const HeaderLabel({
    Key ?key, this.headerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Text(
        headerText!,
        style: const TextStyle(color: kLightColor, fontSize: 28.0),
      ),
    );
  }
}