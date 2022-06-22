import 'package:flutter/material.dart';
import 'package:subsmanager/domain/auth/auth_services.dart';
import 'package:subsmanager/globals.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:subsmanager/presentation/dialogs/alert.dart';
import 'package:subsmanager/presentation/pages/auth/register.dart';
import 'package:subsmanager/presentation/widgets/textfield_set.dart';

import '../../../use_case/network.dart';
import '../../widgets/default_appbar.dart';
import '../../widgets/rounded_button.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    final TextEditingController emailCtl = TextEditingController();
    final TextEditingController passCtl = TextEditingController();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const DefaultAppBar(),
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              child: SingleChildScrollView(
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
                          Text(
                            l10n.welcome,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
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
                            title: l10n.email,
                            type: KeyType.email,
                            controller: emailCtl,
                            secured: false,
                            suggestion: false,
                            divider: true,
                            showTitle: true,
                          ),
                          TextFieldSet(
                            title: l10n.pass,
                            type: KeyType.norm,
                            controller: passCtl,
                            secured: true,
                            suggestion: false,
                            divider: false,
                            showTitle: true,
                          ),
                          RoundededButton(
                            text: l10n.login,
                            fontColor: Colors.black,
                            topPad: 20,
                            backgroundColor: Theme.of(context).primaryColor,
                            onTap: () async {
                              Network().isConnected().then(
                                (result) async {
                                  switch (result) {
                                    case false:
                                      await showDialog(
                                        barrierColor: Colors.black26,
                                        context: context,
                                        builder: (context) {
                                          return CustomAlertDialog(
                                            title: l10n.error,
                                            description: getLogInErrorsString(
                                                l10n, "network", false),
                                            ok: true,
                                          );
                                        },
                                      );
                                      return;

                                    case true:
                                      try {
                                        AuthServices().signIn(
                                          email: emailCtl.text,
                                          pass: passCtl.text,
                                        );
                                      } on FirebaseAuthException catch (e) {
                                        final isEmpty = emailCtl.text.isEmpty ||
                                            passCtl.text.isEmpty;
                                        await showDialog(
                                          barrierColor: Colors.black26,
                                          context: context,
                                          builder: (context) {
                                            return CustomAlertDialog(
                                              title: l10n.error,
                                              description: getLogInErrorsString(
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
                          RoundededButton(
                            text: l10n.register,
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
            ),
          ],
        ),
      ),
    );
  }
}
