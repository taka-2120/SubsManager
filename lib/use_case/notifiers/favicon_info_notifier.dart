import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/domain/models/favicon_info/favicon_info.state.dart';

final favicnoInfoNotifierProvider =
    StateNotifierProvider<FaviconInfoNotifier, FaviconInfo>(
        (ref) => FaviconInfoNotifier());

class FaviconInfoNotifier extends StateNotifier<FaviconInfo> {
  FaviconInfoNotifier() : super(const FaviconInfo());

  void updateFaviconInfo({required Image? favicon, required bool hasIcon}) {
    state = state.copyWith(favicon: favicon, hasIcon: hasIcon);
  }
}
