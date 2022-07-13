import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/widgets/dialogs/change_pass_dialog.dart';
import 'package:subsmanager/presentation/widgets/dialogs/username_dialog.dart';

void showusernameDialog(BuildContext context) {
  showDialog(
    barrierColor: Colors.black26,
    context: context,
    builder: (context) {
      return UsernameDialog(
        title: L10n.of(context)!.update_username,
        currentName: FirebaseAuth.instance.currentUser!.displayName ?? "",
      );
    },
  );
}

void showPasswordDialog(BuildContext context) async {
  await showDialog(
    barrierColor: Colors.black26,
    context: context,
    builder: (context) {
      return const ChangePassDialog();
    },
  );
}
