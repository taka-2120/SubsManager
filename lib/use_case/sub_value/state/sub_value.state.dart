import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_value.state.freezed.dart';

@freezed
class SubValue with _$SubValue {
  factory SubValue({
    required TextEditingController name,
    required TextEditingController fee,
    required TextEditingController url,
    required Image? favicon,
    required bool hasIcon,
    required Color altColor,
    required DateTime date,
    @Default(null) String? period,
  }) = _SubValue;
}
