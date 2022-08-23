import '/constant/color_properties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/utils/size_config.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": Icons.flash_on_outlined, "text": "Flash Deal"},
      {"icon": Icons.receipt_long_outlined, "text": "Bill"},
      {"icon": Icons.sports_esports_outlined, "text": "Game"},
      {"icon": Icons.redeem_outlined, "text": "Daily Gift"},
      {"icon": Icons.explore_outlined, "text": "More"},
    ];
    return Padding(
      padding: EdgeInsets.all(
        SizeConfig.heightMultiplier * 2.5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {},
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? text;
  final IconData? icon;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: SizeConfig.heightMultiplier * 7,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(
                SizeConfig.heightMultiplier * 2,
              ),
              height: SizeConfig.heightMultiplier * 7,
              width: SizeConfig.heightMultiplier * 7,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon!,
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier),
            Text(
              text!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  // color: primaryColor,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
