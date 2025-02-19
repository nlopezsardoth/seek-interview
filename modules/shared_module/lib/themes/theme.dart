import 'package:flutter/material.dart';

class SeekTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: _textTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    inputDecorationTheme: _inputDecorationTheme,
    appBarTheme: _appBarTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueAccent,
    scaffoldBackgroundColor: Color(0xFF121212),
    textTheme: _textTheme.apply(bodyColor: Colors.white),
    elevatedButtonTheme: _elevatedButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    inputDecorationTheme: _inputDecorationThemeDark,
    appBarTheme: _appBarThemeDark,
  );

  static const TextTheme _textTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
  );

  static final ElevatedButtonThemeData _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  );

  static final OutlinedButtonThemeData _outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      side: BorderSide(color: Colors.blue, width: 2),
    ),
  );

  static final InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[100],
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
    hintStyle: TextStyle(color: Colors.grey),
  );

  static final InputDecorationTheme _inputDecorationThemeDark = InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFF1E1E1E),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
    hintStyle: TextStyle(color: Colors.grey[500]),
  );

  static final AppBarTheme _appBarTheme = AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
    iconTheme: IconThemeData(color: Colors.black),
  );

  static final AppBarTheme _appBarThemeDark = AppBarTheme(
    backgroundColor: Color(0xFF121212),
    elevation: 0,
    titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
  );
}