import 'package:flutter/material.dart';
import 'package:subsmanager/common.dart';
import '../../globals.dart' as globals;

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                        settingsItem(
                            const Icon(Icons.info), "Version", "1.0.0", false),
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

Widget settingsItem(Icon icon, String left, String right, bool navigatable) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      border: Border.all(color: globals.borderColor),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          icon,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(left),
          ),
        ],
      ),
      navigatable ? const Icon(Icons.arrow_right) : Text(right)
    ]),
  );
}
