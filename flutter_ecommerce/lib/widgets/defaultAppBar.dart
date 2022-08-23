import 'package:ecommerce/constant/color_properties.dart';
import 'package:ecommerce/constant/constants.dart';
import 'package:flutter/material.dart';



class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String ?title;
  final Widget ?child;
  final dynamic action;
  const DefaultAppBar({
    Key ?key, this.title, this.child, this.action,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title!, style: const TextStyle(color: secondaryColor)),
      centerTitle: true,
      backgroundColor: kWhiteColor,
      elevation: kRadius,
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(color: secondaryColor),
      leading: child,
      actions: action,
    );
  }
}