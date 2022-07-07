import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/widgets/dialogs/alert.dart';
import 'package:subsmanager/presentation/widgets/rounded_button_widget.dart';
import 'package:subsmanager/presentation/widgets/sheet_header_widget.dart';
import 'package:subsmanager/presentation/widgets/sub_info_widget.dart';
import 'package:subsmanager/use_case/sub_value/notifier/sub_value_notifier.dart';
import 'package:subsmanager/use_case/subs_list/notifier/subs_list_notifier.dart';
import 'package:subsmanager/extensions/fee_double_str.dart';
import 'package:subsmanager/extensions/period_int_str.dart';

class SubEdit extends StatelessWidget {
  const SubEdit(this.index, {Key? key}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return SubEditSheet(index);
  }
}

class SubEditSheet extends HookConsumerWidget {
  const SubEditSheet(this.index, {Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context)!;
    final listNotifier = ref.read(subsListNotifierProvider.notifier);
    final listState = ref.watch(subsListNotifierProvider);
    final valueNotifier = ref.read(subValueNotifierProvider.notifier);
    final valueState = ref.watch(subValueNotifierProvider);

    useEffect(
      () {
        Future.microtask(() async {
          final selectedList = listState.subsList[index];
          valueNotifier.updateName(selectedList.name);
          valueNotifier.updateFee(selectedList.fee.feeToString(
            currency: false,
          ));
          valueNotifier.updateUrl(selectedList.url);
          valueNotifier.updateDate(selectedList.date!);
          valueNotifier.updatePeriod(selectedList.period.periodToString(l10n));
          valueNotifier.updateAltColor(selectedList.altHexColorCode);
          await valueNotifier.generateFavicon(selectedList.url);
        });
        return;
      },
      const [],
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
                funcRight: () {
                  listNotifier.updateSub(context,
                      item: listState.subsList[index]);
                  Navigator.of(context).pop();
                }),
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const SubInfo(),
                    RoundededButton(
                      text: l10n.delete_sub,
                      fontColor: const Color.fromARGB(255, 235, 35, 35),
                      topPad: 30,
                      isDisabled: false,
                      onTap: () async {
                        await showDialog(
                          barrierColor: Colors.black26,
                          context: context,
                          builder: (_) {
                            return CustomAlertDialog(
                              title: "Confirmation",
                              description:
                                  "Do you sure want to delete this subscription?",
                              isOkOnly: false,
                              func: () {
                                listNotifier.deleteSub(
                                    item: listState.subsList[index]);

                                Future.microtask(() {
                                  Navigator.pop(context);
                                });
                              },
                              optionLabel: "Delete",
                              mainColor: Colors.red,
                            );
                          },
                        );
                      },
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
