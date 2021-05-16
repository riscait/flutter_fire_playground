import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info/package_info.dart';

final appPackageInfoProvider =
    Provider<AppPackageInfo>((ref) => throw UnimplementedError());

/// アプリの固有情報をまとめたクラス
/// PackgeInfoプラグインを使用している
class AppPackageInfo {
  AppPackageInfo(this._packageInfo);

  final PackageInfo _packageInfo;

  late final appName = _packageInfo.appName;

  late final version = _packageInfo.version;

  late final buildNumber = _packageInfo.buildNumber;
}
