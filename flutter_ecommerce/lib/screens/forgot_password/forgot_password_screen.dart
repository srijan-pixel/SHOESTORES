import 'package:flutter/material.dart';

import '/constant/color_properties.dart';
import '/utils/size_config.dart';
import 'forgot_password_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = "/forgot_password";

  const ForgotPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.heightMultiplier * 2.5,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier * 8,
                ),
                Text(
                  "Forgot Password",
                  style: Theme.of(context).textTheme.headline4!.copyWith(),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                Text(
                  "Please enter your email and we will send \n you a link to return to your account",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: colorGrey,
                      ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 8),
                const ForgotPassForm(),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
