import 'package:flutter/material.dart';

extension DateExt on DateTime {
  String dateToString(MaterialLocalizations locale) {
    final DateTime date = this;
    final String ymd = locale.formatShortDate(date);
    return ymd;
  }
}

extension TimeExt on TimeOfDay {
  String timeToString(MaterialLocalizations locale) {
    final TimeOfDay time = this;
    final hm = locale.formatTimeOfDay(time);
    return hm;
  }
}
