import 'package:flutter/material.dart';

extension DateExt on DateTime {
  String dateToString(BuildContext context) {
    final DateTime date = this;
    final locale = MaterialLocalizations.of(context);
    final String ymd = locale.formatShortDate(date);
    return ymd;
  }
}

extension TimeExt on TimeOfDay {
  String timeToString(BuildContext context) {
    final TimeOfDay time = this;
    final locale = MaterialLocalizations.of(context);
    final hm = locale.formatTimeOfDay(time);
    return hm;
  }
}
