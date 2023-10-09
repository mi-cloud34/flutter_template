import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/init/theme/app_theme.dart';
import 'package:flutter_architecture/core/init/theme/light/color_scheme_light.dart';
import 'package:flutter_architecture/core/init/theme/light/text_theme_light.dart';
import 'package:flutter_architecture/core/init/theme/light/light_theme_interface.dart';

class AppThemeLight extends AppTheme implements ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight? get instance {
    _instance ??= AppThemeLight._init();
    return _instance;
  }

  AppThemeLight._init();
  //ThemeData get theme => ThemeData.light().copyWith(
  ThemeData? get theme => ThemeData(
      textTheme: textTheme(),
      colorScheme: _colorSchemeLight(),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(selectedItemColor: Colors.red),
      scaffoldBackgroundColor: colorSchemeLight?.gray,
      inputDecorationTheme: InputDecorationTheme(
          border: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: colorSchemeLight?.red ?? Colors.red)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorSchemeLight?.red ?? Colors.red),
          )),
      floatingActionButtonTheme: ThemeData.light()
          .floatingActionButtonTheme
          .copyWith(backgroundColor: colorSchemeLight?.lightGreen),
      tabBarTheme: TabBarTheme(
          labelColor: _colorSchemeLight()?.onSecondary,
          unselectedLabelColor: _colorSchemeLight()?.onSecondary,
          //labelPadding: insets!.paddingLow,
          unselectedLabelStyle:
              textThemeLight?.headline1.copyWith(color: colorSchemeLight?.red)),
      /*       appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(
            color: colorSchemeLight?.darkGray,
            size: 12.0,
          ), 
          toolbarTextStyle: textThemeLight?.bodyLarge
              .copyWith(color: colorSchemeLight?.black)) */
      appBarTheme: ThemeData.light()
          .appBarTheme
          .copyWith(iconTheme: IconThemeData(color: Colors.black87, size: 21)));
  @override
  ColorSchemeLight? colorSchemeLight;

  @override
  TextThemeLight? textThemeLight;
  TextTheme? textTheme() {
    return TextTheme(
        displayLarge: textThemeLight?.headline1,
        displayMedium: textThemeLight?.headline2,
        displaySmall: textThemeLight?.headline3,
        headlineMedium: textThemeLight?.headline4,
        headlineSmall: textThemeLight?.headline5,
        titleLarge: textThemeLight?.headline6,
        bodySmall: textThemeLight?.bodySmall,
        bodyMedium: textThemeLight?.bodyMedium,
        bodyLarge: textThemeLight?.bodyLarge);
  }

  ColorScheme? _colorSchemeLight() {
    return ColorScheme(
      brightness: Brightness.light,
      primary: colorSchemeLight?.black ?? Colors.brown,
      onPrimary: colorSchemeLight?.orange ?? Colors.orange,
      secondary: colorSchemeLight?.red ?? Colors.red,
      onSecondary: colorSchemeLight?.white ?? Colors.white,
      error: colorSchemeLight?.red ?? Colors.red,
      onError: colorSchemeLight?.orange ?? Colors.orange,
      background: colorSchemeLight?.lightGreen ?? Colors.lightBlue,
      onBackground: colorSchemeLight?.lightGray ?? Colors.lightGreen,
      surface: colorSchemeLight?.azure ?? Colors.lightBlue,
      onSurface: colorSchemeLight?.darkGray ?? Colors.blueGrey,
    );
  }
}
