// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'histori_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$_HistoriModel _$_$$_HistoriModelFromJson(Map<String, dynamic> json) {
  return _$$_HistoriModel(
    tanggal: json['tanggal'] as String,
    status: json['status'] as String,
    waktuDatang: json['waktuDatang'] as String,
    waktuPulang: json['waktuPulang'] as String,
    infoAbsenDatang: json['infoAbsenDatang'] as String,
    infoAbsenPulang: json['infoAbsenPulang'] as String,
  );
}

Map<String, dynamic> _$_$$_HistoriModelToJson(_$$_HistoriModel instance) =>
    <String, dynamic>{
      'tanggal': instance.tanggal,
      'status': instance.status,
      'waktuDatang': instance.waktuDatang,
      'waktuPulang': instance.waktuPulang,
      'infoAbsenDatang': instance.infoAbsenDatang,
      'infoAbsenPulang': instance.infoAbsenPulang,
    };
