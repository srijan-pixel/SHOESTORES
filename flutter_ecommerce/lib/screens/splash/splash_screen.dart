import 'package:flutter/material.dart';

import '/constant/color_properties.dart';
import '/screens/sign_in/sign_in_screen.dart';
import '/utils/size_config.dart';
import '/widgets/default_button.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome To Shoes Store!, Let’s Go!",
      "image": "assets/images/splash_3.png"
    },
    {
      "text": "We help people connect with store \naround all over the Nepal",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shopping online from shoes store. \nJust stay at home with us",
      "image": "assets/images/splash_1.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"],
                    text: splashData[index]['text'],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.heightMultiplier * 2.5,
                  ),
                  child: Column(
                    children: <Widget>[
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      const Spacer(flex: 3),
                      DefaultButton(
                        text: "Continue",
                        press: () {
                          Navigator.pushReplacementNamed(context, SignInScreen.routeName);
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 400,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? secondaryColor : colorDarkGrey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Text(
          "Shoes Store",
          style: Theme.of(context).textTheme.headline4!.copyWith(),
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 2),
        Text(
          text!,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: colorGrey,
              ),
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 2),
        Image.asset(
          image!,
          height: SizeConfig.heightMultiplier * 25,
          width: SizeConfig.widthMultiplier * 50,
        ),
      ],
    );
  }
}
