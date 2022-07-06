import 'package:flutter/material.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/pages/welcome/intro_notif.dart';
import 'package:subsmanager/presentation/widgets/default_appbar_widget.dart';
import 'package:subsmanager/presentation/widgets/rounded_button_widget.dart';

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
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      "lib/assets/icon.png",
                      height: 120,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(height: 80),
                  Text(
                    l10n.welcome_msg,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              RoundededButton(
                text: l10n.next,
                topPad: 20,
                isDisabled: false,
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
