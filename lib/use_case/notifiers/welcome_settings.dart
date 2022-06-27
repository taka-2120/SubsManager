import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/domain/models/welcome_settings/welcome_settings.state.dart';

final welcomeSettingsProvider =
    StateNotifierProvider<WelcomeSettings, WelcomeSettingsState>(
  (ref) => WelcomeSettings(),
);

class WelcomeSettings extends StateNotifier<WelcomeSettingsState> {
  WelcomeSettings() : super(WelcomeSettingsState());

  void updateNotifState(bool value) {
    state = state.copyWith(isNotifEnabled: value);
  }

  void updateAgreeState(bool value) {
    state = state.copyWith(isAgreed: value);
  }
}
