// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responseApi_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$_ResponseApiModel _$_$$_ResponseApiModelFromJson(Map<String, dynamic> json) {
  return _$$_ResponseApiModel(
    error: json['error'] as bool,
    message: json['message'] as String,
    data: json['data'] as Map<String, dynamic>? ?? {},
  );
}

Map<String, dynamic> _$_$$_ResponseApiModelToJson(
        _$$_ResponseApiModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'data': instance.data,
    };
