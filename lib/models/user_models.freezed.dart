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

  $_UserModel call({required String username, required String password}) {
    return $_UserModel(
      username: username,
      password: password,
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call({String username, String password});
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
    ));
  }
}

/// @nodoc
abstract class $$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory $$_UserModelCopyWith(
          $_UserModel value, $Res Function($_UserModel) then) =
      _$$_UserModelCopyWithImpl<$Res>;
  @override
  $Res call({String username, String password});
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$_UserModel implements $_UserModel {
  const _$$_UserModel({required this.username, required this.password});

  factory _$$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$_$$_UserModelFromJson(json);

  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'UserModel(username: $username, password: $password)';
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
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password);

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
      {required String username, required String password}) = _$$_UserModel;

  factory $_UserModel.fromJson(Map<String, dynamic> json) =
      _$$_UserModel.fromJson;

  @override
  String get username => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $$_UserModelCopyWith<$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
