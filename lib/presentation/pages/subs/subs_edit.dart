import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/presentation/notifiers/sub_value.dart';

import '../../widgets/sheet_header.dart';
import '../../../globals.dart';
import '../../../models.dart';
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

  final Functions func = Functions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subValue = ref.watch(subValueProvider);
    final readSubValue = ref.read(subValueProvider.notifier);

    useEffect(() {
      readSubValue.updateName(selectedItem.name);
      readSubValue
          .updateFee(func.feeToString(context, selectedItem.fee, false));
      readSubValue.updateUrl(selectedItem.url.toString());
      return;
    }, const []);

    return Scaffold(
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
              () => func.updateSub(),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    subsInfo(context, ref, subValue.name, subValue.fee,
                        subValue.url, subValue.date, subValue.period),
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
                                  fontWeight: FontWeight.bold),
                            )),
                        onTap: () {
                          ref.read(subsListProvider.notifier).removeAt(index);
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
