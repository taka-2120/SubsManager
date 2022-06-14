import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/l10n/l10n.dart';

import '../../widgets/page_title.dart';
import '../../widgets/settings_item.dart';
import 'credits.dart';
import 'notifications.dart';

class Settings extends HookConsumerWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;
    final FirebaseAuth auth = FirebaseAuth.instance;
    var userName = "Not Signed In";

    useEffect(() {
      try {
        userName = auth.currentUser!.email ?? "Not Signed In";
      } catch (e) {}
      return;
    });

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          PageTitle(
            title: l10n.settings,
            back: false,
            rightButton: false,
            rightFunc: null,
            rightIcon: null,
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      children: [
                        SettingsItem(
                          icon: const Icon(Icons.notifications),
                          left: l10n.notif,
                          right: "",
                          navigatable: true,
                          destination: const Notifications(),
                        ),
                        SettingsItem(
                          icon: const Icon(Icons.note),
                          left: l10n.credits,
                          right: "",
                          navigatable: true,
                          destination: const Credits(),
                        ),
                        SettingsItem(
                          icon: const Icon(Icons.info),
                          left: l10n.version,
                          right: "1.0.0",
                          navigatable: false,
                          destination: null,
                        ),
                        SettingsItem(
                          icon: const Icon(Icons.verified_user_rounded),
                          left: "E-mail",
                          right: userName,
                          navigatable: false,
                          destination: null,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//SIGN OUT: await FirebaseAuth.instance.signOut();