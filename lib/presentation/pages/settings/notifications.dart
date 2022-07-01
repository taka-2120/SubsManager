import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../widgets/notif_date_picker_widget.dart';
import '../../widgets/page_title_widget.dart';
import '../../widgets/toggle_item_widget.dart';
import 'package:subsmanager/l10n/l10n.dart';

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
    final l10n = L10n.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            PageTitle(
              title: l10n.notif,
              back: true,
              rightButton: false,
              rightFunc: null,
              rightIcon: null,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    ToggleItem(l10n.enable_notif),
                    const NotifDatePicker(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
