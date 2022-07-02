import 'package:hooks_riverpod/hooks_riverpod.dart';

final versionsNotifierProvider =
    StateNotifierProvider<Versions, String>((ref) => Versions("1.0.0"));

class Versions extends StateNotifier<String> {
  Versions(initial) : super(initial ?? "1.0.0");

  void update(String ver) {
    state = ver;
  }
}
