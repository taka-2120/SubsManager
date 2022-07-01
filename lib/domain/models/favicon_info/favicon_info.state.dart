import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favicon_info.state.freezed.dart';

@freezed
class FaviconInfo with _$FaviconInfo {
  const factory FaviconInfo({
    @Default(null) Image? favicon,
    @Default(false) bool hasIcon,
  }) = _FaviconInfo;
}
