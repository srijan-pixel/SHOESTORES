import 'dart:async';
import 'package:ecommerce/screens/sign_in/sign_in_screen.dart';
import 'package:sensors_plus/sensors_plus.dart';
import '/screens/home/popular_product.dart';
import '/screens/home/special_offers.dart';
import '/screens/home/staggerred_gridview_product.dart';
import '/utils/scroll_configuration.dart';
import '/utils/size_config.dart';
import 'package:flutter/material.dart';
// import 'discount_banner.dart';
import 'discount_banner.dart';
import 'home_header.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamSubscriptions.add(
      userAccelerometerEvents.listen(
        (UserAccelerometerEvent event) {
          if (event.x > 10) {
            Navigator.of(context).pushNamed(
              SignInScreen.routeName,
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: SizeConfig.heightMultiplier * 1,
          ),
          const HomeHeader(),
          SizedBox(
            height: SizeConfig.heightMultiplier,
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const DiscountBanner(),
                    // const Categories(),
                    const SpecialOffers(),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2.5,
                    ),
                    const StaggeredGridListView(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
