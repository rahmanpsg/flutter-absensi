// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return $_UserModel.fromJson(json);
}

/// @nodoc
class _$UserModelTearOff {
  const _$UserModelTearOff();

  $_UserModel call(
      {required String username,
      required String password,
      String? id,
      String? nama,
      String? nik,
      String? image,
      String? token}) {
    return $_UserModel(
      username: username,
      password: password,
      id: id,
      nama: nama,
      nik: nik,
      image: image,
      token: token,
    );
  }

  UserModel fromJson(Map<String, Object> json) {
    return UserModel.fromJson(json);
  }
}

/// @nodoc
const $UserModel = _$UserModelTearOff();

/// @nodoc
mixin _$UserModel {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get nama => throw _privateConstructorUsedError;
  String? get nik => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {String username,
      String password,
      String? id,
      String? nama,
      String? nik,
      String? image,
      String? token});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  final UserModel _value;
  // ignore: unused_field
  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
    Object? id = freezed,
    Object? nama = freezed,
    Object? nik = freezed,
    Object? image = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nama: nama == freezed
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      nik: nik == freezed
          ? _value.nik
          : nik // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class $$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory $$_UserModelCopyWith(
          $_UserModel value, $Res Function($_UserModel) then) =
      _$$_UserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String username,
      String password,
      String? id,
      String? nama,
      String? nik,
      String? image,
      String? token});
}

/// @nodoc
class _$$_UserModelCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements $$_UserModelCopyWith<$Res> {
  _$$_UserModelCopyWithImpl(
      $_UserModel _value, $Res Function($_UserModel) _then)
      : super(_value, (v) => _then(v as $_UserModel));

  @override
  $_UserModel get _value => super._value as $_UserModel;

  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
    Object? id = freezed,
    Object? nama = freezed,
    Object? nik = freezed,
    Object? image = freezed,
    Object? token = freezed,
  }) {
    return _then($_UserModel(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nama: nama == freezed
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      nik: nik == freezed
          ? _value.nik
          : nik // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$_UserModel implements $_UserModel {
  const _$$_UserModel(
      {required this.username,
      required this.password,
      this.id,
      this.nama,
      this.nik,
      this.image,
      this.token});

  factory _$$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$_$$_UserModelFromJson(json);

  @override
  final String username;
  @override
  final String password;
  @override
  final String? id;
  @override
  final String? nama;
  @override
  final String? nik;
  @override
  final String? image;
  @override
  final String? token;

  @override
  String toString() {
    return 'UserModel(username: $username, password: $password, id: $id, nama: $nama, nik: $nik, image: $image, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is $_UserModel &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.nama, nama) ||
                const DeepCollectionEquality().equals(other.nama, nama)) &&
            (identical(other.nik, nik) ||
                const DeepCollectionEquality().equals(other.nik, nik)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(nama) ^
      const DeepCollectionEquality().hash(nik) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(token);

  @JsonKey(ignore: true)
  @override
  $$_UserModelCopyWith<$_UserModel> get copyWith =>
      _$$_UserModelCopyWithImpl<$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$$_UserModelToJson(this);
  }
}

abstract class $_UserModel implements UserModel {
  const factory $_UserModel(
      {required String username,
      required String password,
      String? id,
      String? nama,
      String? nik,
      String? image,
      String? token}) = _$$_UserModel;

  factory $_UserModel.fromJson(Map<String, dynamic> json) =
      _$$_UserModel.fromJson;

  @override
  String get username => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get nama => throw _privateConstructorUsedError;
  @override
  String? get nik => throw _privateConstructorUsedError;
  @override
  String? get image => throw _privateConstructorUsedError;
  @override
  String? get token => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $$_UserModelCopyWith<$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
