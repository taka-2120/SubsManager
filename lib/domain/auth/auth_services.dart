import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/globals.dart';
import 'package:subsmanager/presentation/widgets/dialogs/alert.dart';
import 'package:subsmanager/use_case/initialize_value.dart';
import 'package:subsmanager/use_case/notif_services.dart';

final authServicesProvider = Provider((ref) => AuthServices());

class AuthServices {
  AuthServices();
  String get currentUid => authInstance.currentUser!.uid;
  String? get currentuserName => authInstance.currentUser!.displayName;
  String? get currentuserEmail => authInstance.currentUser!.email;

  Future<void> signIn({
    required String email,
    required String pass,
  }) async {
    await authInstance.signInWithEmailAndPassword(
      email: email,
      password: pass,
    );
  }

  Future<void> signOut(WidgetRef ref) async {
    await cancelAllNotif();
    await authInstance.signOut();
    Future.microtask(
      () {
        InitializeValue().init(ref);
      },
    );
    authInstance.authStateChanges();
  }

  Future<void> register({
    required String email,
    required String pass,
    required String name,
  }) async {
    await authInstance.createUserWithEmailAndPassword(
      email: email,
      password: pass,
    );
    authInstance.currentUser!.updateDisplayName(name);
    authInstance.authStateChanges();
  }

  Future<void> deleteUser() async {
    await cancelAllNotif();
    await authInstance.currentUser!.delete();
    authInstance.authStateChanges();
  }

  Future<void> updatePassword(
    BuildContext context, {
    required String currentPassword,
    required String newPassword,
  }) async {
    final cred = EmailAuthProvider.credential(
      email: currentuserEmail!,
      password: currentPassword,
    );

    authInstance.currentUser!.reauthenticateWithCredential(cred).then((value) {
      authInstance.currentUser!.updatePassword(newPassword).then(
        (_) async {
          await showDialog(
            barrierColor: Colors.black26,
            context: context,
            builder: (_) {
              return const CustomAlertDialog(
                title: "Message",
                description: "Your password was successfully updated.",
                isOkOnly: true,
              );
            },
          );
        },
      ).catchError(
        (error) async {
          await showDialog(
            barrierColor: Colors.black26,
            context: context,
            builder: (_) {
              return CustomAlertDialog(
                title: "Error",
                description: error.toString(),
                isOkOnly: true,
              );
            },
          );
        },
      );
    }).catchError(
      (error) async {
        await showDialog(
          barrierColor: Colors.black26,
          context: context,
          builder: (_) {
            return CustomAlertDialog(
              title: "Error",
              description: error.toString(),
              isOkOnly: true,
            );
          },
        );
      },
    );
  }

  Future<void> updateUsername(String username) async {
    await authInstance.currentUser!.updateDisplayName(username);
    authInstance.userChanges();
  }

  Future<void> resetPassword(
    BuildContext context, {
    required String email,
  }) async {
    await authInstance.sendPasswordResetEmail(email: email).then(
      (value) async {
        await showDialog(
          barrierColor: Colors.black26,
          context: context,
          builder: (_) {
            return const CustomAlertDialog(
              title: "Message",
              description:
                  "The password reset email has been successfully sent to you.",
              isOkOnly: true,
            );
          },
        );
      },
    ).catchError(
      (error) async {
        await showDialog(
          barrierColor: Colors.black26,
          context: context,
          builder: (_) {
            return CustomAlertDialog(
              title: "Error",
              description: error.toString(),
              isOkOnly: true,
            );
          },
        );
      },
    );
  }
}
