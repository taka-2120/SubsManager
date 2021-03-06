import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:subsmanager/extensions/fee_double_str.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/pages/subs/subs_add.dart';
import 'package:subsmanager/presentation/widgets/headers/page_title_widget.dart';
import 'package:subsmanager/presentation/widgets/loading_overlay_widget.dart';
import 'package:subsmanager/presentation/widgets/sort_options_widget.dart';
import 'package:subsmanager/presentation/widgets/list_items/subs_item_widget.dart';
import 'package:subsmanager/theme.dart';
import 'package:subsmanager/use_case/subs_list/notifier/subs_list_notifier.dart';

class SubsPage extends HookConsumerWidget {
  const SubsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final listNotifier = ref.read(subsListNotifierProvider.notifier);
    final listState = ref.watch(subsListNotifierProvider);
    final l10n = L10n.of(context)!;

    useEffect(
      () {
        isLoading.value = true;
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await listNotifier.getSubsList();
          await listNotifier.updateDate();
          isLoading.value = false;
        });
        return;
      },
      const [],
    );

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              PageTitle(
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
                            listNotifier
                                .subSum(monthly: true, list: listState.subsList)
                                .feeToString(currency: true),
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
                            listNotifier
                                .subSum(
                                    monthly: false, list: listState.subsList)
                                .feeToString(currency: true),
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
                child: (listState.subsList.isEmpty)
                    ? Center(
                        child: Text(l10n.first_add),
                      )
                    : ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return SubsItem(
                              index: index, item: listState.subsList[index]);
                        },
                        itemCount: listState.subsList.length,
                      ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 4,
            onPressed: () => showBarModalBottomSheet(
              context: context,
              builder: (context) => const SubAddSheet(),
              bounce: true,
              expand: true,
            ),
            foregroundColor: customSwatch,
            tooltip: l10n.add,
            child: const Icon(
              Icons.add,
              size: 25,
            ),
          ),
        ),
        if (isLoading.value) const LoadingOverlay()
      ],
    );
  }
}
