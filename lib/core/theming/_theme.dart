import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF201335),
    onPrimary: Colors.white,
    surface: Color(0xFFbaccff),
    onSurface: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    secondary: Color(0xFF4f4789),
    onSecondary: Colors.black,
  ));
}
