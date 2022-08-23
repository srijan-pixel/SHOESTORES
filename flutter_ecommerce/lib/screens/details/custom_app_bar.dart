import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/utils/size_config.dart';

class CustomAppBar extends StatelessWidget {
  final double rating;

  CustomAppBar({required this.rating});

  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.heightMultiplier * 2.5,
          vertical: SizeConfig.heightMultiplier,
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).primaryColorDark,
              foregroundColor: Theme.of(context).textTheme.headline6!.color,
              child: IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 3,
                vertical: SizeConfig.heightMultiplier,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Text(
                    "$rating",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Theme.of(context).textTheme.headline6!.color,
                        ),
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset("assets/icons/Star Icon.svg"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
