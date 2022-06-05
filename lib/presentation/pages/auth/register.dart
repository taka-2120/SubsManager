import 'package:flutter/material.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:subsmanager/main.dart';
import 'package:subsmanager/presentation/dialogs/alert.dart';
import 'package:subsmanager/presentation/widgets/textfield_set.dart';

import '../../widgets/rounded_button.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    final FirebaseAuth auth = FirebaseAuth.instance;

    final TextEditingController emailCtl = TextEditingController();
    final TextEditingController passCtl = TextEditingController();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Welcome!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFieldSet(
                title: "E-mail",
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
                text: "Register",
                fontColor: Colors.black,
                topPad: 10,
                onTap: () {
                  try {
                    final newUser = auth.createUserWithEmailAndPassword(
                        email: emailCtl.text, password: passCtl.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BasePage()),
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'email-already-in-use') {
                      showDialog(
                        barrierColor: Colors.black26,
                        context: context,
                        builder: (context) {
                          return const CustomAlertDialog(
                            title: "Error",
                            description: "E-mail is already in use.",
                            ok: true,
                          );
                        },
                      );
                    } else if (e.code == 'invalid-email') {
                      showDialog(
                        barrierColor: Colors.black26,
                        context: context,
                        builder: (context) {
                          return const CustomAlertDialog(
                            title: "Error",
                            description: "E-mail format is incorecct.",
                            ok: true,
                          );
                        },
                      );
                    } else if (e.code == 'operation-not-allowed') {
                      showDialog(
                        barrierColor: Colors.black26,
                        context: context,
                        builder: (context) {
                          return const CustomAlertDialog(
                            title: "Error",
                            description:
                                "This E-mail address or password is currently disabled.",
                            ok: true,
                          );
                        },
                      );
                    } else if (e.code == 'weak-password') {
                      showDialog(
                        barrierColor: Colors.black26,
                        context: context,
                        builder: (context) {
                          return const CustomAlertDialog(
                            title: "Error",
                            description:
                                "Password should be 6 letters or more.",
                            ok: true,
                          );
                        },
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
