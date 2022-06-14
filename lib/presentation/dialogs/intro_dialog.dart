import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subsmanager/l10n/l10n.dart';

import '../../notification_services.dart';

class IntroDialog extends StatelessWidget {
  const IntroDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.notification,
  }) : super(key: key);

  final String title, description;
  final bool notification;

  Future<void> updateFirstAdd() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstAdd', false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;

    return Dialog(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const Divider(
            height: 1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: InkWell(
              onTap: () {
                NotificationService().init();
                updateFirstAdd();
                Navigator.of(context).pop();
              },
              child: Center(
                child: Text(
                  l10n.d_ok,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
