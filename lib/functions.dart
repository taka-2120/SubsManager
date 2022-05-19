import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class Functions {
  String roundedFeeToString(double fee, BuildContext context) {
    final localeStr = Platform.localeName;

    if (localeStr.contains("JP") == true) {
      final value = NumberFormat("#,##0", localeStr);
      return "¥${value.format(fee)}";
    } else {
      final value = NumberFormat("#,##0.00", localeStr);
      return "\$${value.format(fee)}";
    }
  }

  String periodToString(int period) {
    String periodStr = "";

    switch (period) {
      case 0:
        periodStr = "Monthly";
        break;
      case 1:
        periodStr = "Semi-Annually";
        break;
      case 2:
        periodStr = "Annually";
        break;
      default:
        periodStr = "Monthly";
        break;
    }
    return periodStr;
  }

  String dateToString(DateTime date, BuildContext context) {
    String locale = Localizations.localeOf(context).languageCode;
    String ymd = DateFormat.yMMMd(locale).format(date);
    return ymd;
  }
}
