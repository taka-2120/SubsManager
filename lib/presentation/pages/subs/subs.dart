import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:subsmanager/extensions/fee_double_str.dart';
import 'package:subsmanager/presentation/notifiers/sub_value.dart';
import 'package:subsmanager/l10n/l10n.dart';

import '../../widgets/page_title.dart';
import '../../widgets/subs_item.dart';
import 'subs_add.dart';
import '../../../theme.dart';
import '../../notifiers/subs_list.dart';

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
    final readSubsList = ref.read(subsListProvider.notifier);
    final l10n = L10n.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            pageTitle(
              context,
              l10n.subscriptions,
              false,
              true,
              () => readSubsList.sort(),
              const Icon(Icons.swap_vert_rounded),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 10,
              ),
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
                        Text(
                          l10n.monthly_total,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          readSubsList
                              .subSum(monthly: true, list: subsList)
                              .feeToString(format: true),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l10n.annually_total,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          readSubsList
                              .subSum(monthly: false, list: subsList)
                              .feeToString(format: true),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
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
                    ref,
                    l10n,
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
          ref.read(subValueProvider.notifier).initialize();
          showBarModalBottomSheet(
            context: context,
            builder: (context) => const SubAdd(),
            bounce: true,
            expand: true,
          );
        },
        foregroundColor: customSwatch,
        tooltip: l10n.add,
        child: const Icon(
          Icons.add,
          size: 25,
        ),
      ),
    );
  }
}
