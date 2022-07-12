import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/widgets/dialogs/alert.dart';
import 'package:subsmanager/presentation/widgets/sheet_header_widget.dart';
import 'package:subsmanager/presentation/widgets/sub_info_widget.dart';
import 'package:subsmanager/use_case/sub_value/notifier/sub_value_notifier.dart';
import 'package:subsmanager/use_case/subs_list/notifier/subs_list_notifier.dart';

class SubAdd extends StatelessWidget {
  const SubAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SubAddSheet();
  }
}

class SubAddSheet extends ConsumerWidget {
  const SubAddSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;
    final theme = Theme.of(context);
    final subsListState = ref.read(subsListNotifierProvider.notifier);
    final valueState = ref.watch(subValueNotifierProvider);

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
              funcRight: () async {
                if (valueState.name.text == "" ||
                    valueState.fee.text == "" ||
                    valueState.period == null) {
                  await showDialog(
                    barrierColor: Colors.black26,
                    context: context,
                    builder: (context) {
                      return const CustomAlertDialog(
                        title: "Error",
                        description: "Please fill these field.",
                        isOkOnly: true,
                      );
                    },
                  );
                } else {
                  subsListState.addSub(context);
                  Navigator.of(context).pop();
                }
              },
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
