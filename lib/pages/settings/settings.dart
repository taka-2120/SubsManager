import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:subsmanager/common.dart';
import '../../globals.dart' as globals;

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            pageTitle(globals.settings),
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
                          settingsItem(const Icon(Icons.notifications),
                              "Notifications", "", true),
                          settingsItem(
                              const Icon(Icons.note), "Credits", "", true),
                          settingsItem(const Icon(Icons.info), "Version",
                              "1.0.0", false),
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
