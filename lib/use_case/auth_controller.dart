import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subsmanager/domain/auth/auth_services.dart';
import 'package:subsmanager/globals.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/main.dart';
import 'package:subsmanager/presentation/widgets/dialogs/alert.dart';
import 'package:subsmanager/use_case/network.dart';

class AuthController {
  Future<void> connectFB(
    BuildContext context, {
    required ValueNotifier<bool> isLoading,
    required bool isLogin,
    required String email,
    required String pass,
    String? name,
  }) async {
    final l10n = L10n.of(context)!;
    isLoading.value = true;

    Network().isConnected().then(
      (result) async {
        switch (result) {
          case false:
            //No Connection
            isLoading.value = false;
            await showDialog(
              barrierColor: Colors.black26,
              context: context,
              builder: (_) {
                return CustomAlertDialog(
                  title: l10n.error,
                  description: getLogInErrorsString(l10n, "network", false),
                  isOkOnly: true,
                );
              },
            );
            return;

          case true:
            try {
              if (isLogin) {
                await AuthServices().signIn(
                  email: email,
                  pass: pass,
                );
                name = FirebaseAuth.instance.currentUser!.displayName;
              } else {
                await AuthServices().register(
                  email: email,
                  pass: pass,
                  name: name ?? "Not Set",
                );
              }
              isLoading.value = false;
              Future.microtask(
                () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const BasePage(),
                    ),
                  );
                },
              );
            } on FirebaseAuthException catch (e) {
              final isEmpty = email.isEmpty ||
                  pass.isEmpty ||
                  (isLogin ? false : name!.isEmpty);
              isLoading.value = false;
              await showDialog(
                barrierColor: Colors.black26,
                context: context,
                builder: (_) {
                  return CustomAlertDialog(
                    title: l10n.error,
                    description: isLogin
                        ? getLogInErrorsString(l10n, e.code, isEmpty)
                        : getRegisterErrorsString(l10n, e.code, isEmpty),
                    isOkOnly: true,
                  );
                },
              );
            }
        }
      },
    );
  }
}
