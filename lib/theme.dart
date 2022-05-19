import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black12,
    colorScheme: const ColorScheme.dark(),
  );
}
