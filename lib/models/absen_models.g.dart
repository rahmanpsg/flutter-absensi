// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absen_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$_AbsenModel _$_$$_AbsenModelFromJson(Map<String, dynamic> json) {
  return _$$_AbsenModel(
    hari: json['hari'] as int,
    tanggal: json['tanggal'] as String,
    jamDatang: json['jamDatang'] as String,
    jamPulang: json['jamPulang'] as String,
    infoAbsenDatang: json['infoAbsenDatang'] as String? ?? '',
    infoAbsenPulang: json['infoAbsenPulang'] as String? ?? '',
    lembur: json['lembur'] as bool,
    libur: json['libur'] as bool,
    izin: json['izin'] as bool? ?? false,
    cuti: json['cuti'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$$_AbsenModelToJson(_$$_AbsenModel instance) =>
    <String, dynamic>{
      'hari': instance.hari,
      'tanggal': instance.tanggal,
      'jamDatang': instance.jamDatang,
      'jamPulang': instance.jamPulang,
      'infoAbsenDatang': instance.infoAbsenDatang,
      'infoAbsenPulang': instance.infoAbsenPulang,
      'lembur': instance.lembur,
      'libur': instance.libur,
      'izin': instance.izin,
      'cuti': instance.cuti,
    };
