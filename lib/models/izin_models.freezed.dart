// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'izin_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IzinModel _$IzinModelFromJson(Map<String, dynamic> json) {
  return $_IzinModel.fromJson(json);
}

/// @nodoc
class _$IzinModelTearOff {
  const _$IzinModelTearOff();

  $_IzinModel call(
      {required String tanggal,
      required String keterangan,
      required DateTime? createdAt}) {
    return $_IzinModel(
      tanggal: tanggal,
      keterangan: keterangan,
      createdAt: createdAt,
    );
  }

  IzinModel fromJson(Map<String, Object> json) {
    return IzinModel.fromJson(json);
  }
}

/// @nodoc
const $IzinModel = _$IzinModelTearOff();

/// @nodoc
mixin _$IzinModel {
  String get tanggal => throw _privateConstructorUsedError;
  String get keterangan => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IzinModelCopyWith<IzinModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IzinModelCopyWith<$Res> {
  factory $IzinModelCopyWith(IzinModel value, $Res Function(IzinModel) then) =
      _$IzinModelCopyWithImpl<$Res>;
  $Res call({String tanggal, String keterangan, DateTime? createdAt});
}

/// @nodoc
class _$IzinModelCopyWithImpl<$Res> implements $IzinModelCopyWith<$Res> {
  _$IzinModelCopyWithImpl(this._value, this._then);

  final IzinModel _value;
  // ignore: unused_field
  final $Res Function(IzinModel) _then;

  @override
  $Res call({
    Object? tanggal = freezed,
    Object? keterangan = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      tanggal: tanggal == freezed
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      keterangan: keterangan == freezed
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class $$_IzinModelCopyWith<$Res> implements $IzinModelCopyWith<$Res> {
  factory $$_IzinModelCopyWith(
          $_IzinModel value, $Res Function($_IzinModel) then) =
      _$$_IzinModelCopyWithImpl<$Res>;
  @override
  $Res call({String tanggal, String keterangan, DateTime? createdAt});
}

/// @nodoc
class _$$_IzinModelCopyWithImpl<$Res> extends _$IzinModelCopyWithImpl<$Res>
    implements $$_IzinModelCopyWith<$Res> {
  _$$_IzinModelCopyWithImpl(
      $_IzinModel _value, $Res Function($_IzinModel) _then)
      : super(_value, (v) => _then(v as $_IzinModel));

  @override
  $_IzinModel get _value => super._value as $_IzinModel;

  @override
  $Res call({
    Object? tanggal = freezed,
    Object? keterangan = freezed,
    Object? createdAt = freezed,
  }) {
    return _then($_IzinModel(
      tanggal: tanggal == freezed
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      keterangan: keterangan == freezed
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$_IzinModel implements $_IzinModel {
  const _$$_IzinModel(
      {required this.tanggal,
      required this.keterangan,
      required this.createdAt});

  factory _$$_IzinModel.fromJson(Map<String, dynamic> json) =>
      _$_$$_IzinModelFromJson(json);

  @override
  final String tanggal;
  @override
  final String keterangan;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'IzinModel(tanggal: $tanggal, keterangan: $keterangan, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is $_IzinModel &&
            (identical(other.tanggal, tanggal) ||
                const DeepCollectionEquality()
                    .equals(other.tanggal, tanggal)) &&
            (identical(other.keterangan, keterangan) ||
                const DeepCollectionEquality()
                    .equals(other.keterangan, keterangan)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tanggal) ^
      const DeepCollectionEquality().hash(keterangan) ^
      const DeepCollectionEquality().hash(createdAt);

  @JsonKey(ignore: true)
  @override
  $$_IzinModelCopyWith<$_IzinModel> get copyWith =>
      _$$_IzinModelCopyWithImpl<$_IzinModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$$_IzinModelToJson(this);
  }
}

abstract class $_IzinModel implements IzinModel {
  const factory $_IzinModel(
      {required String tanggal,
      required String keterangan,
      required DateTime? createdAt}) = _$$_IzinModel;

  factory $_IzinModel.fromJson(Map<String, dynamic> json) =
      _$$_IzinModel.fromJson;

  @override
  String get tanggal => throw _privateConstructorUsedError;
  @override
  String get keterangan => throw _privateConstructorUsedError;
  @override
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $$_IzinModelCopyWith<$_IzinModel> get copyWith =>
      throw _privateConstructorUsedError;
}
