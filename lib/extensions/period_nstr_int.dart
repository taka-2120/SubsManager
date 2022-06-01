import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../presentation/notifiers/periods.dart';

extension PeriodStrExt on String? {
  int periodToInt(WidgetRef ref) {
    final periods = ref
        .watch(
          periodsProvider.select((value) => value),
        )
        .periods;
    String? period = this;
    int periodIndex = 0;

    if (period == periods[0]) {
      periodIndex = 0;
    } else if (period == periods[1]) {
      periodIndex = 1;
    } else if (period == periods[2]) {
      periodIndex = 2;
    } else {
      periodIndex = 99;
    }
    return periodIndex;
  }
}
