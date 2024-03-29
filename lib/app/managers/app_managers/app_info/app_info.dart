import 'package:package_info_plus/package_info_plus.dart' as package;

class AppInfo {
  /// The app name. `CFBundleDisplayName` on iOS, `application/label` on Android.
  late final String appName;

  /// The package name. `bundleIdentifier` on iOS, `getPackageName` on Android.
  late final String packageName;

  /// The package version. `CFBundleShortVersionString` on iOS, `versionName` on Android.
  late final String version;

  /// The build number. `CFBundleVersion` on iOS, `versionCode` on Android.
  late final String buildNumber;

  /// The build signature. Empty string on iOS, signing key signature (hex) on Android.
  late final String buildSignature;

  /// Unique UUID value identifying the current device.
  late final String deviceId;

  static AppInfo? _instance;

  static Future<AppInfo> instance() async {
    _instance ??= await AppInfo()._init();
    return _instance!;
  }

  Future<AppInfo> _init() async {
    await _getPackageInfo();
    return this;
  }

  Future<void> _getPackageInfo() async {
    final package.PackageInfo info = await package.PackageInfo.fromPlatform();
    version = info.version;
    buildNumber = info.buildNumber;
    appName = info.appName;
    packageName = info.packageName;
    buildSignature = info.buildSignature;
  }

}
