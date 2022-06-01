import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/l10n/l10n.dart';

import '../dialogs/alert.dart';

final subsListProvider =
    StateNotifierProvider<SubsList, List<Subs>>((ref) => SubsList());

@immutable
class Subs {
  const Subs({
    required this.name,
    required this.fee,
    required this.period,
    required this.date,
    required this.url,
  });

  final String name;
  final double fee;
  final int period; //0: Monthly, 1: Semi-Annually, 2: Annually
  final DateTime date;
  final Uri url;
}

class SubsList extends StateNotifier<List<Subs>> {
  SubsList([List<Subs>? initial]) : super(initial ?? []);

  void add(
    BuildContext context,
    L10n l10n,
    WidgetRef ref, {
    required String name,
    required double fee,
    required int period,
    required DateTime date,
    required Uri url,
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
      final item =
          Subs(name: name, fee: fee, period: period, date: date, url: url);
      state = [...state, item];
      Navigator.pop(context);
    }
  }

  void removeAt(int index) {
    state = [
      for (var i = 0; i < state.length; i++)
        if (i != index) state[i],
    ];
  }

  void update() {}

  void sort() {}

  double subSum({
    required bool monthly,
    required List<Subs> list,
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
