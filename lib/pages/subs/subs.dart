import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '/pages/subs/subs_add.dart';
import '../../globals.dart';
import '../../model.dart';
import '../../globals.dart' as globals;
import '../../functions.dart';
import '../../theme.dart';

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
    Functions func = Functions();

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            pageTitle(context, globals.subs, false),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Container(
                height: 95,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 22, 174, 169)
                          .withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                    colors: [
                      const Color(0xff1cd8d2).withOpacity(0.6),
                      const Color(0xff93edc7).withOpacity(0.6),
                    ],
                    stops: const [0.0, 1.0],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Monthly",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          func.roundedFeeToString(
                              func.subSum(true, subsList), context),
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Annually",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          func.roundedFeeToString(
                              func.subSum(false, subsList), context),
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return _subsItem(
                    subsList[index].name,
                    subsList[index].fee,
                    subsList[index].period,
                    subsList[index].date,
                    context,
                  );
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
        foregroundColor: customSwatch,
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
      borderRadius: BorderRadius.circular(15),
    ),
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
            GestureDetector(
              onTap: () => print("Show Edit Dialog"),
              child: const CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.more_horiz_rounded),
              ),
            )
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
