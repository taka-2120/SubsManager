class SubsFunctions {
  String roundedFeeToString(double fee, String locale) {
    //FIX: not reccommended
    if (locale == "ja_JP") {
      return fee.toStringAsFixed(0);
    } else {
      return fee.toStringAsFixed(2);
    }
  }

  String periodToString(int period) {
    String periodStr = "";

    switch (period) {
      case 0:
        periodStr = "Monthly";
        break;
      case 1:
        periodStr = "Semi-Annually";
        break;
      case 2:
        periodStr = "Annually";
        break;
      default:
        periodStr = "Monthly";
        break;
    }
    return periodStr;
  }
}
