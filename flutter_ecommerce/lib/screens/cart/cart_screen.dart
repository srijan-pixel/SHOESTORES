import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '/providers/cart_provider.dart';
import '/utils/scroll_configuration.dart';
import '/utils/show_toast.dart';
import '/utils/size_config.dart';
import 'cart_card.dart';
import 'check_out_card.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = "/cart";

  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 2.5 * SizeConfig.heightMultiplier,
            vertical: SizeConfig.heightMultiplier,
          ),
          child: Consumer<CartProvider>(builder: (_, data, __) {
            return Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColorDark,
                      foregroundColor:
                          Theme.of(context).textTheme.headline6!.color,
                      child: IconButton(
                        icon: const Icon(Icons.chevron_left),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Cart',
                          style: Theme.of(context).textTheme.headline6!,
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier,
                        ),
                        Text(
                          '${data.gettotalCartItems()} Items',
                          style:
                              Theme.of(context).textTheme.caption!.copyWith(),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier,
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView.builder(
                      itemCount: data.cart.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.heightMultiplier),
                        child: Dismissible(
                          key: Key(data.cart[index].product.id.toString()),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            setState(() {
                              data.removeFromCart(data.cart[index].product);
                            });
                            showToast(text: 'Item remove from cart');
                          },
                          background: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.heightMultiplier * 2.2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFE6E6),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                const Spacer(),
                                SvgPicture.asset("assets/icons/Trash.svg"),
                              ],
                            ),
                          ),
                          child: CartCard(cart: data.cart[index]),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
      bottomNavigationBar: const CheckoutCard(),
    );
  }

}
