import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xffe2be7f);
  static const Color black = Color(0xff202020);
  static const Color white = Color(0xffffffff);

  static ThemeData lightTheme = ThemeData();
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      selectedItemColor: white
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        color: white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      titleLarge: TextStyle(
        color: white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        color: white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    )

  );



}
