import 'package:flutter/material.dart';
import 'package:subsmanager/globals.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:subsmanager/presentation/dialogs/alert.dart';
import 'package:subsmanager/presentation/widgets/page_title.dart';
import 'package:subsmanager/presentation/widgets/textfield_set.dart';

import '../../../models/function.dart';
import '../../widgets/default_appbar.dart';
import '../../widgets/rounded_button.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    final auth = FirebaseAuth.instance;
    final TextEditingController nameCtl = TextEditingController();
    final TextEditingController emailCtl = TextEditingController();
    final TextEditingController passCtl = TextEditingController();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const DefaultAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            const PageTitle(
              title: "Join Us Now!",
              back: true,
              rightButton: false,
              rightFunc: null,
              rightIcon: null,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "lib/assets/start.png",
                      height: 120,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  // const Text(
                  //   " ",
                  //   style:
                  //       TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  // )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 15,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldSet(
                    title: "Username",
                    type: KeyType.norm,
                    controller: nameCtl,
                    secured: false,
                    suggestion: true,
                    divider: true,
                    showTitle: true,
                  ),
                  TextFieldSet(
                    title: "E-mail",
                    type: KeyType.email,
                    controller: emailCtl,
                    secured: false,
                    suggestion: false,
                    divider: true,
                    showTitle: true,
                  ),
                  TextFieldSet(
                    title: "Password",
                    type: KeyType.norm,
                    controller: passCtl,
                    secured: true,
                    suggestion: false,
                    divider: false,
                    showTitle: true,
                  ),
                  RoundededButton(
                    text: "Register",
                    fontColor: Colors.black,
                    topPad: 20,
                    onTap: () async {
                      isConnected().then(
                        (result) async {
                          switch (result) {
                            case false:
                              await showDialog(
                                barrierColor: Colors.black26,
                                context: context,
                                builder: (context) {
                                  return CustomAlertDialog(
                                    title: "Error",
                                    description: getRegisterErrorsString(
                                        l10n, "network", false),
                                    ok: true,
                                  );
                                },
                              );
                              return;

                            case true:
                              try {
                                await auth.createUserWithEmailAndPassword(
                                  email: emailCtl.text,
                                  password: passCtl.text,
                                );
                                auth.currentUser!
                                    .updateDisplayName(nameCtl.text);
                                auth.authStateChanges();
                              } on FirebaseAuthException catch (e) {
                                final isEmpty = emailCtl.text.isEmpty ||
                                    passCtl.text.isEmpty ||
                                    nameCtl.text.isEmpty;
                                await showDialog(
                                  barrierColor: Colors.black26,
                                  context: context,
                                  builder: (context) {
                                    return CustomAlertDialog(
                                      title: "Error",
                                      description: getRegisterErrorsString(
                                          l10n, e.code, isEmpty),
                                      ok: true,
                                    );
                                  },
                                );
                              }
                          }
                        },
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
