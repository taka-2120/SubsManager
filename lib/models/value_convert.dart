import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import '../presentation/hooks/locale.dart';

class Convert {
  String feeAndPeriod(BuildContext context, double fee, int period) {
    String feeStr = feeToString(context, fee, true);
    String periodStr = periodToString(period);

    return "$feeStr/$periodStr";
  }

  String feeToString(BuildContext context, double fee, bool format) {
    String currencyStr;
    NumberFormat value;
    if (localeStr.contains("JP") == true || localeStr.contains("ja") == true) {
      value = NumberFormat(format ? "#,##0" : "###0", localeStr);
      currencyStr = format ? "¥" : "";
    } else {
      value = NumberFormat(format ? "#,##0.00" : "###0.00", localeStr);
      currencyStr = format ? "\$" : "";
    }
    return currencyStr + value.format(fee);
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
    }
    return periodStr;
  }

  int periodToInt(String? period) {
    int periodIndex = 0;

    if (period == null) {
      periodIndex = 99;
    } else {
      switch (period) {
        case "Monthly":
          periodIndex = 0;
          break;
        case "Semi-Annually":
          periodIndex = 1;
          break;
        case "Annually":
          periodIndex = 2;
          break;
      }
    }
    return periodIndex;
  }

  String dateToString(DateTime date, BuildContext context) {
    String locale = Localizations.localeOf(context).languageCode;
    String ymd = DateFormat.yMd(locale).format(date);
    return ymd;
  }

  double feeToDouble(String fee) {
    if (fee == "") {
      fee = "-99.9";
    }
    return double.parse(fee);
  }
}
