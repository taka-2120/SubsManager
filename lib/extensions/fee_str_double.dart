extension FeeStrToDouble on String {
  double feeToDouble() {
    String fee = this;
    if (fee == "") {
      fee = "-99.9";
    }
    return double.parse(fee);
  }
}
