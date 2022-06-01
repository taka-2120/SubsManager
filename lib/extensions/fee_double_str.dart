import 'package:intl/intl.dart';

import '../presentation/hooks/locale.dart';

extension FeeDoubleToString on double {
  String feeToString({required bool format}) {
    double fee = this;
    String currencyStr;
    NumberFormat value;
    if (localeStr.contains("JP") == true || localeStr.contains("ja") == true) {
      value = NumberFormat(format ? "#,##0" : "###0", localeStr);
      currencyStr = format ? "¥" : "";
    } else {
      value = NumberFormat(format ? "#,##0.00" : "###0.00", localeStr);
      currencyStr = format ? "\$" : "";
    }
    return currencyStr + value.format(fee);
  }
}
