import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/models/function.dart';

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

getLogInErrorsString(L10n l10n, String errors, bool isEmpty) {
  switch (errors) {
    case "network":
      return "Please check your Internet connection.";
  }

  switch (isEmpty) {
    case true:
      return "Please make sure to fill Email address and password.";
  }

  switch (errors) {
    case "invalid-email":
      return "E-mail format is incorecct.";
    case "user-disabled":
      return "This user is disabled.";
    case "user-not-found":
      return "This E-mail address is not registered.";
    case "wrong-password":
      return "Password is incorrect. Please check it again.";
    case "email-already-in-use":
      return "You have already signed in this account.";
    default:
      return "Sorry, unknown error has occured. Please try again later.";
  }
}

getRegisterErrorsString(L10n l10n, String errors, bool isEmpty) {
  switch (isEmpty) {
    case true:
      return "Please make sure to fill Email address and password.";
  }

  switch (errors) {
    case "invalid-email":
      return "This Email address format is incorecct.";
    case "email-already-in-us":
      return "This Email address is already in use.";
    case "operation-not-allowed":
      return "This Email address or password is currently disabled.";
    case "weak-password":
      return "Your password is too weak. It should be 6 letters or more.";
    case "email-already-in-use":
      return "You have already signed in this account.";
    default:
      return "Sorry, unknown error has occured. Please try again later.";
  }
}
