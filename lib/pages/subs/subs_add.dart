import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../globals.dart';
import '../../common_widgets.dart' as common;
import '../../models.dart';
import 'subs_widgets.dart';

class SubAdd extends StatelessWidget {
  const SubAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SubAddSheet();
  }
}

class SubAddSheet extends ConsumerWidget {
  SubAddSheet({Key? key}) : super(key: key);
  Functions func = Functions();

  TextEditingController nameCtl = TextEditingController();
  TextEditingController feeCtl = TextEditingController();
  TextEditingController urlCtl = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subDate = ref.watch(subDateProvider);
    final subPeriod = ref.watch(subPeriodProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            common.sheetHeader(
              "Add",
              context,
              () => Navigator.pop(context),
              () => func.addSub(
                context,
                ref,
                nameCtl.text,
                func.feeToDouble(feeCtl.text),
                func.periodToInt(subPeriod),
                subDate,
                Uri.parse(urlCtl.text),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    subsInfo(context, ref, nameCtl, feeCtl, urlCtl, subDate,
                        subPeriod),
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
