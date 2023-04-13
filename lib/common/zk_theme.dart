import 'package:flutter/material.dart';
import 'package:zk_weather/utils/extensions/color_extensions.dart';

class ZKAppTheme {
  static const double smallFontSize = 16;
  static const double normalFontsize = 22;
  static const double largeFontsize = 24;

  static const Color lightTextColor = Colors.black;
  static const Color dartTextColor = Colors.white;

  static const Color primarySwatch = Colors.pinkAccent;
  static const Color lightBackgroundColor = Colors.white;
  static const Color dartBackgroundColor = Colors.black;

  static const TextStyle smallTextStyle = TextStyle(fontSize: smallFontSize);
  static const TextStyle largeTextStyle = TextStyle(fontSize: largeFontsize);

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightBackgroundColor,
    primarySwatch: primarySwatch.toMaterialColor(),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: lightBackgroundColor,
      //selectedIconTheme: IconThemeData(color: primarySwatch),
      //unselectedIconTheme: IconThemeData(color: dartTextColor),
      unselectedItemColor: lightTextColor,
      selectedItemColor: primarySwatch,
      //unselectedLabelStyle: TextStyle(fontSize: 30)
      //selectedLabelStyle: TextStyle(color: primarySwatch),//无作用
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: normalFontsize, color: lightTextColor),
      bodyLarge: TextStyle(fontSize: largeFontsize, color: lightTextColor),
      bodySmall: TextStyle(fontSize: smallFontSize, color: lightTextColor),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    //scaffoldBackgroundColor: dartBackgroundColor,
    primarySwatch: primarySwatch.toMaterialColor(),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      //backgroundColor: dartBackgroundColor,
      unselectedItemColor: dartTextColor,
      selectedItemColor: primarySwatch,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: normalFontsize, color: dartTextColor),
      bodyLarge: TextStyle(fontSize: largeFontsize, color: dartTextColor),
      bodySmall: TextStyle(fontSize: smallFontSize, color: dartTextColor),
    ),
  );
}
