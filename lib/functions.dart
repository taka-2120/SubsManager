import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:favicon/favicon.dart' as fav;
import 'pages/subs/subs_list.dart';
import 'globals.dart';

class Functions {
  String feeAndPeriod(BuildContext context, double fee, int period) {
    String feeStr = roundedFeeToString(fee, context);
    String periodStr = periodToString(period);

    return "$feeStr/$periodStr";
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
    String ymd = DateFormat.yMd(locale).format(date);
    return ymd;
  }

  void addSub(BuildContext context, WidgetRef ref, String name, double fee,
      int period, DateTime date, Uri url) {
    final item =
        Subs(name: name, fee: fee, period: period, date: date, url: url);
    ref.read(subsListProvider.notifier).add(item);
    Navigator.pop(context);
  }

  double feeToDouble(String fee) {
    return double.parse(fee);
  }

  Future<fav.Icon?> getFavicon(String url) {
    var icon = fav.Favicon.getBest(url);
    return icon;
  }
}
