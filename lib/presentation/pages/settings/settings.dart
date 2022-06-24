import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/domain/auth/auth_services.dart';
import 'package:subsmanager/use_case/app_info.dart';
import 'package:subsmanager/globals.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/pages/settings/credits.dart';
import 'package:subsmanager/presentation/pages/settings/notifications.dart';
import 'package:subsmanager/presentation/widgets/page_title.dart';
import 'package:subsmanager/presentation/widgets/settings_item.dart';
import 'package:subsmanager/theme.dart';
import 'package:subsmanager/use_case/notifiers/user_data.dart';

class Settings extends HookConsumerWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;
    final userData = ref.watch(userDataProvider.select((value) => value));

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
                          right: userData.username ?? "Not Set",
                          navigatable: false,
                          disposable: false,
                          func: () {
                            showFieldDialog(context);
                          },
                        ),
                        SettingsItem(
                          icon: const Icon(Icons.mail_rounded),
                          left: l10n.email,
                          right: userData.email,
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
                            AuthServices().signOut(context, ref);
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
