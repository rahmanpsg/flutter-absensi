// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'cuti_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CutiModel _$CutiModelFromJson(Map<String, dynamic> json) {
  return $_CutiModel.fromJson(json);
}

/// @nodoc
class _$CutiModelTearOff {
  const _$CutiModelTearOff();

  $_CutiModel call(
      {required String tanggal,
      required String keterangan,
      required bool? diterima}) {
    return $_CutiModel(
      tanggal: tanggal,
      keterangan: keterangan,
      diterima: diterima,
    );
  }

  CutiModel fromJson(Map<String, Object> json) {
    return CutiModel.fromJson(json);
  }
}

/// @nodoc
const $CutiModel = _$CutiModelTearOff();

/// @nodoc
mixin _$CutiModel {
  String get tanggal => throw _privateConstructorUsedError;
  String get keterangan => throw _privateConstructorUsedError;
  bool? get diterima => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CutiModelCopyWith<CutiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CutiModelCopyWith<$Res> {
  factory $CutiModelCopyWith(CutiModel value, $Res Function(CutiModel) then) =
      _$CutiModelCopyWithImpl<$Res>;
  $Res call({String tanggal, String keterangan, bool? diterima});
}

/// @nodoc
class _$CutiModelCopyWithImpl<$Res> implements $CutiModelCopyWith<$Res> {
  _$CutiModelCopyWithImpl(this._value, this._then);

  final CutiModel _value;
  // ignore: unused_field
  final $Res Function(CutiModel) _then;

  @override
  $Res call({
    Object? tanggal = freezed,
    Object? keterangan = freezed,
    Object? diterima = freezed,
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
      diterima: diterima == freezed
          ? _value.diterima
          : diterima // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class $$_CutiModelCopyWith<$Res> implements $CutiModelCopyWith<$Res> {
  factory $$_CutiModelCopyWith(
          $_CutiModel value, $Res Function($_CutiModel) then) =
      _$$_CutiModelCopyWithImpl<$Res>;
  @override
  $Res call({String tanggal, String keterangan, bool? diterima});
}

/// @nodoc
class _$$_CutiModelCopyWithImpl<$Res> extends _$CutiModelCopyWithImpl<$Res>
    implements $$_CutiModelCopyWith<$Res> {
  _$$_CutiModelCopyWithImpl(
      $_CutiModel _value, $Res Function($_CutiModel) _then)
      : super(_value, (v) => _then(v as $_CutiModel));

  @override
  $_CutiModel get _value => super._value as $_CutiModel;

  @override
  $Res call({
    Object? tanggal = freezed,
    Object? keterangan = freezed,
    Object? diterima = freezed,
  }) {
    return _then($_CutiModel(
      tanggal: tanggal == freezed
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      keterangan: keterangan == freezed
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String,
      diterima: diterima == freezed
          ? _value.diterima
          : diterima // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$_CutiModel implements $_CutiModel {
  const _$$_CutiModel(
      {required this.tanggal,
      required this.keterangan,
      required this.diterima});

  factory _$$_CutiModel.fromJson(Map<String, dynamic> json) =>
      _$_$$_CutiModelFromJson(json);

  @override
  final String tanggal;
  @override
  final String keterangan;
  @override
  final bool? diterima;

  @override
  String toString() {
    return 'CutiModel(tanggal: $tanggal, keterangan: $keterangan, diterima: $diterima)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is $_CutiModel &&
            (identical(other.tanggal, tanggal) ||
                const DeepCollectionEquality()
                    .equals(other.tanggal, tanggal)) &&
            (identical(other.keterangan, keterangan) ||
                const DeepCollectionEquality()
                    .equals(other.keterangan, keterangan)) &&
            (identical(other.diterima, diterima) ||
                const DeepCollectionEquality()
                    .equals(other.diterima, diterima)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tanggal) ^
      const DeepCollectionEquality().hash(keterangan) ^
      const DeepCollectionEquality().hash(diterima);

  @JsonKey(ignore: true)
  @override
  $$_CutiModelCopyWith<$_CutiModel> get copyWith =>
      _$$_CutiModelCopyWithImpl<$_CutiModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$$_CutiModelToJson(this);
  }
}

abstract class $_CutiModel implements CutiModel {
  const factory $_CutiModel(
      {required String tanggal,
      required String keterangan,
      required bool? diterima}) = _$$_CutiModel;

  factory $_CutiModel.fromJson(Map<String, dynamic> json) =
      _$$_CutiModel.fromJson;

  @override
  String get tanggal => throw _privateConstructorUsedError;
  @override
  String get keterangan => throw _privateConstructorUsedError;
  @override
  bool? get diterima => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $$_CutiModelCopyWith<$_CutiModel> get copyWith =>
      throw _privateConstructorUsedError;
}
