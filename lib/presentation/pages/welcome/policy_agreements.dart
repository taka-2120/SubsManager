import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/pages/welcome/end_intro.dart';
import 'package:subsmanager/presentation/widgets/default_appbar.dart';
import 'package:subsmanager/presentation/widgets/rounded_button.dart';
import 'package:subsmanager/use_case/notifiers/welcome_settings.dart';

class PolicyAgreemtenes extends ConsumerWidget {
  const PolicyAgreemtenes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;
    final welcomeSettings = ref.watch(welcomeSettingsProvider);
    final readWelcomeSettings = ref.read(welcomeSettingsProvider.notifier);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "lib/assets/icons/lock.png",
                    height: 90,
                    fit: BoxFit.fitWidth,
                  ),
                  const Text(
                    "Privacy Policy",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: const Text("Something..."),
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: welcomeSettings.isAgreed,
                        onChanged: (bool? value) => readWelcomeSettings
                            .updateAgreeState(value ?? false),
                      ),
                      const Text("I agree to Privacy Policy")
                    ],
                  ),
                  RoundededButton(
                    text: "Next",
                    topPad: 20,
                    isDisabled: !welcomeSettings.isAgreed,
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const EndIntro(),
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
