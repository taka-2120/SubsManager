import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/pages/welcome/end_intro.dart';
import 'package:subsmanager/presentation/widgets/default_appbar_widget.dart';
import 'package:subsmanager/presentation/widgets/rounded_button_widget.dart';
import 'package:subsmanager/use_case/notifiers/welcome_settings.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

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
                    height: 80,
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
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: FutureBuilder(
                    future: DefaultAssetBundle.of(context)
                        .loadString("lib/privacy_policy/privacy_policy_ja.md"),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.hasData) {
                        return MarkdownBody(
                          data: snapshot.data ?? "",
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
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
