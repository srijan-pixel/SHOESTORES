import 'package:flutter/material.dart';

import '/utils/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
    this.width,
  }) : super(key: key);
  final String? text;
  final Function? press;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.heightMultiplier * 6,
      width: width ?? SizeConfig.widthMultiplier * 90,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: SizeConfig.heightMultiplier * 2.3,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}