import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final subValueProvider = StateNotifierProvider<SubValueNotifier, SubValue>(
  (ref) => SubValueNotifier(
    SubValue(
      period: null,
      date: DateTime.now(),
      name: TextEditingController(),
      fee: TextEditingController(),
      url: TextEditingController(),
    ),
  ),
);

class SubValue {
  SubValue({
    required this.period,
    required this.date,
    required this.name,
    required this.fee,
    required this.url,
  });

  String? period;
  DateTime date;
  TextEditingController name;
  TextEditingController fee;
  TextEditingController url;
}

class SubValueNotifier extends StateNotifier<SubValue> {
  SubValueNotifier(initial)
      : super(
          initial ??
              SubValue(
                period: null,
                date: DateTime.now(),
                name: TextEditingController(),
                fee: TextEditingController(),
                url: TextEditingController(),
              ),
        );

  void updatePeriod(String? value) {
    state.period = value!;
  }

  void updateDate(DateTime value) {
    state.date = value;
  }

  void updateName(String value) {
    state.name.text = value;
  }

  void updateFee(String value) {
    state.fee.text = value;
  }

  void updateUrl(String value) {
    state.url.text = value;
  }
}
