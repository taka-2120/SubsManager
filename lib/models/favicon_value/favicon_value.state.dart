import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favicon_value.state.freezed.dart';

@freezed
class FaviconValueState with _$FaviconValueState {
  factory FaviconValueState({
    @Default("") String url,
    @Default(false) bool isVaild,
  }) = _FaviconValueState;
}
