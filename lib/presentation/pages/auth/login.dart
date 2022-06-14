import 'package:flutter/material.dart';
import 'package:subsmanager/globals.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:subsmanager/main.dart';
import 'package:subsmanager/presentation/dialogs/alert.dart';
import 'package:subsmanager/presentation/pages/auth/register.dart';
import 'package:subsmanager/presentation/widgets/textfield_set.dart';

import '../../../models/function.dart';
import '../../dialogs/loading.dart';
import '../../widgets/default_appbar.dart';
import '../../widgets/rounded_button.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    final auth = FirebaseAuth.instance;
    final TextEditingController emailCtl = TextEditingController();
    final TextEditingController passCtl = TextEditingController();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const DefaultAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      "lib/assets/icon.png",
                      height: 120,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const Text(
                    "Welcome!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 15,
              ),
              child: Column(
                children: [
                  TextFieldSet(
                    title: "Email",
                    num: false,
                    controller: emailCtl,
                    url: false,
                    pass: false,
                    divider: true,
                    rightContent: null,
                    bottomNotes: null,
                  ),
                  TextFieldSet(
                    title: "Password",
                    num: false,
                    controller: passCtl,
                    url: false,
                    pass: true,
                    divider: false,
                    rightContent: null,
                    bottomNotes: null,
                  ),
                  RoundededButton(
                    text: "Log In",
                    fontColor: Colors.black,
                    topPad: 20,
                    backgroundColor: Theme.of(context).primaryColor,
                    onTap: () async {
                      isConnected().then(
                        (result) {
                          switch (result) {
                            case true:
                              showDialog(
                                barrierColor: Colors.black26,
                                context: context,
                                builder: (context) {
                                  return CustomAlertDialog(
                                    title: "Error",
                                    description: getLogInErrorsString(
                                        l10n,
                                        "Please check your Internet connection.",
                                        false),
                                    ok: true,
                                  );
                                },
                              );
                              return;
                          }
                        },
                      );
                      try {
                        await auth.signInWithEmailAndPassword(
                          email: emailCtl.text,
                          password: passCtl.text,
                        );
                        auth.authStateChanges();
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) => const Loading(),
                        );
                        await Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                            return const BasePage();
                          }),
                        );
                      } on FirebaseAuthException catch (e) {
                        final isEmpty =
                            emailCtl.text.isEmpty || passCtl.text.isEmpty;
                        showDialog(
                          barrierColor: Colors.black26,
                          context: context,
                          builder: (context) {
                            return CustomAlertDialog(
                              title: "Error",
                              description:
                                  getLogInErrorsString(l10n, e.code, isEmpty),
                              ok: true,
                            );
                          },
                        );
                      }
                    },
                  ),
                  RoundededButton(
                    text: "Register",
                    fontColor: Colors.black,
                    topPad: 20,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Register(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
