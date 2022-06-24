import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/dialogs/field_dialog.dart';
import 'package:subsmanager/use_case/notifiers/tab_index.dart';

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

enum KeyType {
  num,
  email,
  url,
  norm,
}

TextInputType setKeyType(KeyType type) {
  switch (type) {
    case KeyType.num:
      return TextInputType.number;
    case KeyType.email:
      return TextInputType.emailAddress;
    case KeyType.url:
      return TextInputType.url;
    case KeyType.norm:
      return TextInputType.text;
  }
}

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

enum SortOptions {
  alphAcc,
  alphDec,
  dateAcc,
  dateDec,
  priceAcc,
  priceDec,
}

String getSortOptionsString(L10n l10n, SortOptions sortOptions) {
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

String getLogInErrorsString(L10n l10n, String errors, bool isEmpty) {
  switch (errors) {
    case "network":
      return l10n.e_network;
  }

  switch (isEmpty) {
    case true:
      return l10n.e_login_empty;
  }

  switch (errors) {
    case "invalid-email":
      return l10n.e_invaild_email;
    case "user-disabled":
      return l10n.e_user_disabled;
    case "user-not-found":
      return l10n.e_user_not_found;
    case "wrong-password":
      return l10n.e_wrong_pass;
    default:
      return l10n.e_unexpected;
  }
}

String getRegisterErrorsString(L10n l10n, String errors, bool isEmpty) {
  switch (errors) {
    case "network":
      return l10n.e_network;
  }

  switch (isEmpty) {
    case true:
      return l10n.e_register_empty;
  }

  switch (errors) {
    case "invalid-email":
      return l10n.e_invaild_email;
    case "email-already-in-us":
      return l10n.e_email_already_in_use;
    case "operation-not-allowed":
      return l10n.e_all_disabled;
    case "weak-password":
      return l10n.e_weak_pass;
    default:
      return l10n.e_unexpected;
  }
}

void showFieldDialog(BuildContext context) {
  showDialog(
    barrierColor: Colors.black26,
    context: context,
    builder: (context) {
      return FieldDialog(
        title: L10n.of(context)!.update_username,
        currentName: FirebaseAuth.instance.currentUser!.displayName ?? "",
      );
    },
  );
}
