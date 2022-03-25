import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static const Color _primaryColor = Color(0xFF2E8B57);

  static Color get primaryColor => _primaryColor;

  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: _primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: _primaryColor,
    ),
    // Set value to cursor color
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: _primaryColor,
    ),
    // Set styles to borders
    inputDecorationTheme: const InputDecorationTheme().copyWith(
      labelStyle: const TextStyle(
        color: _primaryColor,
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        borderSide: BorderSide(
          color: _primaryColor,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        borderSide: BorderSide(
          color: _primaryColor,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        borderSide: BorderSide(
          color: _primaryColor,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      primary: _primaryColor,
    )),
  );
}
