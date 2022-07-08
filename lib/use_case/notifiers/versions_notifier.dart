import 'package:hooks_riverpod/hooks_riverpod.dart';

final versionNotifierProvider =
    StateNotifierProvider<Version, String>((ref) => Version("1.0.0"));

class Version extends StateNotifier<String> {
  Version(initial) : super(initial ?? "1.0.0");

  void update(String value) {
    state = value;
  }
}
