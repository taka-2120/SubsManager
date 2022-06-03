import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favicon_value.state.freezed.dart';

@freezed
class FaviconValueState with _$FaviconValueState {
  factory FaviconValueState({
    @Default(null) Image? favicon,
    @Default(false) bool isIcon,
    @AltColorDefault() Color? altColor,
  }) = _FaviconValueState;
}

class AltColorDefault implements Default {
  const AltColorDefault();

  @override
  Color get defaultValue => Colors.primaries[Random().nextInt(
        Colors.primaries.length,
      )];
}
