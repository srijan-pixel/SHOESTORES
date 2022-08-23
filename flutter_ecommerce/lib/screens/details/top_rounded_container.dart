import 'package:flutter/material.dart';

import '/utils/size_config.dart';

class TopRoundedContainer extends StatelessWidget {
  const TopRoundedContainer({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.heightMultiplier * 2.5,
      ),
      padding: EdgeInsets.only(
        top: SizeConfig.heightMultiplier * 2.5,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            SizeConfig.heightMultiplier * 5,
          ),
          topRight: Radius.circular(
            SizeConfig.heightMultiplier * 5,
          ),
        ),
      ),
      child: child,
    );
  }
}
