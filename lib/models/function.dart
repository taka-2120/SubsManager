import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/extensions/fee_double_str.dart';
import 'package:subsmanager/extensions/period_int_str.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

String feeAndPeriod(WidgetRef ref, double fee, int period) {
  String feeStr = fee.feeToString(format: true);
  String periodStr = period.periodToString(ref);

  return "$feeStr/$periodStr";
}

Future<bool> isConnected() async {
  bool canContinue = true;
  final ConnectivityResult result = await Connectivity().checkConnectivity();

  if (result == ConnectivityResult.none) {
    canContinue = false;
  }

  return canContinue;
}
