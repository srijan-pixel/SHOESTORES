import 'package:ecommerce/utils/scroll_configuration.dart';
import 'package:flutter/material.dart';

import '/screens/navigation_screen.dart';
import '/utils/size_config.dart';
import '/widgets/default_button.dart';

class LoginSuccessScreen extends StatelessWidget {
  static const String routeName = "/login_success";

  const LoginSuccessScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier * 5,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/sucessfully.png",
                    width: SizeConfig.widthMultiplier * 100,
                    height: SizeConfig.heightMultiplier * 40, //40%
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
                Text(
                  "Successfully Logined",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 10,
                ),
                SizedBox(
                  width: SizeConfig.widthMultiplier * 50,
                  child: DefaultButton(
                    text: "Back to home",
                    press: () {
                      Navigator.pushReplacementNamed(
                          context, NavigationScreen.routeName);
                    },
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
