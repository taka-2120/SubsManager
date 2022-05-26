import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '/pages/subs/subs_add.dart';
import '../../globals.dart';
import '../../model.dart';
import '../../globals.dart' as globals;
import '../../functions.dart';

class SubsMain extends StatelessWidget {
  const SubsMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SubsPage();
  }
}

class SubsPage extends ConsumerWidget {
  const SubsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subsList = ref.watch(subsListProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            pageTitle(context, globals.subs, false),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return _subsItem(subsList[index].name, subsList[index].fee,
                      subsList[index].period, subsList[index].date, context);
                },
                itemCount: subsList.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBarModalBottomSheet(
            context: context,
            builder: (context) => const SubAdd(),
            bounce: true,
            expand: true,
          );
        },
        foregroundColor: globals.customSwatch,
        backgroundColor: Colors.white,
        tooltip: 'Add a Subscription',
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}

Widget _subsItem(
    String name, double fee, int period, DateTime date, BuildContext context) {
  Functions func = Functions();

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
    padding: const EdgeInsets.all(18),
    height: 130,
    decoration: BoxDecoration(
        border: Border.all(color: globals.borderColor, width: 1),
        borderRadius: BorderRadius.circular(15)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              func.feeAndPeriod(context, fee, period),
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Next: ${func.dateToString(date, context)}",
              style: const TextStyle(
                  color: globals.borderColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
          ],
        ),
      ],
    ),
  );
}
