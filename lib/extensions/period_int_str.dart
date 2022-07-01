import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/use_case/notifiers/periods.dart';

extension PeriodIntExt on int? {
  String periodToString(WidgetRef ref) {
    final periods = ref
        .watch(
          periodsProvider.select((value) => value),
        )
        .periods;
    int? period = this;
    String periodStr = "";

    switch (period) {
      case 0:
        periodStr = periods[0];
        break;
      case 1:
        periodStr = periods[1];
        break;
      case 2:
        periodStr = periods[2];
        break;
    }
    return periodStr;
  }
}
