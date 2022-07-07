import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:subsmanager/domain/auth/auth_services.dart';
import 'package:subsmanager/globals.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/pages/auth/login.dart';
import 'package:subsmanager/presentation/pages/settings/credits.dart';
import 'package:subsmanager/presentation/pages/settings/notifications.dart';
import 'package:subsmanager/presentation/widgets/dialogs/alert.dart';
import 'package:subsmanager/presentation/widgets/page_title_widget.dart';
import 'package:subsmanager/presentation/widgets/settings_item_widget.dart';
import 'package:subsmanager/theme.dart';
import 'package:subsmanager/use_case/user_data/notifier/user_data.dart';
import 'package:subsmanager/use_case/notifiers/versions_notifier.dart';

class Settings extends HookConsumerWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;
    final userData = ref.watch(userDataProvider.select((value) => value));
    final versions = ref.watch(versionsNotifierProvider);
    final versionNotifier = ref.read(versionsNotifierProvider.notifier);

    useEffect(() {
      PackageInfo.fromPlatform().then((value) {
        versionNotifier.update(value.version);
      });
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
                          right: versions,
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
                            showusernameDialog(context);
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
                          icon: const Icon(Icons.password_rounded),
                          left: "Change Password",
                          right: "",
                          navigatable: false,
                          disposable: false,
                          func: () {
                            showPasswordDialog(context);
                          },
                        ),
                        SettingsItem(
                          icon: const Icon(Icons.remove_circle_outline_rounded),
                          left: l10n.signout,
                          right: "",
                          navigatable: false,
                          disposable: false,
                          func: () async {
                            await showDialog(
                              barrierColor: Colors.black26,
                              context: context,
                              builder: (_) {
                                return CustomAlertDialog(
                                  title: "Confirmation",
                                  description: "Do you sure want to logout?",
                                  isOkOnly: false,
                                  func: () {
                                    AuthServices().signOut(ref);
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => const LogIn(),
                                      ),
                                    );
                                  },
                                  optionLabel: l10n.signout,
                                  mainColor: Colors.red,
                                );
                              },
                            );
                          },
                        ),
                        SettingsItem(
                          icon: const Icon(Icons.delete),
                          left: "Delete Account",
                          right: "",
                          navigatable: false,
                          disposable: false,
                          func: () async {
                            await showDialog(
                              barrierColor: Colors.black26,
                              context: context,
                              builder: (_) {
                                return CustomAlertDialog(
                                  title: "Important Confirmation",
                                  description:
                                      "Do you sure want to delete your account?\nThis operation cannot be undone, and your data will be permanently deleted.",
                                  isOkOnly: false,
                                  func: () {
                                    AuthServices().delete();
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => const LogIn(),
                                      ),
                                    );
                                  },
                                  optionLabel: "Delete",
                                  mainColor: Colors.red,
                                );
                              },
                            );
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
