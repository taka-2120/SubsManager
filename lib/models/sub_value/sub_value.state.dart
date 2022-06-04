import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_value.state.freezed.dart';

@freezed
class SubValueState with _$SubValueState {
  factory SubValueState({
    @Default(null) String? period,
    @DateTimeDefault() required DateTime date,
    @TextFieldDefault() required TextEditingController name,
    @TextFieldDefault() required TextEditingController fee,
    @TextFieldDefault() required TextEditingController url,
    @Default(null) Image? favicon,
    @Default(false) bool isIcon,
    @AltColorDefault() required Color altColor,
  }) = _SubValueState;
}

class DateTimeDefault implements Default {
  const DateTimeDefault();

  @override
  DateTime get defaultValue => DateTime.now();
}

class TextFieldDefault implements Default {
  const TextFieldDefault();

  @override
  TextEditingController get defaultValue => TextEditingController();
}

class AltColorDefault implements Default {
  const AltColorDefault();

  @override
  Color get defaultValue => Colors.primaries[Random().nextInt(
        Colors.primaries.length,
      )];
}
