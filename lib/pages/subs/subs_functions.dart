import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

class SubsFunctions {
  String roundedFeeToString(double fee, BuildContext context) {
    String locale = Localizations.localeOf(context).toString();

    //FIX: not reccommended
    if (locale == "ja_JP") {
      return fee.toStringAsFixed(0);
    } else {
      return fee.toStringAsFixed(2);
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
