import 'package:ecommerce/utils/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '/constant/color_properties.dart';
import '/providers/wishlist_provider.dart';
import '/utils/size_config.dart';
import '../../models/product.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Products product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.heightMultiplier * 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: SizeConfig.heightMultiplier),
                    Text(
                      "Rs ${product.price}",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: secondaryColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: SizeConfig.widthMultiplier,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Provider.of<WishListProvider>(context, listen: false)
                        .addToWishList(
                      product,
                    );
                    showToast(
                      text:
                          Provider.of<WishListProvider>(context, listen: false)
                                      .checkIsInWishList(
                                    product.id,
                                  ) !=
                                  null
                              ? "Successfully added to the wishlist"
                              : "Successfully removed from the wishlist",
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(
                      SizeConfig.heightMultiplier * 2,
                    ),
                    width: SizeConfig.heightMultiplier * 8,
                    decoration: BoxDecoration(
                      color: Provider.of<WishListProvider>(
                                context,
                              ).checkIsInWishList(
                                product.id,
                              ) !=
                              null
                          ? const Color(0xFFFFE6E6)
                          : Theme.of(context).primaryColorLight,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
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
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 2),
        SeeMoreDetail(product.description),
      ],
    );
  }
}

class SeeMoreDetail extends StatefulWidget {
  const SeeMoreDetail(this.description, { Key? key }) : super(key: key);

  final String description;

  @override
  _SeeMoreDetailState createState() => _SeeMoreDetailState();
}

class _SeeMoreDetailState extends State<SeeMoreDetail> {

  bool toShowLines = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.heightMultiplier * 2,
          ),
          child: Text(
            widget.description,
            maxLines: toShowLines ? null : 3,
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.heightMultiplier * 2,
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {
              setState(() {
                toShowLines = !toShowLines;
              });
            },
            child: Row(
              children: [
                Text("See ${toShowLines ? 'Less' : 'More'} Detail",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: secondaryColor,
                        )),
                SizedBox(width: SizeConfig.widthMultiplier),
                const Icon(
                  Icons.chevron_right,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
