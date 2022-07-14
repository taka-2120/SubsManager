import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:subsmanager/main.dart';
import 'package:subsmanager/presentation/pages/auth/login.dart';

class AuthOuter extends HookWidget {
  const AuthOuter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = useState(false);

    useEffect(() {
      FirebaseAuth.instance.authStateChanges().listen((user) {
        switch (user == null) {
          case true:
            isLoggedIn.value = false;
            break;
          case false:
            isLoggedIn.value = true;
            break;
        }
      });
      return;
    });

    if (isLoggedIn.value) {
      return const AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: BasePage(),
      );
    }
    return const AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: LogIn(),
    );
  }
}
