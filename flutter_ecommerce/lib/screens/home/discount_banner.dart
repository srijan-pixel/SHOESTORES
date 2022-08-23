import 'package:flutter/material.dart';

import '/utils/size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.all(
        SizeConfig.heightMultiplier * 2,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.heightMultiplier * 5,
        vertical: SizeConfig.heightMultiplier * 6,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(text: "On the Ocassion \n"),
            TextSpan(
              text: "You will get upto 35% discount",
              style: TextStyle(
                // fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
