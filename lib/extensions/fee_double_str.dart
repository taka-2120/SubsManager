import 'package:intl/intl.dart';

import '../globals.dart';

extension FeeDoubleToString on double {
  String feeToString({required bool currency}) {
    double fee = this;
    String currencyStr;
    NumberFormat value;
    if (localeStr.contains("JP") == true || localeStr.contains("ja") == true) {
      value = NumberFormat(currency ? "#,##0" : "###0", localeStr);
      currencyStr = currency ? "¥" : "";
    } else {
      value = NumberFormat(currency ? "#,##0.00" : "###0.00", localeStr);
      currencyStr = currency ? "\$" : "";
    }
    return currencyStr + value.format(fee);
  }
}
