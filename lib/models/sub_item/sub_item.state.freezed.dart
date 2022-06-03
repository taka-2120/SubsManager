// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sub_item.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SubItemState {
  String get name => throw _privateConstructorUsedError;
  double get fee => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get period => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubItemStateCopyWith<SubItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubItemStateCopyWith<$Res> {
  factory $SubItemStateCopyWith(
          SubItemState value, $Res Function(SubItemState) then) =
      _$SubItemStateCopyWithImpl<$Res>;
  $Res call({String name, double fee, String url, DateTime date, int period});
}

/// @nodoc
class _$SubItemStateCopyWithImpl<$Res> implements $SubItemStateCopyWith<$Res> {
  _$SubItemStateCopyWithImpl(this._value, this._then);

  final SubItemState _value;
  // ignore: unused_field
  final $Res Function(SubItemState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? fee = freezed,
    Object? url = freezed,
    Object? date = freezed,
    Object? period = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_SubItemStateCopyWith<$Res>
    implements $SubItemStateCopyWith<$Res> {
  factory _$$_SubItemStateCopyWith(
          _$_SubItemState value, $Res Function(_$_SubItemState) then) =
      __$$_SubItemStateCopyWithImpl<$Res>;
  @override
  $Res call({String name, double fee, String url, DateTime date, int period});
}

/// @nodoc
class __$$_SubItemStateCopyWithImpl<$Res>
    extends _$SubItemStateCopyWithImpl<$Res>
    implements _$$_SubItemStateCopyWith<$Res> {
  __$$_SubItemStateCopyWithImpl(
      _$_SubItemState _value, $Res Function(_$_SubItemState) _then)
      : super(_value, (v) => _then(v as _$_SubItemState));

  @override
  _$_SubItemState get _value => super._value as _$_SubItemState;

  @override
  $Res call({
    Object? name = freezed,
    Object? fee = freezed,
    Object? url = freezed,
    Object? date = freezed,
    Object? period = freezed,
  }) {
    return _then(_$_SubItemState(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SubItemState with DiagnosticableTreeMixin implements _SubItemState {
  _$_SubItemState(
      {required this.name,
      required this.fee,
      required this.url,
      required this.date,
      required this.period});

  @override
  final String name;
  @override
  final double fee;
  @override
  final String url;
  @override
  final DateTime date;
  @override
  final int period;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SubItemState(name: $name, fee: $fee, url: $url, date: $date, period: $period)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SubItemState'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('fee', fee))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('period', period));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubItemState &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.fee, fee) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.period, period));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(fee),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(period));

  @JsonKey(ignore: true)
  @override
  _$$_SubItemStateCopyWith<_$_SubItemState> get copyWith =>
      __$$_SubItemStateCopyWithImpl<_$_SubItemState>(this, _$identity);
}

abstract class _SubItemState implements SubItemState {
  factory _SubItemState(
      {required final String name,
      required final double fee,
      required final String url,
      required final DateTime date,
      required final int period}) = _$_SubItemState;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  double get fee => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  DateTime get date => throw _privateConstructorUsedError;
  @override
  int get period => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SubItemStateCopyWith<_$_SubItemState> get copyWith =>
      throw _privateConstructorUsedError;
}
