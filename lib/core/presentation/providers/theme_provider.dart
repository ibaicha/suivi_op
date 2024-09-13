import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';

enum ThemeEnum { light, dark }

class ThemeProvider extends ChangeNotifier {
  ThemeEnum currentTheme = ThemeEnum.light;
  ThemeData? currentThemeData;

  static ThemeProvider? _instance;
  static ThemeProvider get instance {
    _instance ??= ThemeProvider._init();
    return _instance!;
  }

  ThemeProvider._init();

  Future<void> changeTheme(ThemeEnum theme) async {
    currentTheme = theme;
    await _generateThemeData();
    notifyListeners();
  }

  Future<void> _generateThemeData() async {
    String themeStr = await rootBundle.loadString(_getThemeJsonPath());
    Map themeMap = jsonDecode(themeStr);
    currentThemeData = ThemeDecoder.decodeThemeData(themeMap);
  }

  String _getThemeJsonPath() {
    switch (currentTheme) {
      case ThemeEnum.light:
        return 'assets/themes/theme_light.json';
      case ThemeEnum.dark:
        return 'assets/themes/theme_dark.json';
      default:
        return 'assets/themes/theme_light.json';
    }
  }
}
