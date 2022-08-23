import 'package:flutter/material.dart';

import '/constant/color_properties.dart';
import '/utils/size_config.dart';
import 'complete_profile_form.dart';

class CompleteProfileScreen extends StatelessWidget {
  static const String routeName = "/complete_profile";

  const CompleteProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 2.5 * SizeConfig.heightMultiplier,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 8,
                  ),
                  Text(
                    "Complete Profile",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 2),
                  Text(
                    "Complete your details or continue  \nwith social media",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: colorGrey,
                        ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 8,
                  ),
                  const CompleteProfileForm(),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 4,
                  ),
                  Text(
                    "By continuing your confirm that you agree \nwith our Term and Condition",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
