// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_data.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserDataState {
  String get userName => throw _privateConstructorUsedError;
  String get pass => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDataStateCopyWith<UserDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataStateCopyWith<$Res> {
  factory $UserDataStateCopyWith(
          UserDataState value, $Res Function(UserDataState) then) =
      _$UserDataStateCopyWithImpl<$Res>;
  $Res call({String userName, String pass});
}

/// @nodoc
class _$UserDataStateCopyWithImpl<$Res>
    implements $UserDataStateCopyWith<$Res> {
  _$UserDataStateCopyWithImpl(this._value, this._then);

  final UserDataState _value;
  // ignore: unused_field
  final $Res Function(UserDataState) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? pass = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      pass: pass == freezed
          ? _value.pass
          : pass // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UserDataStateCopyWith<$Res>
    implements $UserDataStateCopyWith<$Res> {
  factory _$$_UserDataStateCopyWith(
          _$_UserDataState value, $Res Function(_$_UserDataState) then) =
      __$$_UserDataStateCopyWithImpl<$Res>;
  @override
  $Res call({String userName, String pass});
}

/// @nodoc
class __$$_UserDataStateCopyWithImpl<$Res>
    extends _$UserDataStateCopyWithImpl<$Res>
    implements _$$_UserDataStateCopyWith<$Res> {
  __$$_UserDataStateCopyWithImpl(
      _$_UserDataState _value, $Res Function(_$_UserDataState) _then)
      : super(_value, (v) => _then(v as _$_UserDataState));

  @override
  _$_UserDataState get _value => super._value as _$_UserDataState;

  @override
  $Res call({
    Object? userName = freezed,
    Object? pass = freezed,
  }) {
    return _then(_$_UserDataState(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      pass: pass == freezed
          ? _value.pass
          : pass // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UserDataState implements _UserDataState {
  _$_UserDataState({this.userName = "", this.pass = ""});

  @override
  @JsonKey()
  final String userName;
  @override
  @JsonKey()
  final String pass;

  @override
  String toString() {
    return 'UserDataState(userName: $userName, pass: $pass)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDataState &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.pass, pass));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(pass));

  @JsonKey(ignore: true)
  @override
  _$$_UserDataStateCopyWith<_$_UserDataState> get copyWith =>
      __$$_UserDataStateCopyWithImpl<_$_UserDataState>(this, _$identity);
}

abstract class _UserDataState implements UserDataState {
  factory _UserDataState({final String userName, final String pass}) =
      _$_UserDataState;

  @override
  String get userName => throw _privateConstructorUsedError;
  @override
  String get pass => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserDataStateCopyWith<_$_UserDataState> get copyWith =>
      throw _privateConstructorUsedError;
}
