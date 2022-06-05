import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.state.freezed.dart';

@freezed
class UserDataState with _$UserDataState {
  factory UserDataState({
    @Default("") String userName,
    @Default("") String pass,
  }) = _UserDataState;
}
