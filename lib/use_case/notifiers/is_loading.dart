import 'package:hooks_riverpod/hooks_riverpod.dart';

final isLoadingProvider =
    StateNotifierProvider<IsLoading, bool>((ref) => IsLoading(false));

class IsLoading extends StateNotifier<bool> {
  IsLoading(initial) : super(initial);

  void changeState(bool isLoading) {
    state = isLoading;
  }
}
