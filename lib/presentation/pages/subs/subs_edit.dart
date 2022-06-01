import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/extensions/fee_double_str.dart';
import 'package:subsmanager/extensions/period_int_str.dart';
import 'package:subsmanager/presentation/notifiers/sub_value.dart';
import 'package:subsmanager/l10n/l10n.dart';

import '../../widgets/sheet_header.dart';
import '../../../theme.dart';
import '../../widgets/sub_info.dart';
import '../../notifiers/subs_list.dart';

class SubEdit extends StatelessWidget {
  const SubEdit(this.index, this.selectedItem, {Key? key}) : super(key: key);
  final int index;
  final Subs selectedItem;

  @override
  Widget build(BuildContext context) {
    return SubEditSheet(index, selectedItem);
  }
}

class SubEditSheet extends HookConsumerWidget {
  const SubEditSheet(this.index, this.selectedItem, {Key? key})
      : super(key: key);

  final int index;
  final Subs selectedItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readSubValue = ref.read(subValueProvider.notifier);
    final readSubList = ref.read(subsListProvider.notifier);
    final l10n = L10n.of(context)!;

    useEffect(
      () {
        Future.microtask(() {
          readSubValue.updateName(
            selectedItem.name,
          );
          readSubValue.updateFee(
            selectedItem.fee.feeToString(format: false),
          );
          readSubValue.updateUrl(
            selectedItem.url.toString(),
          );
          readSubValue.updatePeriod(
            selectedItem.period.periodToString(ref),
          );
          readSubValue.updateDate(selectedItem.date);
        });
        return;
      },
      [],
    );

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sheetHeader(
              l10n.edit,
              context,
              () => Navigator.pop(context),
              () => readSubList.update(),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    subsInfo(
                      context,
                      l10n,
                      ref,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                        color: entryBackground,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            l10n.delete_sub,
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onTap: () {
                          readSubList.removeAt(index);
                          Navigator.pop(context);
                        },
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
