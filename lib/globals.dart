library subsmanager.globals;

// import '/pages/stream/stream.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:io';
import '/notifier.dart';
import '/pages/settings/settings.dart';
import '/pages/subs/subs.dart';
import '/pages/subs/subs_list.dart';

const List<Widget> pageLists = [SubsMain(), Settings()]; //ADD STREAM
const String stream = "Stream";
const String subs = "Subscriptions";
const String settings = "Settings";
const String title = "SubsManager";
const Color themeColor = Color.fromARGB(255, 50, 201, 189);
const Color borderColor = Color.fromARGB(255, 160, 160, 160);
final localeStr = Platform.localeName;

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

//Providers
final notifEnabledProvider =
    StateNotifierProvider<NotifEnabled, bool>((ref) => NotifEnabled(false));
final tabIndexProvider =
    StateNotifierProvider<TabIndex, int>((ref) => TabIndex(0));
final subsListProvider =
    StateNotifierProvider<SubsList, List<Subs>>((ref) => SubsList());
final subDateProvider =
    StateNotifierProvider<SubDate, DateTime>((ref) => SubDate());
final subPeriodProvider =
    StateNotifierProvider<SubPeriod, String?>((ref) => SubPeriod());
