import 'dart:ui';

import 'package:ecommerce/constant/color_properties.dart';
import 'package:ecommerce/models/paymentModal.dart';
import 'package:flutter/material.dart';
const String success = 'assets/images/success.gif';
const defaultDuration = Duration(milliseconds: 250);
const kDefaultPadding = 24.0;
const kRadius = 0.0;
const kShape = 30.0;
const kFixPadding = 16.0;
const kLessPadding = 10.0;

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";


final paymentLabels = [
  'Credit card / Debit card',
  'Cash on delivery',
  'ESewa',
  'Khalti',
];
  final paymentIcons = [
    Icons.credit_card,
    Icons.money_off,
    Icons.payment,
    Icons.account_balance_wallet,
  ];


  final paymentDetailList = [
  PaymentModal(
      date: "Jan 01",
      details: "Buy IPhoneX",
      amount: 1000.0,
      textColor: Colors.red),
  PaymentModal(
      date: "Aug 15",
      details: "Flat ₹650 off",
      amount: 650.0,
      textColor: Colors.green),
  PaymentModal(
      date: "Dec 03",
      details: "Congrats! Flat ₹180",
      amount: 180.0,
      textColor: Colors.green),
  PaymentModal(
      date: "Feb 14",
      details: "Buy Shoes Upto 50% Off",
      amount: 540.0,
      textColor: Colors.red),
  PaymentModal(
      date: "Sep 08",
      details: "Buy Footwear on Discount",
      amount: 210.0,
      textColor: Colors.red),
  PaymentModal(
      date: "Apr 18",
      details: "Congrats! ₹375 Rewarded",
      amount: 375.0,
      textColor: Colors.green),
];
const kSubTextStyle = TextStyle(
  fontSize: 18.0,
  color: kLightColor,
);
const kDarkTextStyle = TextStyle(
  fontSize: 20.0,
  color: kDarkColor,
);

const tokenKey = "token";