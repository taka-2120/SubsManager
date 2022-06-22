import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  AppInfo();

  String getAppName() {
    PackageInfo.fromPlatform().then((value) {
      return value.appName;
    });
    return "";
  }

  String getAppVersion() {
    PackageInfo.fromPlatform().then((value) {
      return value.version;
    });
    return "";
  }
}
