import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/widgets/headers/sheet_header_widget.dart';
import 'package:subsmanager/presentation/widgets/sub_info_widget.dart';
import 'package:subsmanager/use_case/sub_value/notifier/sub_value_notifier.dart';
import 'package:subsmanager/use_case/subs_list/notifier/subs_list_notifier.dart';

class SubAddSheet extends ConsumerWidget {
  const SubAddSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;
    final theme = Theme.of(context);
    final subsListState = ref.read(subsListNotifierProvider.notifier);

    useEffect(() {
      ref.read(subValueNotifierProvider.notifier).init();
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
              funcRight: () => subsListState.addSub(context),
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
