import 'package:flutter/material.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/pages/welcome/policy_agreements.dart';
import 'package:subsmanager/presentation/widgets/default_appbar.dart';
import 'package:subsmanager/presentation/widgets/rounded_button.dart';

class IntroNotif extends StatelessWidget {
  const IntroNotif({Key? key}) : super(key: key);

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
                "Notifications Permission",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Text(
                "We need notifications permission to notify you the billing date of your subscriptions.",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Column(
                children: [
                  RoundededButton(
                    text: "Enable Notifications",
                    topPad: 20,
                    onTap: () {
                      //ENABLE NOTIFICATION
                    },
                  ),
                  RoundededButton(
                    text: "Next",
                    topPad: 20,
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const PolicyAgreemtenes(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
