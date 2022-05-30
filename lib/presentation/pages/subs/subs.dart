import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../hooks/pages.dart';
import '../../widgets/page_title.dart';
import '../../widgets/subs_item.dart';
import 'subs_add.dart';
import '../../../models.dart';
import '../../../theme.dart';
import 'subs_list.dart';

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
            pageTitle(context, subs, false, true, () => sort(),
                const Icon(Icons.swap_vert_rounded)),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Container(
                height: 95,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 20, 179, 173)
                          .withOpacity(0.4),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  gradient: const LinearGradient(
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                    colors: [
                      Color.fromARGB(255, 28, 216, 209),
                      Color(0xff93edc7),
                    ],
                    stops: [0.0, 1.0],
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
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        Text(
                          func.feeToString(
                              context, func.subSum(true, subsList), true),
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Annually",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        Text(
                          func.feeToString(
                              context, func.subSum(false, subsList), true),
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
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
                  return subsItem(
                    context,
                    index,
                    subsList[index],
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
          size: 25,
        ),
      ),
    );
  }
}
