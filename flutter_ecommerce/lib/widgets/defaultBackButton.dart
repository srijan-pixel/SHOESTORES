import 'package:ecommerce/constant/color_properties.dart';
import 'package:flutter/material.dart';



class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: secondaryColor),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}