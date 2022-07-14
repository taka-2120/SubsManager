import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/widgets/headers/sheet_header_widget.dart';
import 'package:subsmanager/presentation/widgets/buttons/rounded_button_widget.dart';
import 'package:subsmanager/presentation/widgets/sub_info_widget.dart';
import 'package:subsmanager/use_case/sub_value/notifier/sub_value_notifier.dart';
import 'package:subsmanager/use_case/subs_list/notifier/subs_list_notifier.dart';

class SubEditSheet extends HookConsumerWidget {
  const SubEditSheet(this.index, {Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;
    final listNotifier = ref.read(subsListNotifierProvider.notifier);
    final listState = ref.watch(subsListNotifierProvider);
    final valueNotifier = ref.read(subValueNotifierProvider.notifier);

    useEffect(
      () {
        Future.microtask(
          () => valueNotifier.setValues(
            context,
            listState.subsList[index],
          ),
        );
        return;
      },
    );

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SheetHeader(
              title: l10n.edit,
              funcLeft: () => Navigator.pop(context),
              funcRight: () => listNotifier.updateSub(
                context,
                item: listState.subsList[index],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const SubInfo(),
                    RoundededButton(
                      text: l10n.delete,
                      fontColor: const Color.fromARGB(255, 235, 35, 35),
                      topPad: 30,
                      isDisabled: false,
                      onTap: () => listNotifier.deleteSub(
                        context,
                        item: listState.subsList[index],
                      ),
                    ),
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
