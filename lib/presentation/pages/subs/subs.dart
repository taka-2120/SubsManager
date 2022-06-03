import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:subsmanager/extensions/fee_double_str.dart';
import 'package:subsmanager/presentation/notifiers/sort_option.dart';
import 'package:subsmanager/presentation/notifiers/sub_value.dart';
import 'package:subsmanager/l10n/l10n.dart';

import '../../../globals.dart';
import '../../notifiers/favicon_value.dart';
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          pageTitle(
            context,
            title: l10n.subscriptions,
            back: false,
            rightButton: true,
            rightFunc: () => showSortOptions(context, ref),
            rightIcon: const Icon(Icons.swap_vert_rounded),
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
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        onPressed: () {
          ref.read(subValueProvider.notifier).initialize();
          ref.read(faviconValueProvider.notifier).initialize();
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

  showSortOptions(BuildContext context, WidgetRef ref) async {
    final screenSize = MediaQuery.of(context).size;
    final l10n = L10n.of(context)!;
    final sortOption = ref.read(sortOptionProvider.notifier);
    final Offset offset = Offset(screenSize.width - 10, 95);
    double left = offset.dx;
    double top = offset.dy;
    double right = screenSize.width - offset.dx;
    double bottom = screenSize.height - offset.dy;

    await showMenu<SortOptions>(
      context: context,
      position: RelativeRect.fromLTRB(left, top, right, bottom),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      items: SortOptions.values
          .map(
            (SortOptions menuItemType) => PopupMenuItem<SortOptions>(
              value: menuItemType,
              child: Text(
                getSortOptionsString(l10n, menuItemType),
              ),
            ),
          )
          .toList(),
    ).then(
      (item) {
        sortOption.update(ref, item?.index ?? 0);
      },
    );
  }
}
