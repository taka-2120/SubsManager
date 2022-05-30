import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../models.dart';
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

class SubAddSheet extends ConsumerWidget {
  SubAddSheet({Key? key}) : super(key: key);
  Functions func = Functions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subValue = ref.watch(subValueProvider);
    final readSubValue = ref.read(subValueProvider.notifier);

    return Scaffold(
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
              () => func.addSub(
                context,
                ref,
                subValue.name.text,
                func.feeToDouble(subValue.fee.text),
                func.periodToInt(subValue.period),
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
                      subValue.name,
                      subValue.fee,
                      subValue.url,
                      subValue.date,
                      subValue.period,
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
