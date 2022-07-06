import 'package:subsmanager/l10n/l10n.dart';

extension PeriodIntExt on int? {
  String periodToString(L10n l10n) {
    int? period = this;
    String periodStr = "";

    switch (period) {
      case 0:
        periodStr = l10n.monthly;
        break;
      case 1:
        periodStr = l10n.semi_annually;
        break;
      case 2:
        periodStr = l10n.annually;
        break;
    }
    return periodStr;
  }
}
