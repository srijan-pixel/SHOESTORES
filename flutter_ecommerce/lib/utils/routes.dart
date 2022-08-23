import '/screens/orders/order_screen.dart';

import '/screens/profile/edit_profile_screen.dart';
import '/screens/notifications/notification_screen.dart';
import '/screens/search_list/search_result.dart';

import '/screens/navigation_screen.dart';
import '/screens/search_list/search_screen.dart';
import 'package:flutter/widgets.dart';
import '/screens/cart/cart_screen.dart';
import '/screens/complete_profile/complete_profile_screen.dart';
import '/screens/details/details_screen.dart';
import '/screens/forgot_password/forgot_password_screen.dart';
import '/screens/home/home_screen.dart';
import '/screens/login_success/login_success_screen.dart';
import '/screens/otp/otp_screen.dart';
import '/screens/sign_in/sign_in_screen.dart';
import '/screens/splash/splash_screen.dart';
import '/screens/setting/setting_screen.dart';

import '/screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  NavigationScreen.routeName: (context) => const NavigationScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  SettingScreen.routeName: (context) => const SettingScreen(),
  SearchScreen.routeName: (context) => const SearchScreen(),
  SearchResultScreen.routeName: (context) => const SearchResultScreen(""),
  EditProfileScreen.routeName: (context) => const EditProfileScreen(),
  NotificationScreen.routeName: (context) => const NotificationScreen(),
  OrderScreen.routeName: (context) => const OrderScreen(),
};
