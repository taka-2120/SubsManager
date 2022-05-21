import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subsmanager/model.dart';
import '../../globals.dart' as globals;
import '../../notifier.dart' as models;

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => models.NotificationsModel()),
      ],
      child: const NotificationsPage(),
    );
  }
}

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsState();
}

class _NotificationsState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<models.NotificationsModel>(
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                pageTitle(context, "Notifications", true, true),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        notifToggleItem("Enable Notifications", model)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
