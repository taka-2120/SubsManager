import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/use_case/subs_list/notifier/subs_list_notifier.dart';

final sortOptionProvider =
    StateNotifierProvider<SortOption, int>((ref) => SortOption(ref, 0));

class SortOption extends StateNotifier<int> {
  SortOption(this._ref, initial) : super(initial ?? 0);

  final Ref _ref;

  void update(int index) {
    state = index;
    _ref.read(subsListNotifierProvider.notifier).sort(index);
  }
}
