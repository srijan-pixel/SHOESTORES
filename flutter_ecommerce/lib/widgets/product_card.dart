import 'dart:convert';

import '/constant/color_properties.dart';
import '/providers/wishlist_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '/screens/details/details_screen.dart';
import '/utils/size_config.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
    this.category = "todays deals",
  }) : super(key: key);

  final double width, aspectRetio;
  final Products product;
  final String category;
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print("00");
    return SizedBox(
      width: SizeConfig.widthMultiplier * 30,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          DetailsScreen.routeName,
          arguments: ProductDetailsArguments(product: product),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: EdgeInsets.all(
                  SizeConfig.heightMultiplier * 2.5,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Hero(
                  tag: '${product.id.toString()} $category',
                  child:  Image.network(product.image),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.name,
              // style: const TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rs.${product.price}",
                  style: TextStyle(
                    fontSize: SizeConfig.heightMultiplier * 2.5,
                    fontWeight: FontWeight.w600,
                    color: secondaryColor,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: SvgPicture.asset(
                    "assets/icons/Heart Icon_2.svg",
                    color: Provider.of<WishListProvider>(
                              context,
                            ).checkIsInWishList(
                              product.id,
                            ) !=
                            null
                        ? const Color(0xFFFF4848)
                        : const Color(0xFFDBDEE4),
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
