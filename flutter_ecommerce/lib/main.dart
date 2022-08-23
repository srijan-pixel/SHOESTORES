import 'package:awesome_notifications/awesome_notifications.dart';

import '/providers/customer_provider.dart';
import '/providers/theme_provider.dart';
import '/utils/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/providers/cart_provider.dart';
import '/providers/product_provider.dart';
import '/providers/wishlist_provider.dart';
import '/screens/splash/splash_screen.dart';
import '/theme/theme_data.dart';
import '/utils/routes.dart';
import '/utils/size_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(null, // icon for your app notification

      [
        NotificationChannel(
            channelKey: 'key1',
            channelName: 'Proto Coders Point',
            channelDescription: "Notification example",
            defaultColor: const Color(0XFF9050DD),
            ledColor: Colors.white,
            playSound: true,
            enableLights: true,
            importance: NotificationImportance.High,
            enableVibration: true)
      ]);
  ThemeService.sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomerProvider(),
        ),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              final controller = Provider.of<ThemeProvider>(context);
              SizeConfig().init(constraints, orientation);
              return AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return MaterialApp(
                      themeMode: //
                          // ThemeMode.dark,
                          controller.themeMode,
                      debugShowCheckedModeBanner: false,
                      title: "Shoes Store",
                      theme: lightTheme(context),
                      darkTheme: darkTheme(context),
                      // home: NavigationScreen(),
                      initialRoute: SplashScreen.routeName,
                      routes: routes,
                    );
                  });
            },
          );
        },
      ),
    );
  }
}
