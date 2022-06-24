import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/pages/auth/auth_outer.dart';
import 'package:subsmanager/presentation/widgets/default_appbar.dart';
import 'package:subsmanager/presentation/widgets/rounded_button.dart';

class PolicyAgreemtenes extends StatelessWidget {
  const PolicyAgreemtenes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const DefaultAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Privacy Policy",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text("Something..."),
                ),
              ),
              RoundededButton(
                text: "Agree",
                topPad: 20,
                onTap: () {
                  final sp = SharedPreferences.getInstance();
                  sp.then((value) => value.setBool("welcome", false));

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const AuthOuter(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
