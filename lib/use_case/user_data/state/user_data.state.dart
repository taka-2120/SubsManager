import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.state.freezed.dart';

@freezed
class UserDataState with _$UserDataState {
  factory UserDataState({
    @Default("") String email,
    @Default("") String username,
    @Default(false) bool error,
  }) = _UserDataState;
}
