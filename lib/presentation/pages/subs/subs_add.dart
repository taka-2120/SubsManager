import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subsmanager/extensions/fee_str_double.dart';
import 'package:subsmanager/extensions/period_nstr_int.dart';
import 'package:subsmanager/presentation/notifiers/subs_list.dart';
import 'package:subsmanager/l10n/l10n.dart';

import '../../notifiers/sub_value.dart';
import '../../widgets/sheet_header.dart';
import '../../widgets/sub_info.dart';

class SubAdd extends StatelessWidget {
  const SubAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SubAddSheet();
  }
}

// ignore: must_be_immutable
class SubAddSheet extends HookConsumerWidget {
  const SubAddSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subValue = ref.watch(subValueProvider.select((value) => value));
    final readSubList = ref.read(subsListProvider.notifier);
    final l10n = L10n.of(context)!;
    final theme = Theme.of(context);

    Future<void> notify() {
      final flnp = FlutterLocalNotificationsPlugin();
      return flnp.initialize(
        const InitializationSettings(
          iOS: IOSInitializationSettings(),
        ),
      );
    }

    Future checkIsFirst() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isFirstAdd = (prefs.getBool('isFirstAdd') ?? false);

      isFirstAdd ? null : notify();
    }

    useEffect(() {
      checkIsFirst();
      return;
    });

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SheetHeader(
              title: l10n.add,
              funcLeft: () => Navigator.pop(context),
              funcRight: () => readSubList.add(
                context,
                l10n,
                ref,
                name: subValue.name.text,
                fee: subValue.fee.text.feeToDouble(),
                url: subValue.url.text,
                isIcon: subValue.isIcon,
                favicon: subValue.favicon!,
                altColor: subValue.altColor,
                date: subValue.date,
                period: subValue.period.periodToInt(ref),
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: SubInfo(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
