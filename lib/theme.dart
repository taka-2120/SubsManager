import 'package:flutter/material.dart';

final Color entryBackground = Colors.grey.withOpacity(0.2);
const Color primaryColor = Color.fromARGB(255, 50, 201, 189);
const Color borderColor = Color.fromARGB(255, 160, 160, 160);

final darkTheme = ThemeData(
  primarySwatch: customSwatch,
  fontFamily: "Noto Sans JP",
  primaryColor: primaryColor,
  brightness: Brightness.dark,
  backgroundColor: const Color.fromARGB(255, 31, 31, 31),
  dividerColor: const Color.fromARGB(255, 99, 99, 99),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromARGB(255, 42, 42, 42),
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 20, 20, 20),
  dialogBackgroundColor: const Color.fromARGB(255, 40, 40, 40),
);

final lightTheme = ThemeData(
  primarySwatch: customSwatch,
  fontFamily: "Noto Sans JP",
  primaryColor: primaryColor,
  brightness: Brightness.light,
  backgroundColor: const Color.fromARGB(255, 245, 245, 245),
  dividerColor: const Color.fromARGB(255, 185, 185, 185),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromARGB(255, 250, 250, 250),
  ),
  scaffoldBackgroundColor: Colors.white,
  dialogBackgroundColor: const Color.fromARGB(255, 240, 240, 240),
);

const MaterialColor customSwatch = MaterialColor(0xFF36DCCF, <int, Color>{
  50: Color(0xFFE7FBF9),
  100: Color(0xFFC3F5F1),
  200: Color(0xFF9BEEE7),
  300: Color(0xFF72E7DD),
  400: Color(0xFF54E1D6),
  500: Color(0xFF36DCCF),
  600: Color(0xFF30D8CA),
  700: Color(0xFF29D3C3),
  800: Color(0xFF22CEBD),
  900: Color(0xFF16C5B2),
});
