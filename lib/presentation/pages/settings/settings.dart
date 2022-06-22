import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/use_case/app_info.dart';
import 'package:subsmanager/globals.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/pages/settings/credits.dart';
import 'package:subsmanager/presentation/pages/settings/notifications.dart';
import 'package:subsmanager/presentation/widgets/page_title.dart';
import 'package:subsmanager/presentation/widgets/settings_item.dart';
import 'package:subsmanager/theme.dart';
import 'package:subsmanager/use_case/notifiers/username.dart';

class Settings extends HookConsumerWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;
    final FirebaseAuth auth = FirebaseAuth.instance;
    var email = "Not Signed In";
    final username = ref.watch(usernameProvider.select((value) => value));

    useEffect(() {
      try {
        email = auth.currentUser!.email ?? "Not Signed In";
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 15),
                          child: Text(
                            l10n.general,
                            style: const TextStyle(
                              color: borderColor,
                            ),
                          ),
                        ),
                        SettingsItem(
                          icon: const Icon(Icons.notifications),
                          left: l10n.notif,
                          right: "",
                          navigatable: true,
                          disposable: false,
                          destination: const Notifications(),
                        ),
                        SettingsItem(
                          icon: const Icon(Icons.note),
                          left: l10n.credits,
                          right: "",
                          navigatable: true,
                          disposable: false,
                          destination: const Credits(),
                        ),
                        SettingsItem(
                          icon: const Icon(Icons.info),
                          left: l10n.version,
                          right: AppInfo().getAppVersion(),
                          navigatable: false,
                          disposable: false,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 15),
                          child: Text(
                            l10n.userinfo,
                            style: const TextStyle(
                              color: borderColor,
                            ),
                          ),
                        ),
                        SettingsItem(
                          icon: const Icon(Icons.person_rounded),
                          left: l10n.username,
                          right: username.username,
                          navigatable: false,
                          disposable: false,
                          func: () {
                            showFieldDialog(context);
                          },
                        ),
                        SettingsItem(
                          icon: const Icon(Icons.person_rounded),
                          left: l10n.email,
                          right: email,
                          navigatable: false,
                          disposable: false,
                        ),
                        SettingsItem(
                          icon: const Icon(Icons.remove_circle_outline_rounded),
                          left: l10n.signout,
                          right: "",
                          navigatable: true,
                          disposable: true,
                          func: () {
                            signOut(ref);
                          },
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
