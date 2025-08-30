import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryStart = Color(0xFF1BC5B7);
  static const Color primaryEnd = Color(0xFF2DA8F7);
  static const Color accent = Color(0xFF00C77F);
  static final Gradient mainGradient = LinearGradient(
    colors: [primaryStart, primaryEnd],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryStart,
      primary: primaryStart,
      secondary: accent,
    ),
    useMaterial3: false,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    ),
    textTheme: TextTheme(
      // headline5/headline6 substituídos por titleLarge / titleMedium conforme API atual
      titleLarge: TextStyle(fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(),
      labelLarge: TextStyle(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryStart,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}
