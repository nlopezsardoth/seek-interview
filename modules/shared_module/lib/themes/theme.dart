import 'package:flutter/material.dart';

class SeekTheme {
  final Color primaryColor;
  final Color secondaryColor;
  final Color alertColor;

  SeekTheme({
    this.primaryColor = Colors.black,
    this.secondaryColor = Colors.white,
    this.alertColor = Colors.red,
  });

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: secondaryColor,
    textTheme: _textTheme(),
    elevatedButtonTheme: _elevatedButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme(),
    inputDecorationTheme: _inputDecorationTheme(),
    appBarTheme: _appBarTheme(),
  );

  SeekTheme copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? alertColor,
    Color? logoFilterColor,
  }) => SeekTheme(
    primaryColor: primaryColor ?? this.primaryColor,
    secondaryColor: secondaryColor ?? this.secondaryColor,
    alertColor: alertColor ?? this.alertColor,
  );

  TextTheme _textTheme() {
    return TextTheme(
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
    ).apply(bodyColor: primaryColor, fontFamily: "Monserrat");
  }

  static final ElevatedButtonThemeData _elevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      );

  OutlinedButtonThemeData _outlinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        side: BorderSide(color: primaryColor, width: 2),
      ),
    );
  }

  InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: secondaryColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(color: Colors.grey),
    );
  }

  AppBarTheme _appBarTheme() {
    return AppBarTheme(
      backgroundColor: secondaryColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      iconTheme: IconThemeData(color: primaryColor),
    );
  }
}

final SeekTheme lightTheme = SeekTheme();
final SeekTheme darkTheme = SeekTheme().copyWith(
  primaryColor: Colors.white,
  secondaryColor: Colors.black,
);
