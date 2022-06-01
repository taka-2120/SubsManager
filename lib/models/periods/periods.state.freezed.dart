// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'periods.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PeriodsState {
  List<String> get periods => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PeriodsStateCopyWith<PeriodsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeriodsStateCopyWith<$Res> {
  factory $PeriodsStateCopyWith(
          PeriodsState value, $Res Function(PeriodsState) then) =
      _$PeriodsStateCopyWithImpl<$Res>;
  $Res call({List<String> periods});
}

/// @nodoc
class _$PeriodsStateCopyWithImpl<$Res> implements $PeriodsStateCopyWith<$Res> {
  _$PeriodsStateCopyWithImpl(this._value, this._then);

  final PeriodsState _value;
  // ignore: unused_field
  final $Res Function(PeriodsState) _then;

  @override
  $Res call({
    Object? periods = freezed,
  }) {
    return _then(_value.copyWith(
      periods: periods == freezed
          ? _value.periods
          : periods // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_PeriodsStateCopyWith<$Res>
    implements $PeriodsStateCopyWith<$Res> {
  factory _$$_PeriodsStateCopyWith(
          _$_PeriodsState value, $Res Function(_$_PeriodsState) then) =
      __$$_PeriodsStateCopyWithImpl<$Res>;
  @override
  $Res call({List<String> periods});
}

/// @nodoc
class __$$_PeriodsStateCopyWithImpl<$Res>
    extends _$PeriodsStateCopyWithImpl<$Res>
    implements _$$_PeriodsStateCopyWith<$Res> {
  __$$_PeriodsStateCopyWithImpl(
      _$_PeriodsState _value, $Res Function(_$_PeriodsState) _then)
      : super(_value, (v) => _then(v as _$_PeriodsState));

  @override
  _$_PeriodsState get _value => super._value as _$_PeriodsState;

  @override
  $Res call({
    Object? periods = freezed,
  }) {
    return _then(_$_PeriodsState(
      periods: periods == freezed
          ? _value._periods
          : periods // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_PeriodsState implements _PeriodsState {
  const _$_PeriodsState({final List<String> periods = defaultPeriods})
      : _periods = periods;

  final List<String> _periods;
  @override
  @JsonKey()
  List<String> get periods {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_periods);
  }

  @override
  String toString() {
    return 'PeriodsState(periods: $periods)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeriodsState &&
            const DeepCollectionEquality().equals(other._periods, _periods));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_periods));

  @JsonKey(ignore: true)
  @override
  _$$_PeriodsStateCopyWith<_$_PeriodsState> get copyWith =>
      __$$_PeriodsStateCopyWithImpl<_$_PeriodsState>(this, _$identity);
}

abstract class _PeriodsState implements PeriodsState {
  const factory _PeriodsState({final List<String> periods}) = _$_PeriodsState;

  @override
  List<String> get periods => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PeriodsStateCopyWith<_$_PeriodsState> get copyWith =>
      throw _privateConstructorUsedError;
}
