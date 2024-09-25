import 'package:flutter/material.dart';

const HighColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF181C14),
  onPrimary: Color(0xFFC63C51),
  secondary: Color(0xFF3C3D37),
  onSecondary: Color(0xFFC63C51),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  background: Color(0xFFFCFDF6),
  onBackground: Color(0xFF1A1C18),
  shadow: Color(0xFF000000),
  outlineVariant: Color(0xFFC2C8BC),
  surface: Color(0xFFF9FAF3),
  onSurface: Color(0xFF1A1C18),
);

class MyAppTheme {
  static ThemeData HighMode = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Moder',
    brightness: Brightness.light,
    colorScheme: HighColorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: HighColorScheme.primary,
      foregroundColor: HighColorScheme.onPrimary,
      elevation: 2,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: HighColorScheme.secondary,
  );
}
