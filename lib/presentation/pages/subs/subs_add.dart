import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/presentation/pages/subs/subs_list.dart';

import '../../../models/value_convert.dart';
import '../../notifiers/sub_value.dart';
import '../../widgets/sheet_header.dart';
import '../../widgets/sub_info.dart';

class SubAdd extends StatelessWidget {
  const SubAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SubAddSheet();
  }
}

// ignore: must_be_immutable
class SubAddSheet extends ConsumerWidget {
  SubAddSheet({Key? key}) : super(key: key);
  Convert conv = Convert();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subValue = ref.watch(subValueProvider.select((value) => value));
    final readSubList = ref.read(subsListProvider.notifier);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sheetHeader(
              "Add",
              context,
              () => Navigator.pop(context),
              () => readSubList.add(
                context,
                ref,
                subValue.name.text,
                conv.feeToDouble(subValue.fee.text),
                conv.periodToInt(subValue.period),
                subValue.date,
                Uri.parse(subValue.url.text),
              ),
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
