import 'package:ecommerce/constant/constants.dart';
import 'package:flutter/material.dart';



class StickyLabel extends StatelessWidget {
  final String ?text;
  final Color ?textColor;
  const StickyLabel({
    Key ?key,
    this.text,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(
        left: kDefaultPadding,
        top: kFixPadding,
      ),
      child: Text(
        text!,
        style: TextStyle(
          color: textColor,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
