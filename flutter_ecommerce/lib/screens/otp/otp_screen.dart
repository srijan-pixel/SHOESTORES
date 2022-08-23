import 'package:flutter/material.dart';

import '/screens/navigation_screen.dart';
import '/utils/size_config.dart';
import '/widgets/default_button.dart';

class OtpScreen extends StatelessWidget {
  static const String routeName = "/otp";

  const OtpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.heightMultiplier * 2.5,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.heightMultiplier * 8),
                  Text(
                    "OTP Verification",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  Text(
                    "We sent your code to +1 898 860 ***",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier,
                  ),
                  buildTimer(context),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 8,
                  ),
                  const OtpForm(),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      // OTP code resend
                    },
                    child: const Text(
                      "Resend OTP Code",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row buildTimer(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: const Duration(seconds: 30),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ],
    );
  }
}

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.heightMultiplier * .5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: SizeConfig.heightMultiplier * 7.5,
                child: TextFormField(
                  autofocus: true,
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: SizeConfig.heightMultiplier * 7.5,
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) => nextField(value, pin3FocusNode),
                ),
              ),
              SizedBox(
                width: SizeConfig.heightMultiplier * 7.5,
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) => nextField(value, pin4FocusNode),
                ),
              ),
              SizedBox(
                width: SizeConfig.heightMultiplier * 7.5,
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin4FocusNode!.unfocus();
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 4,
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              Navigator.of(context).pushNamed(
                NavigationScreen.routeName,
              );
            },
          )
        ],
      ),
    );
  }
}
