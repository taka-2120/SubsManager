import 'package:hooks_riverpod/hooks_riverpod.dart';

final tabIndexProvider =
    StateNotifierProvider<TabIndex, int>((ref) => TabIndex(0));

class TabIndex extends StateNotifier<int> {
  TabIndex(initial) : super(initial ?? 0);

  void update(int index) {
    state = index;
  }
}
