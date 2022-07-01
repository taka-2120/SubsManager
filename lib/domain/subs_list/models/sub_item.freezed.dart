// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sub_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubItem _$SubItemFromJson(Map<String, dynamic> json) {
  return _SubItem.fromJson(json);
}

/// @nodoc
mixin _$SubItem {
  String get id => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get fee => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  bool get hasIcon => throw _privateConstructorUsedError;
  String get altHexColorCode => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  int? get period => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubItemCopyWith<SubItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubItemCopyWith<$Res> {
  factory $SubItemCopyWith(SubItem value, $Res Function(SubItem) then) =
      _$SubItemCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String uid,
      String name,
      double fee,
      String url,
      bool hasIcon,
      String altHexColorCode,
      DateTime? date,
      int? period});
}

/// @nodoc
class _$SubItemCopyWithImpl<$Res> implements $SubItemCopyWith<$Res> {
  _$SubItemCopyWithImpl(this._value, this._then);

  final SubItem _value;
  // ignore: unused_field
  final $Res Function(SubItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? name = freezed,
    Object? fee = freezed,
    Object? url = freezed,
    Object? hasIcon = freezed,
    Object? altHexColorCode = freezed,
    Object? date = freezed,
    Object? period = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
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
      hasIcon: hasIcon == freezed
          ? _value.hasIcon
          : hasIcon // ignore: cast_nullable_to_non_nullable
              as bool,
      altHexColorCode: altHexColorCode == freezed
          ? _value.altHexColorCode
          : altHexColorCode // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_SubItemCopyWith<$Res> implements $SubItemCopyWith<$Res> {
  factory _$$_SubItemCopyWith(
          _$_SubItem value, $Res Function(_$_SubItem) then) =
      __$$_SubItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String uid,
      String name,
      double fee,
      String url,
      bool hasIcon,
      String altHexColorCode,
      DateTime? date,
      int? period});
}

/// @nodoc
class __$$_SubItemCopyWithImpl<$Res> extends _$SubItemCopyWithImpl<$Res>
    implements _$$_SubItemCopyWith<$Res> {
  __$$_SubItemCopyWithImpl(_$_SubItem _value, $Res Function(_$_SubItem) _then)
      : super(_value, (v) => _then(v as _$_SubItem));

  @override
  _$_SubItem get _value => super._value as _$_SubItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? name = freezed,
    Object? fee = freezed,
    Object? url = freezed,
    Object? hasIcon = freezed,
    Object? altHexColorCode = freezed,
    Object? date = freezed,
    Object? period = freezed,
  }) {
    return _then(_$_SubItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
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
      hasIcon: hasIcon == freezed
          ? _value.hasIcon
          : hasIcon // ignore: cast_nullable_to_non_nullable
              as bool,
      altHexColorCode: altHexColorCode == freezed
          ? _value.altHexColorCode
          : altHexColorCode // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubItem extends _SubItem {
  const _$_SubItem(
      {this.id = "",
      this.uid = "",
      this.name = "",
      this.fee = 0,
      this.url = "",
      this.hasIcon = false,
      this.altHexColorCode = "0xFF32C9BD",
      this.date = null,
      this.period = null})
      : super._();

  factory _$_SubItem.fromJson(Map<String, dynamic> json) =>
      _$$_SubItemFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String uid;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final double fee;
  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey()
  final bool hasIcon;
  @override
  @JsonKey()
  final String altHexColorCode;
  @override
  @JsonKey()
  final DateTime? date;
  @override
  @JsonKey()
  final int? period;

  @override
  String toString() {
    return 'SubItem(id: $id, uid: $uid, name: $name, fee: $fee, url: $url, hasIcon: $hasIcon, altHexColorCode: $altHexColorCode, date: $date, period: $period)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubItem &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.fee, fee) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.hasIcon, hasIcon) &&
            const DeepCollectionEquality()
                .equals(other.altHexColorCode, altHexColorCode) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.period, period));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(fee),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(hasIcon),
      const DeepCollectionEquality().hash(altHexColorCode),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(period));

  @JsonKey(ignore: true)
  @override
  _$$_SubItemCopyWith<_$_SubItem> get copyWith =>
      __$$_SubItemCopyWithImpl<_$_SubItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubItemToJson(this);
  }
}

abstract class _SubItem extends SubItem {
  const factory _SubItem(
      {final String id,
      final String uid,
      final String name,
      final double fee,
      final String url,
      final bool hasIcon,
      final String altHexColorCode,
      final DateTime? date,
      final int? period}) = _$_SubItem;
  const _SubItem._() : super._();

  factory _SubItem.fromJson(Map<String, dynamic> json) = _$_SubItem.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get uid => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  double get fee => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  bool get hasIcon => throw _privateConstructorUsedError;
  @override
  String get altHexColorCode => throw _privateConstructorUsedError;
  @override
  DateTime? get date => throw _privateConstructorUsedError;
  @override
  int? get period => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SubItemCopyWith<_$_SubItem> get copyWith =>
      throw _privateConstructorUsedError;
}
