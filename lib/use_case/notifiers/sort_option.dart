import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/use_case/subs_list/notifier/subs_list_notifier.dart';

final sortOptionProvider =
    StateNotifierProvider<SortOption, int>((ref) => SortOption(0));

class SortOption extends StateNotifier<int> {
  SortOption(initial) : super(initial ?? 0);

  void update(WidgetRef ref, int index) {
    state = index;
    ref.read(subsListNotifierProvider.notifier).sort(index);
  }
}
