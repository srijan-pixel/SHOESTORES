import 'package:flutter/material.dart';

import '/constant/color_properties.dart';
import '/screens/sign_up/sign_up_screen.dart';
import '/utils/size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(
            fontSize: SizeConfig.heightMultiplier * 2.4,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            "Sign Up",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: secondaryColor,
                ),
          ),
        ),
      ],
    );
  }
}
