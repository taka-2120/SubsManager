import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../models/favicon_value/favicon_value.state.dart';

final faviconValueProvider =
    StateNotifierProvider<FaviconValue, FaviconValueState>(
        (ref) => FaviconValue());

class FaviconValue extends StateNotifier<FaviconValueState> {
  FaviconValue() : super(FaviconValueState());

  Future<void> update(String value) async {
    String formattedUrl = value;
    bool isVaild = false;
    Color color = Colors.grey;

    switch (formattedUrl.contains("http://")) {
      case false:
        formattedUrl = "http://$formattedUrl";
        break;
    }

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

    switch (isVaild) {
      case true:
        formattedUrl += "/favicon.ico";
        break;
      case false:
        formattedUrl = "";
        break;
    }

    state = state.copyWith(isVaild: isVaild, url: formattedUrl);
  }
}
