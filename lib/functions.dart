import 'package:flutter/material.dart';
import 'globals.dart';
import 'package:intl/intl.dart';

class Functions {
  String feeAndPeriod(BuildContext context, double fee, int period) {
    String feeStr = roundedFeeToString(fee, context);
    String periodStr = periodToString(period);

    return "$feeStr / $periodStr";
  }

  String roundedFeeToString(double fee, BuildContext context) {
    if (localeStr.contains("JP") == true || localeStr.contains("ja") == true) {
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

  int periodToInt(String period) {
    int periodIndex = 0;

    switch (period) {
      case "Monthly":
        periodIndex = 1;
        break;
      case "Semi-Annually":
        periodIndex = 1;
        break;
      case "Annually":
        periodIndex = 2;
        break;
      default:
        periodIndex = 0;
        break;
    }
    return periodIndex;
  }

  String dateToString(DateTime date, BuildContext context) {
    String locale = Localizations.localeOf(context).languageCode;
    String ymd = DateFormat.yMMMd(locale).format(date);
    return ymd;
  }
}
