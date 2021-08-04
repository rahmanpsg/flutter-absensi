// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geolocation_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$_GeolocationModel _$_$$_GeolocationModelFromJson(Map<String, dynamic> json) {
  return _$$_GeolocationModel(
    latitude: (json['latitude'] as num).toDouble(),
    longitude: (json['longitude'] as num).toDouble(),
    radius: (json['radius'] as num).toDouble(),
  );
}

Map<String, dynamic> _$_$$_GeolocationModelToJson(
        _$$_GeolocationModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'radius': instance.radius,
    };
