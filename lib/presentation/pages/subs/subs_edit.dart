import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/models/value_convert.dart';
import 'package:subsmanager/presentation/notifiers/sub_value.dart';

import '../../widgets/sheet_header.dart';
import '../../../theme.dart';
import '../../widgets/sub_info.dart';
import 'subs_list.dart';

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
  SubEditSheet(this.index, this.selectedItem, {Key? key}) : super(key: key);

  final int index;
  final Subs selectedItem;

  final Convert conv = Convert();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subValue = ref.watch(subValueProvider);
    final readSubValue = ref.read(subValueProvider.notifier);
    final readSubList = ref.read(subsListProvider.notifier);

    useEffect(
      () {
        Future.microtask(() {
          readSubValue.updateName(
            selectedItem.name,
          );
          readSubValue.updateFee(
            conv.feeToString(context, selectedItem.fee, false),
          );
          readSubValue.updateUrl(
            selectedItem.url.toString(),
          );
          readSubValue.updatePeriod(
            conv.periodToString(
              selectedItem.period,
            ),
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
              "Edit",
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
                      ref,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                        color: entryBackground,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Delete Subscription",
                            style: TextStyle(
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
