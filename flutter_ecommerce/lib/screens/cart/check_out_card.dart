import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/screens/address/address.dart';
import 'package:provider/provider.dart';

import '/constant/color_properties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/widgets/default_button.dart';
import '/utils/size_config.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 2 * SizeConfig.heightMultiplier,
        horizontal: 4 * SizeConfig.heightMultiplier,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4 * SizeConfig.heightMultiplier),
          topRight: Radius.circular(4 * SizeConfig.heightMultiplier),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<CartProvider>(
                  builder: (_, value, __) {
                    return Text.rich(
                      TextSpan(
                        text: "Total:\n",
                        style: Theme.of(context).textTheme.bodyText1,
                        children: [
                          TextSpan(
                            text: "Rs. ${value.getTotalCartSum()}",
                            style: Theme.of(context).textTheme.headline6!.copyWith(
                                  color: secondaryColor,
                                ),
                          ),
                        ],
                      ),
                    );
                  }
                ),
                SizedBox(
                  width: 25 * SizeConfig.heightMultiplier,
                  child: DefaultButton(
                    text: "Check Out",
                    press: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>DeliveryAddress()));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
