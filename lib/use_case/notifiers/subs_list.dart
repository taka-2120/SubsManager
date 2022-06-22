import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/domain/models/sub_item/sub_item.state.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/presentation/dialogs/alert.dart';
import 'package:subsmanager/use_case/notifiers/sort_option.dart';

final subsListProvider = StateNotifierProvider<SubsList, List<SubItemState>>(
  (ref) => SubsList(),
);

class SubsList extends StateNotifier<List<SubItemState>> {
  SubsList([List<SubItemState>? initial]) : super(initial ?? []);

  void add(
    BuildContext context,
    L10n l10n,
    WidgetRef ref, {
    required String name,
    required double fee,
    required String url,
    required bool isIcon,
    required Image? favicon,
    required Color altColor,
    required DateTime date,
    required int period,
  }) {
    if (name == "" || fee == -99.9 || period == 99) {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        builder: (context) {
          return CustomAlertDialog(
            title: l10n.error,
            description: l10n.e_fill,
            ok: true,
          );
        },
      );
    } else {
      final item = SubItemState(
        name: name,
        fee: fee,
        url: url,
        isIcon: isIcon,
        favicon: favicon,
        altColor: altColor,
        date: date,
        period: period,
      );
      state = [...state, item];
      final sortIndex = ref.watch(sortOptionProvider);
      sort(sortIndex);
      Navigator.pop(context);
    }
  }

  void removeAt(int index) {
    state = [
      for (var i = 0; i < state.length; i++)
        if (i != index) state[i],
    ];
  }

  //ERROR HANDLING IS REQUIRED
  void update(
    BuildContext context, {
    required int index,
    required SubItemState subItem,
  }) {
    state[index] = subItem;

    state = [
      for (var i = 0; i < state.length; i++) i == index ? subItem : state[i],
    ];
    Navigator.pop(context);
  }

  void sort(int index) {
    List<SubItemState> sortedList = [...state];
    switch (index) {
      case 0:
        sortedList.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 1:
        sortedList.sort((a, b) => b.name.compareTo(a.name));
        break;
      case 2:
        sortedList.sort((a, b) => a.date.compareTo(b.date));
        break;
      case 3:
        sortedList.sort((a, b) => b.date.compareTo(a.date));
        break;
      case 4:
        sortedList.sort((a, b) => a.fee.compareTo(b.fee));
        break;
      case 5:
        sortedList.sort((a, b) => b.fee.compareTo(a.fee));
        break;
    }
    state = sortedList;
  }

  double subSum({
    required bool monthly,
    required List<SubItemState> list,
  }) {
    double sum = 0.0;
    if (monthly) {
      for (var i = 0; i < list.length; i++) {
        int period = list[i].period;
        if (period == 0) {
          sum += list[i].fee;
        } else {
          //EXCEPTION
        }
      }
    } else {
      for (var i = 0; i < list.length; i++) {
        int period = list[i].period;
        if (period == 0) {
          sum += list[i].fee * 12;
        } else if (period == 1) {
          sum += list[i].fee * 2;
        } else if (period == 2) {
          sum += list[i].fee;
        } else {
          //EXCEPTION
        }
      }
    }
    return sum;
  }
}
