import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subsmanager/presentation/pages/settings/settings.dart';
import 'package:subsmanager/presentation/pages/subs/subs.dart';

final localeStr = Platform.localeName;

const defaultPeriods = ["Monthly", "Semi-Annually", "Annually"];

final authInstance = FirebaseAuth.instance;

const List<Widget> pageLists = [SubsPage(), Settings()];
