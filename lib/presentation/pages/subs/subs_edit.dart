import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/domain/models/sub_item/sub_item.state.dart';
import 'package:subsmanager/extensions/fee_double_str.dart';
import 'package:subsmanager/extensions/fee_str_double.dart';
import 'package:subsmanager/extensions/period_int_str.dart';
import 'package:subsmanager/extensions/period_nstr_int.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/widgets/rounded_button.dart';
import 'package:subsmanager/presentation/widgets/sheet_header.dart';
import 'package:subsmanager/presentation/widgets/sub_info.dart';
import 'package:subsmanager/use_case/notifiers/sub_value.dart';
import 'package:subsmanager/use_case/notifiers/subs_list.dart';

class SubEdit extends StatelessWidget {
  const SubEdit(this.index, this.selectedItem, {Key? key}) : super(key: key);
  final int index;
  final SubItemState selectedItem;

  @override
  Widget build(BuildContext context) {
    return SubEditSheet(index, selectedItem);
  }
}

class SubEditSheet extends HookConsumerWidget {
  const SubEditSheet(this.index, this.selectedItem, {Key? key})
      : super(key: key);

  final int index;
  final SubItemState selectedItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subValue = ref.watch(subValueProvider);
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
          readSubValue.updateDate(selectedItem.date);
          readSubValue.updatePeriod(
            selectedItem.period.periodToString(ref),
          );
          readSubValue.updateFavicon(selectedItem.favicon!);
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
            SheetHeader(
              title: l10n.edit,
              funcLeft: () => Navigator.pop(context),
              funcRight: () => readSubList.update(
                context,
                index: index,
                subItem: SubItemState(
                  name: subValue.name.text,
                  fee: subValue.fee.text.feeToDouble(),
                  url: subValue.url.text,
                  isIcon: subValue.isIcon,
                  favicon: subValue.favicon,
                  altColor: subValue.altColor,
                  date: subValue.date,
                  period: subValue.period.periodToInt(ref),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const SubInfo(),
                    RoundededButton(
                      text: l10n.delete_sub,
                      fontColor: Colors.redAccent,
                      topPad: 30,
                      isDisabled: false,
                      onTap: () {
                        readSubList.removeAt(index);
                        Navigator.pop(context);
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
