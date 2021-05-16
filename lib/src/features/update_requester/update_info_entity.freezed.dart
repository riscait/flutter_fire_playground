// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'update_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateInfoEntity _$UpdateInfoEntityFromJson(Map<String, dynamic> json) {
  return _UpdateInfoEntity.fromJson(json);
}

/// @nodoc
class _$UpdateInfoEntityTearOff {
  const _$UpdateInfoEntityTearOff();

  _UpdateInfoEntity call(
      {required String requiredVersion,
      bool canCancel = false,
      required DateTime enabledAt}) {
    return _UpdateInfoEntity(
      requiredVersion: requiredVersion,
      canCancel: canCancel,
      enabledAt: enabledAt,
    );
  }

  UpdateInfoEntity fromJson(Map<String, Object> json) {
    return UpdateInfoEntity.fromJson(json);
  }
}

/// @nodoc
const $UpdateInfoEntity = _$UpdateInfoEntityTearOff();

/// @nodoc
mixin _$UpdateInfoEntity {
  /// 要求バージョン e.g., '1.0.0'
  String get requiredVersion => throw _privateConstructorUsedError;

  /// アップデートを後回し可能にするかどうか
  bool get canCancel => throw _privateConstructorUsedError;

  /// 有効日（この日時以降のみ有効とする）
  DateTime get enabledAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateInfoEntityCopyWith<UpdateInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateInfoEntityCopyWith<$Res> {
  factory $UpdateInfoEntityCopyWith(
          UpdateInfoEntity value, $Res Function(UpdateInfoEntity) then) =
      _$UpdateInfoEntityCopyWithImpl<$Res>;
  $Res call({String requiredVersion, bool canCancel, DateTime enabledAt});
}

/// @nodoc
class _$UpdateInfoEntityCopyWithImpl<$Res>
    implements $UpdateInfoEntityCopyWith<$Res> {
  _$UpdateInfoEntityCopyWithImpl(this._value, this._then);

  final UpdateInfoEntity _value;
  // ignore: unused_field
  final $Res Function(UpdateInfoEntity) _then;

  @override
  $Res call({
    Object? requiredVersion = freezed,
    Object? canCancel = freezed,
    Object? enabledAt = freezed,
  }) {
    return _then(_value.copyWith(
      requiredVersion: requiredVersion == freezed
          ? _value.requiredVersion
          : requiredVersion // ignore: cast_nullable_to_non_nullable
              as String,
      canCancel: canCancel == freezed
          ? _value.canCancel
          : canCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      enabledAt: enabledAt == freezed
          ? _value.enabledAt
          : enabledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$UpdateInfoEntityCopyWith<$Res>
    implements $UpdateInfoEntityCopyWith<$Res> {
  factory _$UpdateInfoEntityCopyWith(
          _UpdateInfoEntity value, $Res Function(_UpdateInfoEntity) then) =
      __$UpdateInfoEntityCopyWithImpl<$Res>;
  @override
  $Res call({String requiredVersion, bool canCancel, DateTime enabledAt});
}

/// @nodoc
class __$UpdateInfoEntityCopyWithImpl<$Res>
    extends _$UpdateInfoEntityCopyWithImpl<$Res>
    implements _$UpdateInfoEntityCopyWith<$Res> {
  __$UpdateInfoEntityCopyWithImpl(
      _UpdateInfoEntity _value, $Res Function(_UpdateInfoEntity) _then)
      : super(_value, (v) => _then(v as _UpdateInfoEntity));

  @override
  _UpdateInfoEntity get _value => super._value as _UpdateInfoEntity;

  @override
  $Res call({
    Object? requiredVersion = freezed,
    Object? canCancel = freezed,
    Object? enabledAt = freezed,
  }) {
    return _then(_UpdateInfoEntity(
      requiredVersion: requiredVersion == freezed
          ? _value.requiredVersion
          : requiredVersion // ignore: cast_nullable_to_non_nullable
              as String,
      canCancel: canCancel == freezed
          ? _value.canCancel
          : canCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      enabledAt: enabledAt == freezed
          ? _value.enabledAt
          : enabledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateInfoEntity implements _UpdateInfoEntity {
  const _$_UpdateInfoEntity(
      {required this.requiredVersion,
      this.canCancel = false,
      required this.enabledAt});

  factory _$_UpdateInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$_$_UpdateInfoEntityFromJson(json);

  @override

  /// 要求バージョン e.g., '1.0.0'
  final String requiredVersion;
  @JsonKey(defaultValue: false)
  @override

  /// アップデートを後回し可能にするかどうか
  final bool canCancel;
  @override

  /// 有効日（この日時以降のみ有効とする）
  final DateTime enabledAt;

  @override
  String toString() {
    return 'UpdateInfoEntity(requiredVersion: $requiredVersion, canCancel: $canCancel, enabledAt: $enabledAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateInfoEntity &&
            (identical(other.requiredVersion, requiredVersion) ||
                const DeepCollectionEquality()
                    .equals(other.requiredVersion, requiredVersion)) &&
            (identical(other.canCancel, canCancel) ||
                const DeepCollectionEquality()
                    .equals(other.canCancel, canCancel)) &&
            (identical(other.enabledAt, enabledAt) ||
                const DeepCollectionEquality()
                    .equals(other.enabledAt, enabledAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(requiredVersion) ^
      const DeepCollectionEquality().hash(canCancel) ^
      const DeepCollectionEquality().hash(enabledAt);

  @JsonKey(ignore: true)
  @override
  _$UpdateInfoEntityCopyWith<_UpdateInfoEntity> get copyWith =>
      __$UpdateInfoEntityCopyWithImpl<_UpdateInfoEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UpdateInfoEntityToJson(this);
  }
}

abstract class _UpdateInfoEntity implements UpdateInfoEntity {
  const factory _UpdateInfoEntity(
      {required String requiredVersion,
      bool canCancel,
      required DateTime enabledAt}) = _$_UpdateInfoEntity;

  factory _UpdateInfoEntity.fromJson(Map<String, dynamic> json) =
      _$_UpdateInfoEntity.fromJson;

  @override

  /// 要求バージョン e.g., '1.0.0'
  String get requiredVersion => throw _privateConstructorUsedError;
  @override

  /// アップデートを後回し可能にするかどうか
  bool get canCancel => throw _privateConstructorUsedError;
  @override

  /// 有効日（この日時以降のみ有効とする）
  DateTime get enabledAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UpdateInfoEntityCopyWith<_UpdateInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
