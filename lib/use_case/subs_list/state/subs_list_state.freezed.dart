// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'subs_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubsListState _$SubsListStateFromJson(Map<String, dynamic> json) {
  return _SubsListState.fromJson(json);
}

/// @nodoc
mixin _$SubsListState {
  List<SubItem> get subsList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubsListStateCopyWith<SubsListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubsListStateCopyWith<$Res> {
  factory $SubsListStateCopyWith(
          SubsListState value, $Res Function(SubsListState) then) =
      _$SubsListStateCopyWithImpl<$Res>;
  $Res call({List<SubItem> subsList});
}

/// @nodoc
class _$SubsListStateCopyWithImpl<$Res>
    implements $SubsListStateCopyWith<$Res> {
  _$SubsListStateCopyWithImpl(this._value, this._then);

  final SubsListState _value;
  // ignore: unused_field
  final $Res Function(SubsListState) _then;

  @override
  $Res call({
    Object? subsList = freezed,
  }) {
    return _then(_value.copyWith(
      subsList: subsList == freezed
          ? _value.subsList
          : subsList // ignore: cast_nullable_to_non_nullable
              as List<SubItem>,
    ));
  }
}

/// @nodoc
abstract class _$$_SubsListStateCopyWith<$Res>
    implements $SubsListStateCopyWith<$Res> {
  factory _$$_SubsListStateCopyWith(
          _$_SubsListState value, $Res Function(_$_SubsListState) then) =
      __$$_SubsListStateCopyWithImpl<$Res>;
  @override
  $Res call({List<SubItem> subsList});
}

/// @nodoc
class __$$_SubsListStateCopyWithImpl<$Res>
    extends _$SubsListStateCopyWithImpl<$Res>
    implements _$$_SubsListStateCopyWith<$Res> {
  __$$_SubsListStateCopyWithImpl(
      _$_SubsListState _value, $Res Function(_$_SubsListState) _then)
      : super(_value, (v) => _then(v as _$_SubsListState));

  @override
  _$_SubsListState get _value => super._value as _$_SubsListState;

  @override
  $Res call({
    Object? subsList = freezed,
  }) {
    return _then(_$_SubsListState(
      subsList: subsList == freezed
          ? _value._subsList
          : subsList // ignore: cast_nullable_to_non_nullable
              as List<SubItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubsListState implements _SubsListState {
  const _$_SubsListState({final List<SubItem> subsList = const <SubItem>[]})
      : _subsList = subsList;

  factory _$_SubsListState.fromJson(Map<String, dynamic> json) =>
      _$$_SubsListStateFromJson(json);

  final List<SubItem> _subsList;
  @override
  @JsonKey()
  List<SubItem> get subsList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subsList);
  }

  @override
  String toString() {
    return 'SubsListState(subsList: $subsList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubsListState &&
            const DeepCollectionEquality().equals(other._subsList, _subsList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_subsList));

  @JsonKey(ignore: true)
  @override
  _$$_SubsListStateCopyWith<_$_SubsListState> get copyWith =>
      __$$_SubsListStateCopyWithImpl<_$_SubsListState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubsListStateToJson(this);
  }
}

abstract class _SubsListState implements SubsListState {
  const factory _SubsListState({final List<SubItem> subsList}) =
      _$_SubsListState;

  factory _SubsListState.fromJson(Map<String, dynamic> json) =
      _$_SubsListState.fromJson;

  @override
  List<SubItem> get subsList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SubsListStateCopyWith<_$_SubsListState> get copyWith =>
      throw _privateConstructorUsedError;
}
