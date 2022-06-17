// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'username.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UsernameState {
  String get username => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UsernameStateCopyWith<UsernameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsernameStateCopyWith<$Res> {
  factory $UsernameStateCopyWith(
          UsernameState value, $Res Function(UsernameState) then) =
      _$UsernameStateCopyWithImpl<$Res>;
  $Res call({String username, bool error});
}

/// @nodoc
class _$UsernameStateCopyWithImpl<$Res>
    implements $UsernameStateCopyWith<$Res> {
  _$UsernameStateCopyWithImpl(this._value, this._then);

  final UsernameState _value;
  // ignore: unused_field
  final $Res Function(UsernameState) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_UsernameStateCopyWith<$Res>
    implements $UsernameStateCopyWith<$Res> {
  factory _$$_UsernameStateCopyWith(
          _$_UsernameState value, $Res Function(_$_UsernameState) then) =
      __$$_UsernameStateCopyWithImpl<$Res>;
  @override
  $Res call({String username, bool error});
}

/// @nodoc
class __$$_UsernameStateCopyWithImpl<$Res>
    extends _$UsernameStateCopyWithImpl<$Res>
    implements _$$_UsernameStateCopyWith<$Res> {
  __$$_UsernameStateCopyWithImpl(
      _$_UsernameState _value, $Res Function(_$_UsernameState) _then)
      : super(_value, (v) => _then(v as _$_UsernameState));

  @override
  _$_UsernameState get _value => super._value as _$_UsernameState;

  @override
  $Res call({
    Object? username = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_UsernameState(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UsernameState implements _UsernameState {
  const _$_UsernameState({this.username = "Not Set", this.error = false});

  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final bool error;

  @override
  String toString() {
    return 'UsernameState(username: $username, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UsernameState &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_UsernameStateCopyWith<_$_UsernameState> get copyWith =>
      __$$_UsernameStateCopyWithImpl<_$_UsernameState>(this, _$identity);
}

abstract class _UsernameState implements UsernameState {
  const factory _UsernameState({final String username, final bool error}) =
      _$_UsernameState;

  @override
  String get username => throw _privateConstructorUsedError;
  @override
  bool get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UsernameStateCopyWith<_$_UsernameState> get copyWith =>
      throw _privateConstructorUsedError;
}
