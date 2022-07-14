import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/pages/welcome/end_intro.dart';
import 'package:subsmanager/presentation/widgets/default_appbar_widget.dart';
import 'package:subsmanager/presentation/widgets/buttons/rounded_button_widget.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PolicyAgreemtenes extends HookWidget {
  const PolicyAgreemtenes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    final isAgreed = useState(false);

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
                  Text(
                    l10n.privacy_policy,
                    style: const TextStyle(
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
                    future: DefaultAssetBundle.of(context).loadString(
                      "lib/privacy_policy/privacy_policy_ja.md",
                    ),
                    builder: (
                      BuildContext context,
                      AsyncSnapshot<String> snapshot,
                    ) {
                      if (snapshot.hasData) {
                        return MarkdownBody(data: snapshot.data ?? "");
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
                        value: isAgreed.value,
                        onChanged: (value) => isAgreed.value = value ?? false,
                      ),
                      Text(l10n.agree_privacy_policy)
                    ],
                  ),
                  RoundededButton(
                    text: l10n.next,
                    topPad: 20,
                    isDisabled: !isAgreed.value,
                    onTap: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const EndIntro(),
                      ),
                    ),
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
