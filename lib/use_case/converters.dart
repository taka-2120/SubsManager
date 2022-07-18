import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
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

Future<String> writeImageToStorage(Uint8List feedbackScreenshot) async {
  final Directory output = await getTemporaryDirectory();
  final String screenshotFilePath = '${output.path}/feedback.png';
  final File screenshotFile = File(screenshotFilePath);
  await screenshotFile.writeAsBytes(feedbackScreenshot);
  return screenshotFilePath;
}
