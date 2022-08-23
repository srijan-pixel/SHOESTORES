import 'package:flutter/material.dart';

import '/constant/color_properties.dart';
import '/utils/size_config.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key? key,
    required this.icon,
    this.numOfitem = 0,
    this.isShow = false,
    required this.press,
  }) : super(key: key);

  final Icon icon;
  final int numOfitem;
  final bool isShow;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor.withOpacity(0.1),
            ),
            height: SizeConfig.heightMultiplier * 5,
            width: SizeConfig.heightMultiplier * 5,
            child: icon,
          ),
          if (numOfitem != 0)
            Positioned(
              top: isShow ? -3 : 0,
              right: 0,
              child: Container(
                height: SizeConfig.heightMultiplier * (isShow ? 2 : 1.5),
                width: SizeConfig.heightMultiplier * (isShow ? 2 : 1.5),
                decoration: BoxDecoration(
                  color: redColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1.5,
                    color: colorWhite,
                  ),
                ),
                child: isShow
                    ? Center(
                        child: Text(
                          "$numOfitem",
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    color: colorWhite,
                                    fontSize: SizeConfig.textMultiplier,
                                  ),
                        ),
                      )
                    : null,
              ),
            )
        ],
      ),
    );
  }
}
