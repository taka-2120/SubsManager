import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subsmanager/extensions/fee_double_str.dart';
import 'package:subsmanager/extensions/period_int_str.dart';

class Converters {
  String combineFeePeriodAsString(
    WidgetRef ref, {
    required double fee,
    required int period,
  }) {
    String feeStr = fee.feeToString(format: true);
    String periodStr = period.periodToString(ref);

    return "$feeStr/$periodStr";
  }
}
