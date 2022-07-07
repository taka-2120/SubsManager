import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/presentation/widgets/dialogs/alert.dart';
import 'package:subsmanager/use_case/initialize_value.dart';

final authServicesProvider = Provider((ref) => AuthServices());

class AuthServices {
  AuthServices();
  final _auth = FirebaseAuth.instance;

  String get currentUid => _auth.currentUser!.uid;
  String? get currentuserName => _auth.currentUser!.displayName;
  String? get currentuserEmail => _auth.currentUser!.email;

  Future<void> signIn({
    required String email,
    required String pass,
  }) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: pass,
    );
  }

  Future<void> signOut(WidgetRef ref) async {
    await _auth.signOut();
    Future.microtask(
      () {
        InitializeValue().init(ref);
      },
    );
    _auth.authStateChanges();
  }

  Future<void> register({
    required String email,
    required String pass,
    required String name,
  }) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: pass,
    );
    _auth.currentUser!.updateDisplayName(name);
    _auth.authStateChanges();
  }

  Future<void> delete() async {
    _auth.currentUser!.delete();
    _auth.authStateChanges();
  }

  Future<void> updatePassword(
    BuildContext context, {
    required String currentPass,
    required String newPass,
    required ValueNotifier<bool> isloading,
  }) async {
    final cred = EmailAuthProvider.credential(
      email: currentuserEmail!,
      password: currentPass,
    );

    _auth.currentUser!.reauthenticateWithCredential(cred).then((value) {
      _auth.currentUser!.updatePassword(newPass).then(
        (_) async {
          isloading.value = false;
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
        (e) async {
          isloading.value = false;
          await showDialog(
            barrierColor: Colors.black26,
            context: context,
            builder: (_) {
              return CustomAlertDialog(
                title: "Error",
                description: e.toString(),
                isOkOnly: true,
              );
            },
          );
        },
      );
    }).catchError(
      (e) async {
        isloading.value = false;
        await showDialog(
          barrierColor: Colors.black26,
          context: context,
          builder: (_) {
            return CustomAlertDialog(
              title: "Error",
              description: e.toString(),
              isOkOnly: true,
            );
          },
        );
      },
    );
  }

  Future<void> resetPassword(
    BuildContext context, {
    required String email,
    required ValueNotifier<bool> isloading,
  }) async {
    isloading.value = true;
    await _auth.sendPasswordResetEmail(email: email).then(
      (value) async {
        isloading.value = false;
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
      (e) async {
        isloading.value = false;
        await showDialog(
          barrierColor: Colors.black26,
          context: context,
          builder: (_) {
            return CustomAlertDialog(
              title: "Error",
              description: e.toString(),
              isOkOnly: true,
            );
          },
        );
      },
    );
  }
}
