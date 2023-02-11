import 'package:flutter/material.dart';

// TODO(tun43p): Create real theme and add real fonts

const Color _backgroundColor = Color(0xFFF5F5F5);
const Color _primaryColor = Color(0xFF505050);

final ThemeData mainTheme = ThemeData(
  useMaterial3: true,
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: MaterialStateProperty.all(_primaryColor),
    thickness: MaterialStateProperty.all(4),
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: _primaryColor,
    onPrimary: _backgroundColor,
    secondary: _primaryColor,
    onSecondary: _backgroundColor,
    error: Colors.red,
    onError: Colors.white,
    background: _backgroundColor,
    onBackground: _primaryColor,
    surface: Colors.white,
    onSurface: _primaryColor,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: _primaryColor,
    ),
    titleMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: _primaryColor,
    ),
    titleSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: _primaryColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: _primaryColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: _primaryColor,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: _primaryColor,
    ),
  ),
);
