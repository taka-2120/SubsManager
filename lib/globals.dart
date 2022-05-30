import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:io';
import 'presentation/pages/settings/settings.dart';
import 'presentation/pages/subs/subs.dart';

const List<Widget> pageLists = [SubsMain(), Settings()];
const String stream = "Stream";
const String subs = "Subscriptions";
const String settings = "Settings";
const String credits = "Credits";
const String title = "SubsManager";
const List<String> periodItems = ["Monthly", "Semi-Annually", "Annually"];
const Color primaryColor = Color.fromARGB(255, 50, 201, 189);
const Color borderColor = Color.fromARGB(255, 160, 160, 160);
final localeStr = Platform.localeName;
