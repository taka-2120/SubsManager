// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'welcome_settings.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WelcomeSettingsState {
  bool get isNotifEnabled => throw _privateConstructorUsedError;
  bool get isAgreed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WelcomeSettingsStateCopyWith<WelcomeSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WelcomeSettingsStateCopyWith<$Res> {
  factory $WelcomeSettingsStateCopyWith(WelcomeSettingsState value,
          $Res Function(WelcomeSettingsState) then) =
      _$WelcomeSettingsStateCopyWithImpl<$Res>;
  $Res call({bool isNotifEnabled, bool isAgreed});
}

/// @nodoc
class _$WelcomeSettingsStateCopyWithImpl<$Res>
    implements $WelcomeSettingsStateCopyWith<$Res> {
  _$WelcomeSettingsStateCopyWithImpl(this._value, this._then);

  final WelcomeSettingsState _value;
  // ignore: unused_field
  final $Res Function(WelcomeSettingsState) _then;

  @override
  $Res call({
    Object? isNotifEnabled = freezed,
    Object? isAgreed = freezed,
  }) {
    return _then(_value.copyWith(
      isNotifEnabled: isNotifEnabled == freezed
          ? _value.isNotifEnabled
          : isNotifEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isAgreed: isAgreed == freezed
          ? _value.isAgreed
          : isAgreed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_WelcomeSettingsStateCopyWith<$Res>
    implements $WelcomeSettingsStateCopyWith<$Res> {
  factory _$$_WelcomeSettingsStateCopyWith(_$_WelcomeSettingsState value,
          $Res Function(_$_WelcomeSettingsState) then) =
      __$$_WelcomeSettingsStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isNotifEnabled, bool isAgreed});
}

/// @nodoc
class __$$_WelcomeSettingsStateCopyWithImpl<$Res>
    extends _$WelcomeSettingsStateCopyWithImpl<$Res>
    implements _$$_WelcomeSettingsStateCopyWith<$Res> {
  __$$_WelcomeSettingsStateCopyWithImpl(_$_WelcomeSettingsState _value,
      $Res Function(_$_WelcomeSettingsState) _then)
      : super(_value, (v) => _then(v as _$_WelcomeSettingsState));

  @override
  _$_WelcomeSettingsState get _value => super._value as _$_WelcomeSettingsState;

  @override
  $Res call({
    Object? isNotifEnabled = freezed,
    Object? isAgreed = freezed,
  }) {
    return _then(_$_WelcomeSettingsState(
      isNotifEnabled: isNotifEnabled == freezed
          ? _value.isNotifEnabled
          : isNotifEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isAgreed: isAgreed == freezed
          ? _value.isAgreed
          : isAgreed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_WelcomeSettingsState implements _WelcomeSettingsState {
  _$_WelcomeSettingsState({this.isNotifEnabled = false, this.isAgreed = false});

  @override
  @JsonKey()
  final bool isNotifEnabled;
  @override
  @JsonKey()
  final bool isAgreed;

  @override
  String toString() {
    return 'WelcomeSettingsState(isNotifEnabled: $isNotifEnabled, isAgreed: $isAgreed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WelcomeSettingsState &&
            const DeepCollectionEquality()
                .equals(other.isNotifEnabled, isNotifEnabled) &&
            const DeepCollectionEquality().equals(other.isAgreed, isAgreed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isNotifEnabled),
      const DeepCollectionEquality().hash(isAgreed));

  @JsonKey(ignore: true)
  @override
  _$$_WelcomeSettingsStateCopyWith<_$_WelcomeSettingsState> get copyWith =>
      __$$_WelcomeSettingsStateCopyWithImpl<_$_WelcomeSettingsState>(
          this, _$identity);
}

abstract class _WelcomeSettingsState implements WelcomeSettingsState {
  factory _WelcomeSettingsState(
      {final bool isNotifEnabled,
      final bool isAgreed}) = _$_WelcomeSettingsState;

  @override
  bool get isNotifEnabled => throw _privateConstructorUsedError;
  @override
  bool get isAgreed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WelcomeSettingsStateCopyWith<_$_WelcomeSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}
