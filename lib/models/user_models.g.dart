// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$_UserModel _$_$$_UserModelFromJson(Map<String, dynamic> json) {
  return _$$_UserModel(
    username: json['username'] as String,
    password: json['password'] as String,
    id: json['id'] as String?,
    nama: json['nama'] as String?,
    nik: json['nik'] as String?,
    image: json['image'] as String?,
    token: json['token'] as String?,
  );
}

Map<String, dynamic> _$_$$_UserModelToJson(_$$_UserModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'id': instance.id,
      'nama': instance.nama,
      'nik': instance.nik,
      'image': instance.image,
      'token': instance.token,
    };
