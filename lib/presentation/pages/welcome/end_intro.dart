import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/pages/auth/auth_outer.dart';
import 'package:subsmanager/presentation/widgets/default_appbar_widget.dart';
import 'package:subsmanager/presentation/widgets/buttons/rounded_button_widget.dart';

class EndIntro extends StatelessWidget {
  const EndIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const DefaultAppBar(),
      body: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                l10n.all_done,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Image.asset(
                "lib/assets/icons/check_light.png",
                height: 120,
                fit: BoxFit.fitWidth,
              ),
              Text(
                l10n.done_msg,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              RoundededButton(
                text: l10n.lets_go,
                topPad: 20,
                isDisabled: false,
                onTap: () {
                  final sp = SharedPreferences.getInstance();
                  sp.then((value) => value.setBool("welcome", false));

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const AuthOuter(),
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
