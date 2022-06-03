// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sub_value.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SubValueState {
  String? get period => throw _privateConstructorUsedError;
  @DateTimeDefault()
  DateTime get date => throw _privateConstructorUsedError;
  @TextFieldDefault()
  TextEditingController get name => throw _privateConstructorUsedError;
  @TextFieldDefault()
  TextEditingController get fee => throw _privateConstructorUsedError;
  @TextFieldDefault()
  TextEditingController get url => throw _privateConstructorUsedError;
  Image? get favicon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubValueStateCopyWith<SubValueState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubValueStateCopyWith<$Res> {
  factory $SubValueStateCopyWith(
          SubValueState value, $Res Function(SubValueState) then) =
      _$SubValueStateCopyWithImpl<$Res>;
  $Res call(
      {String? period,
      @DateTimeDefault() DateTime date,
      @TextFieldDefault() TextEditingController name,
      @TextFieldDefault() TextEditingController fee,
      @TextFieldDefault() TextEditingController url,
      Image? favicon});
}

/// @nodoc
class _$SubValueStateCopyWithImpl<$Res>
    implements $SubValueStateCopyWith<$Res> {
  _$SubValueStateCopyWithImpl(this._value, this._then);

  final SubValueState _value;
  // ignore: unused_field
  final $Res Function(SubValueState) _then;

  @override
  $Res call({
    Object? period = freezed,
    Object? date = freezed,
    Object? name = freezed,
    Object? fee = freezed,
    Object? url = freezed,
    Object? favicon = freezed,
  }) {
    return _then(_value.copyWith(
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      favicon: favicon == freezed
          ? _value.favicon
          : favicon // ignore: cast_nullable_to_non_nullable
              as Image?,
    ));
  }
}

/// @nodoc
abstract class _$$_SubValueStateCopyWith<$Res>
    implements $SubValueStateCopyWith<$Res> {
  factory _$$_SubValueStateCopyWith(
          _$_SubValueState value, $Res Function(_$_SubValueState) then) =
      __$$_SubValueStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? period,
      @DateTimeDefault() DateTime date,
      @TextFieldDefault() TextEditingController name,
      @TextFieldDefault() TextEditingController fee,
      @TextFieldDefault() TextEditingController url,
      Image? favicon});
}

/// @nodoc
class __$$_SubValueStateCopyWithImpl<$Res>
    extends _$SubValueStateCopyWithImpl<$Res>
    implements _$$_SubValueStateCopyWith<$Res> {
  __$$_SubValueStateCopyWithImpl(
      _$_SubValueState _value, $Res Function(_$_SubValueState) _then)
      : super(_value, (v) => _then(v as _$_SubValueState));

  @override
  _$_SubValueState get _value => super._value as _$_SubValueState;

  @override
  $Res call({
    Object? period = freezed,
    Object? date = freezed,
    Object? name = freezed,
    Object? fee = freezed,
    Object? url = freezed,
    Object? favicon = freezed,
  }) {
    return _then(_$_SubValueState(
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      favicon: favicon == freezed
          ? _value.favicon
          : favicon // ignore: cast_nullable_to_non_nullable
              as Image?,
    ));
  }
}

/// @nodoc

class _$_SubValueState with DiagnosticableTreeMixin implements _SubValueState {
  _$_SubValueState(
      {this.period = null,
      @DateTimeDefault() required this.date,
      @TextFieldDefault() required this.name,
      @TextFieldDefault() required this.fee,
      @TextFieldDefault() required this.url,
      this.favicon = null});

  @override
  @JsonKey()
  final String? period;
  @override
  @DateTimeDefault()
  final DateTime date;
  @override
  @TextFieldDefault()
  final TextEditingController name;
  @override
  @TextFieldDefault()
  final TextEditingController fee;
  @override
  @TextFieldDefault()
  final TextEditingController url;
  @override
  @JsonKey()
  final Image? favicon;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SubValueState(period: $period, date: $date, name: $name, fee: $fee, url: $url, favicon: $favicon)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SubValueState'))
      ..add(DiagnosticsProperty('period', period))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('fee', fee))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('favicon', favicon));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubValueState &&
            const DeepCollectionEquality().equals(other.period, period) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.fee, fee) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.favicon, favicon));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(period),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(fee),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(favicon));

  @JsonKey(ignore: true)
  @override
  _$$_SubValueStateCopyWith<_$_SubValueState> get copyWith =>
      __$$_SubValueStateCopyWithImpl<_$_SubValueState>(this, _$identity);
}

abstract class _SubValueState implements SubValueState {
  factory _SubValueState(
      {final String? period,
      @DateTimeDefault() required final DateTime date,
      @TextFieldDefault() required final TextEditingController name,
      @TextFieldDefault() required final TextEditingController fee,
      @TextFieldDefault() required final TextEditingController url,
      final Image? favicon}) = _$_SubValueState;

  @override
  String? get period => throw _privateConstructorUsedError;
  @override
  @DateTimeDefault()
  DateTime get date => throw _privateConstructorUsedError;
  @override
  @TextFieldDefault()
  TextEditingController get name => throw _privateConstructorUsedError;
  @override
  @TextFieldDefault()
  TextEditingController get fee => throw _privateConstructorUsedError;
  @override
  @TextFieldDefault()
  TextEditingController get url => throw _privateConstructorUsedError;
  @override
  Image? get favicon => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SubValueStateCopyWith<_$_SubValueState> get copyWith =>
      throw _privateConstructorUsedError;
}
