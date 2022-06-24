import 'package:flutter/material.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/pages/welcome/intro_notif.dart';
import 'package:subsmanager/presentation/widgets/default_appbar.dart';
import 'package:subsmanager/presentation/widgets/rounded_button.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({Key? key}) : super(key: key);

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
              Text(
                l10n.welcome,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Text(
                "Thank you for using SubsManager!\nLet's get startd setup this app first, and register to our services!",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              RoundededButton(
                text: "Next",
                topPad: 20,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const IntroNotif(),
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
