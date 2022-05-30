import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

  void add(Subs item) {
    state = [...state, item];
  }

  void removeAt(int index) {
    state = [
      for (var i = 0; i < state.length; i++)
        if (i != index) state[i],
    ];
  }

  void update(int index, Subs item) {}
}
