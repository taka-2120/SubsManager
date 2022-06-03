import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/sub_value/sub_value.state.dart';

final subValueProvider = StateNotifierProvider<SubValueNotifier, SubValueState>(
  (ref) => SubValueNotifier(),
);

class SubValueNotifier extends StateNotifier<SubValueState> {
  SubValueNotifier()
      : super(
          SubValueState(
            date: DateTime.now(),
            name: TextEditingController(),
            fee: TextEditingController(),
            url: TextEditingController(),
          ),
        );

  void updatePeriod(String? value) {
    state = state.copyWith(period: value);
  }

  void updateDate(DateTime value) {
    state = state.copyWith(date: value);
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

  void updateFavicon(Image? icon) {
    state = state.copyWith(favicon: icon);
  }

  void initialize() {
    state = state.copyWith(
      period: null,
      date: DateTime.now(),
      name: TextEditingController(),
      fee: TextEditingController(),
      url: TextEditingController(),
    );
  }
}
