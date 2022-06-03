import 'dart:io';

import 'package:subsmanager/l10n/l10n.dart';

final localeStr = Platform.localeName;

// enum SubPeriods {
//   monthly,
//   semiAnnually,
//   annually,
// }

// getSubPeriodString(L10n l10n, SubPeriods periods) {
//   switch (periods) {
//     case SubPeriods.monthly:
//       return l10n.monthly;
//     case SubPeriods.semiAnnually:
//       return l10n.semi_annually;
//     case SubPeriods.annually:
//       return l10n.annually;
//   }
// }

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

getNotifDateString(L10n l10n, NotifDates dates) {
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

enum SortOptions {
  alphAcc,
  alphDec,
  dateAcc,
  dateDec,
  priceAcc,
  priceDec,
}

getSortOptionsString(L10n l10n, SortOptions sortOptions) {
  switch (sortOptions) {
    case SortOptions.alphAcc:
      return l10n.alph_acc;
    case SortOptions.alphDec:
      return l10n.alph_dec;
    case SortOptions.dateAcc:
      return l10n.date_acc;
    case SortOptions.dateDec:
      return l10n.date_dec;
    case SortOptions.priceAcc:
      return l10n.price_acc;
    case SortOptions.priceDec:
      return l10n.price_dec;
  }
}
