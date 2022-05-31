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
