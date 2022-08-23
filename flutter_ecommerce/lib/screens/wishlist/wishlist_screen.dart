import '/utils/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '/constant/color_properties.dart';
import '/providers/wishlist_provider.dart';
import '/screens/wishlist/wishlist_card.dart';
import '/utils/scroll_configuration.dart';
import '/utils/size_config.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.heightMultiplier * 2,
            vertical: SizeConfig.heightMultiplier,
          ),
          child: Consumer<WishListProvider>(builder: (_, data, __) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your Wishlist',
                        style: Theme.of(context).textTheme.headline6),
                    SizedBox(
                      height: SizeConfig.heightMultiplier,
                    ),
                    Text(
                      '${data.wishlists.length} Items',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier,
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: WishListBuilder(data),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class WishListBuilder extends StatefulWidget {
  const WishListBuilder(
    this.data, {
    Key? key,
  }) : super(key: key);
  final WishListProvider? data;
  @override
  State<WishListBuilder> createState() => _WishListBuilderState();
}

class _WishListBuilderState extends State<WishListBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.data!.wishlists.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier),
        child: Dismissible(
          key: Key(widget.data!.wishlists[index].product.id.toString()),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            setState(() {
              widget.data!
                  .removeFromWishList(widget.data!.wishlists[index].product);
              /*  ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Successfully removed the item from wishlist",
                    textAlign: TextAlign.center,
                  ),
                  duration: Duration(
                    seconds: 3,
                  ),
                ),
              ); */
              showToast(
                text: "Successfully removed the item from whishlist",
              );
            });
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
          child: WishListCard(wishList: widget.data!.wishlists[index]),
        ),
      ),
    );
  }
}
