import 'package:flutter/material.dart';
import 'package:subsmanager/common.dart';
import '../../globals.dart' as globals;
import 'notifications.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            pageTitle(context, globals.settings, false, false),
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
                              "Notifications", "", true,
                              destination: const Notifications()),
                          settingsItem(context, const Icon(Icons.note),
                              "Credits", "", true,
                              destination: const Notifications()),
                          settingsItem(context, const Icon(Icons.info),
                              "Version", "1.0.0", false),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}