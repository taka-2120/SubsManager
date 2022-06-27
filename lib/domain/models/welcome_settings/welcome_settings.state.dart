import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_settings.state.freezed.dart';

@freezed
class WelcomeSettingsState with _$WelcomeSettingsState {
  factory WelcomeSettingsState({
    @Default(false) bool isNotifEnabled,
    @Default(false) bool isAgreed,
  }) = _WelcomeSettingsState;
}
