library subsmanager.globals;

import 'package:flutter/material.dart';
import 'package:subsmanager/pages/settings/settings.dart';
import 'package:subsmanager/pages/stream/stream.dart';
import 'package:subsmanager/pages/subs/subs.dart';

const List<Widget> pageLists = [Subs(), Settings()];
const String stream = "Stream";
const String subs = "Subscriptions";
const String settings = "Settings";
const String title = "Money Stream";
const Color themeColor = Color.fromARGB(255, 50, 201, 189);
const Color borderColor = Color.fromARGB(255, 160, 160, 160);

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
