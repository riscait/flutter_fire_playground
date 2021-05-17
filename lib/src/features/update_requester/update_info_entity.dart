import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_info_entity.freezed.dart';
part 'update_info_entity.g.dart';

/// 強制アップデート用のEntity
@freezed
class UpdateInfoEntity with _$UpdateInfoEntity {
  const factory UpdateInfoEntity({
    /// 要求バージョン e.g., '1.0.0'
    required String requiredVersion,

    /// アップデートを後回し可能にするかどうか
    @Default(false) bool canCancel,

    /// 有効日（この日時以降のみ有効とする）
    required DateTime enabledAt,
  }) = _UpdateInfoEntity;

  factory UpdateInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$UpdateInfoEntityFromJson(json);
}
