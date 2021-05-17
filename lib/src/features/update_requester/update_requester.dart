import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:version/version.dart';

import '../../top_level_providers/package_info_provider.dart';
import '../../top_level_providers/remote_config_provider.dart';
import '../../utils/utils.dart';
import 'update_info_entity.dart';

enum UpdateRequestType {
  /// アップデートなし
  not,

  /// 後回しを許容するアップデートあり
  cancelable,

  /// 強制的なアップデートあり
  forcibly,
}

/// RemoteConfigから値を取得するときに必要なキー
const _key = 'update_info';

final updateRequesterProvider = FutureProvider<UpdateRequestType>((ref) async {
  // 初期化・アクティベート済みのRemoteConfigインスタンス
  final remoteConfig = ref.watch(remoteConfigProvider);
  await remoteConfig.fetchAndActivate();
  // 現在のアプリバージョンを取得するためにPackageInfoを利用
  final appPackageInfo = ref.watch(appPackageInfoProvider);

  // キーを指定して文字列として取得
  final string = remoteConfig.getString(_key);
  logger.fine(string);
  if (string.isEmpty) {
    return UpdateRequestType.not;
  }
  // Entityに変換
  final entity = _decodeToEntity(string);
  // 有効期間内、かつ要求バージョンより低い場合は `true`
  final isUpdateRequired = _isRequiredPeriod(entity.enabledAt) &&
      _isRequiredVersion(
        requestVersion: _convertToVersion(entity.requiredVersion),
        currentVersion: _convertToVersion(appPackageInfo.version),
      );

  if (!isUpdateRequired) {
    return UpdateRequestType.not;
  }
  return entity.canCancel
      ? UpdateRequestType.cancelable
      : UpdateRequestType.forcibly;
});

// Private functions
// -----------------------------------------------------------------------------

/// 3桁のセマンティックバージョンにした上で、 [Version] に変換する
Version _convertToVersion(String version) {
  // 末尾に文字列や4桁目があった場合、取り除いて [major, minor, patch] の形にする
  final versionString = version.split('.').length > 3
      ? version.split('.').sublist(0, 3).join('.')
      : version;
  // [Version]型に変換して返却
  return Version.parse(versionString);
}

/// Entityに変換する
UpdateInfoEntity _decodeToEntity(String string) {
  // Map型に変換
  final map = json.decode(string) as Map<String, dynamic>;
  // Entityに変換
  return UpdateInfoEntity.fromJson(map);
}

/// バージョン要求が有効かどうか（有効な日付か）
/// 有効なら `true`
bool _isRequiredPeriod(DateTime enabledAt) {
  return enabledAt.compareTo(DateTime.now()) < 0;
}

/// 要求バージョンの方が高いかどうか
bool _isRequiredVersion({
  required Version requestVersion,
  required Version currentVersion,
}) {
  return requestVersion > currentVersion;
}
