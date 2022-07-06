import 'package:subsmanager/l10n/l10n.dart';

extension PeriodStrExt on String? {
  int periodToInt(L10n l10n) {
    String? period = this;
    int periodIndex = 0;

    if (period == l10n.monthly) {
      periodIndex = 0;
    } else if (period == l10n.semi_annually) {
      periodIndex = 1;
    } else if (period == l10n.annually) {
      periodIndex = 2;
    } else {
      periodIndex = 99;
    }
    return periodIndex;
  }
}
