import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/extensions/fee_double_str.dart';
import 'package:subsmanager/extensions/period_int_str.dart';

String feeAndPeriod(WidgetRef ref, double fee, int period) {
  String feeStr = fee.feeToString(format: true);
  String periodStr = period.periodToString(ref);

  return "$feeStr/$periodStr";
}

Future<bool> isConnected() async {
  bool canCont = false;

  try {
    final result = await InternetAddress.lookup('https://www.google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      canCont = true;
    }
  } catch (e) {
    canCont = false;
  }

  return canCont;
}
