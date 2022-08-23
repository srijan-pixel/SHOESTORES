import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  static SharedPreferences? sharedPreferences;

  ThemeMode themeMode() {
    final themeType = ThemeService.sharedPreferences!.get('theme');
    if (themeType == null) {
      return ThemeMode.light;
    }
    return ThemeMode.light.toString() == themeType
        ? ThemeMode.light
        : ThemeMode.dark.toString() == themeType
            ? ThemeMode.dark
            : ThemeMode.system;
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    await ThemeService.sharedPreferences!
        .setString('theme', theme.toString());
    // http package to persist settings over the network.
  }
}
