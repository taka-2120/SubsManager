import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/presentation/notifiers/subs_list.dart';

final sortOptionProvider =
    StateNotifierProvider<SortOption, int>((ref) => SortOption(0));

class SortOption extends StateNotifier<int> {
  SortOption(initial) : super(initial ?? 0);

  void update(WidgetRef ref, int index) {
    state = index;
    ref.read(subsListProvider.notifier).sort(index);
  }
}
