import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../models/favicon_value/favicon_value.state.dart';

final faviconValueProvider =
    StateNotifierProvider<FaviconValue, FaviconValueState>(
        (ref) => FaviconValue());

class FaviconValue extends StateNotifier<FaviconValueState> {
  FaviconValue()
      : super(
          FaviconValueState(
            altColor: Colors.primaries[Random().nextInt(
              Colors.primaries.length,
            )],
          ),
        );

  Future<void> update(String url) async {
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

  void initialize() {
    state = state.copyWith(
      favicon: null,
      isIcon: false,
      altColor: Colors.primaries[Random().nextInt(
        Colors.primaries.length,
      )],
    );
  }
}
