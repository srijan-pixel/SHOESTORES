import '/constant/color_properties.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
              // color: primaryColor,
              ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            "Get more Items...",
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: secondaryColor,
                ),
          ),
        ),
      ],
    );
  }
}
