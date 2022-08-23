import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/utils/size_config.dart';

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    Key? key,
    required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        SizeConfig.heightMultiplier*2.5,
         SizeConfig.heightMultiplier*2.5,
        SizeConfig.heightMultiplier*2.5,
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: SizeConfig.heightMultiplier*2.3,
      ),
    );
  }
}
