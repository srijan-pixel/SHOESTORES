
import 'package:ecommerce/constant/color_properties.dart';
import 'package:ecommerce/constant/constants.dart';
import 'package:ecommerce/widgets/emptySection.dart';
import 'package:ecommerce/widgets/subTitle.dart';
import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  const Success({Key ?key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          EmptySection(
            emptyImg: success,
            emptyMsg: 'Successful !!',
          ),
          SubTitle(
            subTitleText: 'Your payment method IS Sucessful',
          ),
        ],
      ),
    );
  }
}
