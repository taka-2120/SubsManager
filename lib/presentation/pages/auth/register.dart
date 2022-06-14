import 'package:flutter/material.dart';
import 'package:subsmanager/globals.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:subsmanager/presentation/dialogs/alert.dart';
import 'package:subsmanager/presentation/dialogs/loading.dart';
import 'package:subsmanager/presentation/widgets/page_title.dart';
import 'package:subsmanager/presentation/widgets/textfield_set.dart';

import '../../../main.dart';
import '../../../models/function.dart';
import '../../widgets/default_appbar.dart';
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
      appBar: const DefaultAppBar(),
      body: WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
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
                      topPad: 20,
                      onTap: () async {
                        isConnected().then(
                          (result) {
                            switch (result) {
                              case false:
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
                          await auth.createUserWithEmailAndPassword(
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
                                description: getRegisterErrorsString(
                                    l10n, e.code, isEmpty),
                                ok: true,
                              );
                            },
                          );
                        } catch (e) {
                          final isEmpty =
                              emailCtl.text.isEmpty || passCtl.text.isEmpty;
                          showDialog(
                            barrierColor: Colors.black26,
                            context: context,
                            builder: (context) {
                              return CustomAlertDialog(
                                title: "Error",
                                description: getLogInErrorsString(
                                    l10n, e.toString(), isEmpty),
                                ok: true,
                              );
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
