import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateExt on DateTime {
  String dateToString(BuildContext context) {
    DateTime date = this;
    String locale = Localizations.localeOf(context).languageCode;
    String ymd = DateFormat.yMd(locale).format(date);
    return ymd;
  }
}
