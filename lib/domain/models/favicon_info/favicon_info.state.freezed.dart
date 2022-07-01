// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favicon_info.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FaviconInfo {
  Image? get favicon => throw _privateConstructorUsedError;
  bool get hasIcon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FaviconInfoCopyWith<FaviconInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaviconInfoCopyWith<$Res> {
  factory $FaviconInfoCopyWith(
          FaviconInfo value, $Res Function(FaviconInfo) then) =
      _$FaviconInfoCopyWithImpl<$Res>;
  $Res call({Image? favicon, bool hasIcon});
}

/// @nodoc
class _$FaviconInfoCopyWithImpl<$Res> implements $FaviconInfoCopyWith<$Res> {
  _$FaviconInfoCopyWithImpl(this._value, this._then);

  final FaviconInfo _value;
  // ignore: unused_field
  final $Res Function(FaviconInfo) _then;

  @override
  $Res call({
    Object? favicon = freezed,
    Object? hasIcon = freezed,
  }) {
    return _then(_value.copyWith(
      favicon: favicon == freezed
          ? _value.favicon
          : favicon // ignore: cast_nullable_to_non_nullable
              as Image?,
      hasIcon: hasIcon == freezed
          ? _value.hasIcon
          : hasIcon // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_FaviconInfoCopyWith<$Res>
    implements $FaviconInfoCopyWith<$Res> {
  factory _$$_FaviconInfoCopyWith(
          _$_FaviconInfo value, $Res Function(_$_FaviconInfo) then) =
      __$$_FaviconInfoCopyWithImpl<$Res>;
  @override
  $Res call({Image? favicon, bool hasIcon});
}

/// @nodoc
class __$$_FaviconInfoCopyWithImpl<$Res> extends _$FaviconInfoCopyWithImpl<$Res>
    implements _$$_FaviconInfoCopyWith<$Res> {
  __$$_FaviconInfoCopyWithImpl(
      _$_FaviconInfo _value, $Res Function(_$_FaviconInfo) _then)
      : super(_value, (v) => _then(v as _$_FaviconInfo));

  @override
  _$_FaviconInfo get _value => super._value as _$_FaviconInfo;

  @override
  $Res call({
    Object? favicon = freezed,
    Object? hasIcon = freezed,
  }) {
    return _then(_$_FaviconInfo(
      favicon: favicon == freezed
          ? _value.favicon
          : favicon // ignore: cast_nullable_to_non_nullable
              as Image?,
      hasIcon: hasIcon == freezed
          ? _value.hasIcon
          : hasIcon // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FaviconInfo implements _FaviconInfo {
  const _$_FaviconInfo({this.favicon = null, this.hasIcon = false});

  @override
  @JsonKey()
  final Image? favicon;
  @override
  @JsonKey()
  final bool hasIcon;

  @override
  String toString() {
    return 'FaviconInfo(favicon: $favicon, hasIcon: $hasIcon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FaviconInfo &&
            const DeepCollectionEquality().equals(other.favicon, favicon) &&
            const DeepCollectionEquality().equals(other.hasIcon, hasIcon));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(favicon),
      const DeepCollectionEquality().hash(hasIcon));

  @JsonKey(ignore: true)
  @override
  _$$_FaviconInfoCopyWith<_$_FaviconInfo> get copyWith =>
      __$$_FaviconInfoCopyWithImpl<_$_FaviconInfo>(this, _$identity);
}

abstract class _FaviconInfo implements FaviconInfo {
  const factory _FaviconInfo({final Image? favicon, final bool hasIcon}) =
      _$_FaviconInfo;

  @override
  Image? get favicon => throw _privateConstructorUsedError;
  @override
  bool get hasIcon => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FaviconInfoCopyWith<_$_FaviconInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
