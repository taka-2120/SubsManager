import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/domain/subs_list/models/sub_item.dart';
import 'package:subsmanager/extensions/fee_double_str.dart';
import 'package:subsmanager/extensions/hex_color.dart';
import 'package:subsmanager/l10n/l10n.dart';
import 'package:subsmanager/use_case/get_favicon.dart';
import 'package:subsmanager/use_case/sub_value/state/sub_value.state.dart';
import 'package:subsmanager/extensions/period_int_str.dart';

final subValueNotifierProvider =
    StateNotifierProvider<SubValueNotifier, SubValue>(
  (ref) => SubValueNotifier(),
);

class SubValueNotifier extends StateNotifier<SubValue> {
  SubValueNotifier()
      : super(
          SubValue(
            name: TextEditingController(),
            fee: TextEditingController(),
            url: TextEditingController(),
            favicon: null,
            hasIcon: false,
            altColor: Colors.primaries[Random().nextInt(
              Colors.primaries.length,
            )],
            date: DateTime.now(),
            period: null,
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

  void updateFavicon(Image favicon) {
    state = state.copyWith(favicon: favicon);
  }

  void updateAltColor(String value) {
    state = state.copyWith(altColor: HexColor(value));
  }

  Future<void> generateFavicon(String url) async {
    await getFavicon(url: url).then((value) {
      state = state.copyWith(
        favicon: value[0],
        hasIcon: value[1],
      );
    });
  }

  Future<void> setValues(BuildContext context, SubItem item) async {
    final l10n = L10n.of(context)!;

    state.name.text = item.name;
    state.fee.text = item.fee.feeToString(currency: false);
    state.url.text = item.url;

    state = state.copyWith(
      date: item.date!,
      period: item.period.periodToString(l10n),
      altColor: HexColor(item.altHexColorCode),
    );

    await generateFavicon(item.url);
  }

  void init() {
    state = state.copyWith(
      name: TextEditingController(),
      fee: TextEditingController(),
      url: TextEditingController(),
      favicon: null,
      hasIcon: false,
      altColor: Colors.primaries[Random().nextInt(
        Colors.primaries.length,
      )],
      date: DateTime.now(),
      period: null,
    );
  }
}
