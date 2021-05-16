// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_info_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateInfoEntity _$_$_UpdateInfoEntityFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_UpdateInfoEntity', json, () {
    final val = _$_UpdateInfoEntity(
      requiredVersion:
          $checkedConvert(json, 'requiredVersion', (v) => v as String),
      canCancel: $checkedConvert(json, 'canCancel', (v) => v as bool?) ?? false,
      enabledAt: $checkedConvert(
          json, 'enabledAt', (v) => DateTime.parse(v as String)),
    );
    return val;
  });
}

Map<String, dynamic> _$_$_UpdateInfoEntityToJson(
        _$_UpdateInfoEntity instance) =>
    <String, dynamic>{
      'requiredVersion': instance.requiredVersion,
      'canCancel': instance.canCancel,
      'enabledAt': instance.enabledAt.toIso8601String(),
    };
