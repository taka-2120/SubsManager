import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_item.state.freezed.dart';

@freezed
class SubItemState with _$SubItemState {
  factory SubItemState({
    required String name,
    required double fee,
    required String url,
    required bool isIcon,
    required Image? favicon,
    required Color altColor,
    required DateTime date,
    required int period,
  }) = _SubItemState;
}
