import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:subsmanager/domain/models/sub_value/sub_value.state.dart';

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
            altColor: Colors.primaries[Random().nextInt(
              Colors.primaries.length,
            )],
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

  Future<void> generateFavicon(String url) async {
    String formattedUrl = url;
    bool isVaild = false;
    formattedUrl.contains("http://")
        ? null
        : formattedUrl = "http://$formattedUrl";

    try {
      isVaild = Uri.parse(formattedUrl).host.isNotEmpty;

      final response = await http.head(Uri.parse(formattedUrl));
      switch (response.statusCode) {
        case 200:
          isVaild = true;
          break;
        default:
          isVaild = false;
          break;
      }
    } catch (e) {
      isVaild = false;
    }

    isVaild ? formattedUrl += "/favicon.ico" : formattedUrl = "";

    state = state.copyWith(
      favicon: Image.network(formattedUrl),
      isIcon: isVaild,
    );
  }

  void init() {
    state = state.copyWith(
      period: null,
      date: DateTime.now(),
      name: TextEditingController(),
      fee: TextEditingController(),
      url: TextEditingController(),
      favicon: null,
      isIcon: false,
      altColor: Colors.primaries[Random().nextInt(
        Colors.primaries.length,
      )],
    );
  }
}
