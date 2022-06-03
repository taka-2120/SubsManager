// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favicon_value.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FaviconValueState {
  String get url => throw _privateConstructorUsedError;
  bool get isVaild => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FaviconValueStateCopyWith<FaviconValueState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaviconValueStateCopyWith<$Res> {
  factory $FaviconValueStateCopyWith(
          FaviconValueState value, $Res Function(FaviconValueState) then) =
      _$FaviconValueStateCopyWithImpl<$Res>;
  $Res call({String url, bool isVaild});
}

/// @nodoc
class _$FaviconValueStateCopyWithImpl<$Res>
    implements $FaviconValueStateCopyWith<$Res> {
  _$FaviconValueStateCopyWithImpl(this._value, this._then);

  final FaviconValueState _value;
  // ignore: unused_field
  final $Res Function(FaviconValueState) _then;

  @override
  $Res call({
    Object? url = freezed,
    Object? isVaild = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      isVaild: isVaild == freezed
          ? _value.isVaild
          : isVaild // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_FaviconValueStateCopyWith<$Res>
    implements $FaviconValueStateCopyWith<$Res> {
  factory _$$_FaviconValueStateCopyWith(_$_FaviconValueState value,
          $Res Function(_$_FaviconValueState) then) =
      __$$_FaviconValueStateCopyWithImpl<$Res>;
  @override
  $Res call({String url, bool isVaild});
}

/// @nodoc
class __$$_FaviconValueStateCopyWithImpl<$Res>
    extends _$FaviconValueStateCopyWithImpl<$Res>
    implements _$$_FaviconValueStateCopyWith<$Res> {
  __$$_FaviconValueStateCopyWithImpl(
      _$_FaviconValueState _value, $Res Function(_$_FaviconValueState) _then)
      : super(_value, (v) => _then(v as _$_FaviconValueState));

  @override
  _$_FaviconValueState get _value => super._value as _$_FaviconValueState;

  @override
  $Res call({
    Object? url = freezed,
    Object? isVaild = freezed,
  }) {
    return _then(_$_FaviconValueState(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      isVaild: isVaild == freezed
          ? _value.isVaild
          : isVaild // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FaviconValueState implements _FaviconValueState {
  _$_FaviconValueState({this.url = "", this.isVaild = false});

  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey()
  final bool isVaild;

  @override
  String toString() {
    return 'FaviconValueState(url: $url, isVaild: $isVaild)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FaviconValueState &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.isVaild, isVaild));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(isVaild));

  @JsonKey(ignore: true)
  @override
  _$$_FaviconValueStateCopyWith<_$_FaviconValueState> get copyWith =>
      __$$_FaviconValueStateCopyWithImpl<_$_FaviconValueState>(
          this, _$identity);
}

abstract class _FaviconValueState implements FaviconValueState {
  factory _FaviconValueState({final String url, final bool isVaild}) =
      _$_FaviconValueState;

  @override
  String get url => throw _privateConstructorUsedError;
  @override
  bool get isVaild => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FaviconValueStateCopyWith<_$_FaviconValueState> get copyWith =>
      throw _privateConstructorUsedError;
}
