import 'package:freezed_annotation/freezed_annotation.dart';

part 'username.state.freezed.dart';

@freezed
class UsernameState with _$UsernameState {
  const factory UsernameState({
    @Default("Not Set") String username,
    @Default(false) bool error,
  }) = _UsernameState;
}
