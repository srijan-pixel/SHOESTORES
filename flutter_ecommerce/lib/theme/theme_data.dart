import 'package:flutter/material.dart';

import '/constant/color_properties.dart';
import '/utils/size_config.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    primaryColor: primaryColor,
    primaryColorLight: canvasColor,
    primaryColorDark: colorWhite,
    canvasColor: canvasColor,
    textTheme: const TextTheme(
      overline: TextStyle(),
      caption: TextStyle(color: colorGrey),
      bodyText1: TextStyle(color: primaryColor),
      bodyText2: TextStyle(color: primaryColor),
      subtitle1: TextStyle(color: primaryColor),
      subtitle2: TextStyle(color: primaryColor),
      headline6: TextStyle(color: primaryColor),
      headline5: TextStyle(color: primaryColor),
      headline4: TextStyle(color: primaryColor),
      headline3: TextStyle(color: primaryColor),
      headline2: TextStyle(color: primaryColor),
      headline1: TextStyle(color: primaryColor),
    ),
    appBarTheme: AppBarTheme(
        color: primaryColor,
        titleTextStyle: TextStyle(
          color: colorWhite,
          fontSize: 2 * SizeConfig.textMultiplier,
        ),
        toolbarTextStyle: const TextStyle(
          color: colorWhite,
        )),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: secondaryColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: secondaryColor,
      unselectedItemColor: colorLightGrey,
      showSelectedLabels: true,
    ),
    colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: primaryColor,
        ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: primaryColor,
        ),
        borderRadius: BorderRadius.circular(
          2 * SizeConfig.heightMultiplier,
        ),
      ),
      floatingLabelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
            color: primaryColor,
          ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color: secondaryColor,
        ),
        borderRadius: BorderRadius.circular(
          2 * SizeConfig.heightMultiplier,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Theme.of(context).errorColor,
        ),
        borderRadius: BorderRadius.circular(
          2 * SizeConfig.heightMultiplier,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Theme.of(context).errorColor,
        ),
        borderRadius: BorderRadius.circular(
          2 * SizeConfig.heightMultiplier,
        ),
      ),
    ),
  );
}

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    primaryColor: primaryColorBlack,
    primaryColorLight: primaryColorLight,
    primaryColorDark: primaryColorDark,
    canvasColor: primaryColorBlack,
    textTheme: TextTheme(
      caption: TextStyle(color: colorLightGrey),
      bodyText1: const TextStyle(color: colorWhite),
      bodyText2: const TextStyle(color: colorWhite),
      subtitle1: TextStyle(color: colorLightGrey),
      subtitle2: TextStyle(color: colorLightGrey),
      headline6: const TextStyle(color: colorWhite),
      headline5: const TextStyle(color: colorWhite),
      headline4: const TextStyle(color: colorWhite),
      headline3: const TextStyle(color: colorWhite),
      headline2: const TextStyle(color: colorWhite),
      headline1: const TextStyle(color: colorWhite),
    ),
    appBarTheme: AppBarTheme(
        color: primaryColor,
        titleTextStyle: TextStyle(
          color: colorWhite,
          fontSize: 2 * SizeConfig.textMultiplier,
        ),
        toolbarTextStyle: const TextStyle(
          color: colorWhite,
        )),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: secondaryColor,
        //fixedSize: Size.fromHeight(SizeConfig.heightMultiplier*5),
      ),
    ),
    iconTheme: IconThemeData(
      color: colorLightGrey,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: secondaryColor,
      unselectedItemColor: colorLightGrey,
      showSelectedLabels: true,
    ),
    colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: colorLightGrey,
        ),
    cardColor: primaryColorDark,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle:
          Theme.of(context).textTheme.bodyText1!.copyWith(color: colorGrey),
      labelStyle:
          Theme.of(context).textTheme.bodyText1!.copyWith(color: colorGrey),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: colorGrey,
        ),
        borderRadius: BorderRadius.circular(
          2 * SizeConfig.heightMultiplier,
        ),
      ),
      floatingLabelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
            color: colorLightGrey,
          ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color: colorGrey,
        ),
        borderRadius: BorderRadius.circular(
          2 * SizeConfig.heightMultiplier,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Theme.of(context).errorColor,
        ),
        borderRadius: BorderRadius.circular(
          2 * SizeConfig.heightMultiplier,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Theme.of(context).errorColor,
        ),
        borderRadius: BorderRadius.circular(
          2 * SizeConfig.heightMultiplier,
        ),
      ),
    ),
  );
}
