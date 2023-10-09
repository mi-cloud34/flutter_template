import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/constants/app/enums/app_theme_enum.dart';
import 'package:flutter_architecture/core/init/theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  // ignore: unused_field
  ThemeData? _currentTheme = AppThemeLight.instance?.theme;
  // ThemeData? get currentTheme => AppThemeLight.instance!.theme;
  AppThemes _currenThemeEnum = AppThemes.LIGHT;
  AppThemes get currenThemeEnum => _currenThemeEnum;
  ThemeData? get currentTheme => _currentTheme;

  void changeValue(AppThemes? theme) {
    if (theme == AppThemes.DARK) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }

  void changeTheme() {
    if (_currenThemeEnum == AppThemes.LIGHT) {
      _currentTheme = ThemeData.dark();
      _currenThemeEnum = AppThemes.DARK;
    } else {
      _currentTheme = AppThemeLight.instance?.theme;
      _currenThemeEnum = AppThemes.LIGHT;
    }
    notifyListeners();
  }
}
