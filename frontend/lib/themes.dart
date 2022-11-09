import 'package:flutter/material.dart';

class MyThemes {
  static const primary = Colors.teal;
  static final primaryColor = Colors.teal.shade300;

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColorDark: primaryColor,
    colorScheme: const ColorScheme.dark(primary: primary),
    dividerColor: Colors.white,
    tabBarTheme: TabBarTheme(
      labelColor: Colors.teal,
      unselectedLabelColor: Colors.grey.shade900,
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(primary: primary),
    dividerColor: Colors.black,
    tabBarTheme: const TabBarTheme(
        labelColor: Colors.teal, unselectedLabelColor: Colors.white),
  );
}
