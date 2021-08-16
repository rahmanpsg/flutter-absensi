// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'izin_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$_IzinModel _$_$$_IzinModelFromJson(Map<String, dynamic> json) {
  return _$$_IzinModel(
    tanggal: json['tanggal'] as String,
    keterangan: json['keterangan'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
  );
}

Map<String, dynamic> _$_$$_IzinModelToJson(_$$_IzinModel instance) =>
    <String, dynamic>{
      'tanggal': instance.tanggal,
      'keterangan': instance.keterangan,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
