import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xffe2be7f);
  static const Color black = Color(0xff202020);
  static const Color white = Color(0xffffffff);

  static ThemeData lightTheme = ThemeData();
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: black,
    appBarTheme: 
    AppBarTheme(
      foregroundColor: primaryColor,
      backgroundColor: black,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: primaryColor,
    )
    ),

    primaryColor: primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      selectedItemColor: white
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: black.withValues(alpha: 0.7),
      hintStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: white
      ),
      border: OutlineInputBorder(
       
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: primaryColor,
          width: 1,
        )
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: primaryColor,
          width: 1,
        ),
      gapPadding: 20,
      ),
      
    ),
    
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        color: white,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
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
      displaySmall: TextStyle(
        color: white,
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
    )

  );



}
