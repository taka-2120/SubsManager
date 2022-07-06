import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:subsmanager/presentation/pages/welcome/policy_agreements.dart';
import 'package:subsmanager/presentation/widgets/default_appbar_widget.dart';
import 'package:subsmanager/presentation/widgets/rounded_button_widget.dart';
import 'package:subsmanager/use_case/notifiers/welcome_settings.dart';

class IntroNotif extends ConsumerWidget {
  const IntroNotif({Key? key}) : super(key: key);

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
              Text(
                l10n.notif_perm,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Image.asset(
                "lib/assets/icons/notification.png",
                height: 120,
                fit: BoxFit.fitWidth,
              ),
              Text(
                l10n.intro_notif,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Column(
                children: [
                  RoundededButton(
                    text: l10n.enable_notif,
                    topPad: 20,
                    isDisabled: false,
                    onTap: () {
                      AwesomeNotifications().isNotificationAllowed().then(
                        (isAllowed) {
                          if (!isAllowed) {
                            AwesomeNotifications()
                                .requestPermissionToSendNotifications();
                          }
                          readWelcomeSettings.updateNotifState(true);
                        },
                      );
                    },
                  ),
                  RoundededButton(
                    text: l10n.next,
                    topPad: 20,
                    isDisabled: !welcomeSettings.isNotifEnabled,
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
