import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/main.dart';
import 'package:subsmanager/presentation/pages/auth/login.dart';

class AuthOuter extends ConsumerWidget {
  const AuthOuter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).backgroundColor,
              ),
            ),
          );
        }
        if (snapshot.hasData) {
          return const AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: BasePage(),
          );
        }
        return const AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: LogIn(),
        );
      },
    );
  }
}
