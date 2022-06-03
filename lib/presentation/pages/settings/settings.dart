import 'package:flutter/material.dart';
import 'package:subsmanager/l10n/l10n.dart';

import '../../widgets/page_title.dart';
import '../../widgets/settings_item.dart';
import 'credits.dart';
import 'notifications.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          pageTitle(
            context,
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
                        settingsItem(context, const Icon(Icons.notifications),
                            l10n.notif, "", true,
                            destination: const Notifications()),
                        settingsItem(context, const Icon(Icons.note),
                            l10n.credits, "", true,
                            destination: const Credits()),
                        settingsItem(context, const Icon(Icons.info),
                            l10n.version, "1.0.0", false),
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
