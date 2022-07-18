import 'package:subsmanager/l10n/l10n.dart';

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
