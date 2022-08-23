import 'package:flutter/material.dart';

import '/utils/theme_service.dart';

class ThemeProvider with ChangeNotifier {
  final ThemeService _settingsService = ThemeService();

  ThemeMode? _themeMode;

  ThemeMode? get themeMode => _themeMode;

  bool _isDateBS = true;
  bool get isDateBS => _isDateBS;

  void changeToBSDate() {
    _isDateBS = true;
    notifyListeners();
  }

  void changeToADDate() {
    _isDateBS = false;
    notifyListeners();
  }

  ThemeProvider() {
    _themeMode = _settingsService.themeMode();
  }

  void loadSettings() {
    _themeMode = _settingsService.themeMode();

    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;

    notifyListeners();

    await _settingsService.updateThemeMode(newThemeMode);
  }
}
