// lib/config/theme.dart

import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Color(0xFF60C370),
      colorScheme: ColorScheme.light(
        primary: Color(0xFF60C370),
        secondary: Color(0xFFBAD13A),
        background: Colors.white,
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
        bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black),
      ),
      fontFamily: 'Helvetica',
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
