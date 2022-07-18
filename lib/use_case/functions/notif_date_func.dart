import 'package:subsmanager/l10n/l10n.dart';

enum NotifDates {
  theDay,
  oneDay,
  twoDays,
  threeays,
  fourDays,
  fiveDays,
  sixDays,
  oneWeek,
  twoWeeks,
  threeWeeks,
}

String getNotifDateString(L10n l10n, NotifDates dates) {
  switch (dates) {
    case NotifDates.theDay:
      return l10n.the_day;
    case NotifDates.oneDay:
      return l10n.one_day;
    case NotifDates.twoDays:
      return l10n.two_days;
    case NotifDates.threeays:
      return l10n.three_days;
    case NotifDates.fourDays:
      return l10n.four_days;
    case NotifDates.fiveDays:
      return l10n.five_days;
    case NotifDates.sixDays:
      return l10n.six_days;
    case NotifDates.oneWeek:
      return l10n.one_week;
    case NotifDates.twoWeeks:
      return l10n.two_weeks;
    case NotifDates.threeWeeks:
      return l10n.three_weeks;
  }
}
