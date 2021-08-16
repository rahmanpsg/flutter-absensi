// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cuti_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$_CutiModel _$_$$_CutiModelFromJson(Map<String, dynamic> json) {
  return _$$_CutiModel(
    tanggal: json['tanggal'] as String,
    keterangan: json['keterangan'] as String,
    diterima: json['diterima'] as bool?,
  );
}

Map<String, dynamic> _$_$$_CutiModelToJson(_$$_CutiModel instance) =>
    <String, dynamic>{
      'tanggal': instance.tanggal,
      'keterangan': instance.keterangan,
      'diterima': instance.diterima,
    };
