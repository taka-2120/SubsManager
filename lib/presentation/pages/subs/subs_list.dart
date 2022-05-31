import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../dialogs/alert.dart';

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

  void add(BuildContext context, WidgetRef ref, String name, double fee,
      int period, DateTime date, Uri url) {
    if (name == "" || fee == -99.9 || period == 99) {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        builder: (context) {
          return const CustomAlertDialog(
            title: "Error",
            description: "Please fill name, fee, and period correctly.",
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

  double subSum(bool monthly, List<Subs> list) {
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
