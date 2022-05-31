import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../widgets/page_title.dart';
import '../../widgets/toggle_item.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NotificationsPage();
  }
}

class NotificationsPage extends ConsumerWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            pageTitle(context, "Notifications", true, false, null, null),
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [notifToggleItem("Enable Notifications", ref)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
