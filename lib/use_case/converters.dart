import 'package:subsmanager/extensions/fee_double_str.dart';
import 'package:subsmanager/extensions/period_int_str.dart';
import 'package:subsmanager/l10n/l10n.dart';

class Converters {
  String combineFeePeriodAsString(
    L10n l10n, {
    required double fee,
    required int period,
  }) {
    String feeStr = fee.feeToString(currency: true);
    String periodStr = period.periodToString(l10n);

    return "$feeStr/$periodStr";
  }
}
