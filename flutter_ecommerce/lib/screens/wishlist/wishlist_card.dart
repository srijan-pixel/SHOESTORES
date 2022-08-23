import '/providers/wishlist_provider.dart';
import '/utils/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/constant/color_properties.dart';
import '/models/wishlist.dart';
import '/providers/cart_provider.dart';
import '/utils/size_config.dart';

class WishListCard extends StatelessWidget {
  const WishListCard({
    Key? key,
    required this.wishList,
  }) : super(key: key);

  final WishList wishList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: SizeConfig.widthMultiplier * 20,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: EdgeInsets.all(
                SizeConfig.heightMultiplier * 1,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(wishList.product.image),
            ),
          ),
        ),
        SizedBox(width: SizeConfig.widthMultiplier * 3),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                wishList.product.name,
                style: Theme.of(context).textTheme.bodyText1,
                maxLines: 2,
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier,
              ),
              Text.rich(
                TextSpan(
                  text: "\$${wishList.product.price}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: secondaryColor),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            if (wishList.product.countInStock > 0) {}
            Provider.of<CartProvider>(context, listen: false)
                .addToCart(wishList.product, 1);
            Provider.of<WishListProvider>(context, listen: false)
                .removeFromWishList(wishList.product);
            /* ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Successfully added the item to cart",
                  textAlign: TextAlign.center,
                ),
                duration: Duration(
                  seconds: 3,
                ),
              ),
            ); */
            showToast(
              text: "Successfully added the item to cart",
            );
          },
          icon: const Icon(
            Icons.add_shopping_cart_outlined,
            color: secondaryColor,
          ),
        ),
      ],
    );
  }
}
