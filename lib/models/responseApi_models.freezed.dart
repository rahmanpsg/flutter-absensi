// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'responseApi_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResponseApiModel _$ResponseApiModelFromJson(Map<String, dynamic> json) {
  return $_ResponseApiModel.fromJson(json);
}

/// @nodoc
class _$ResponseApiModelTearOff {
  const _$ResponseApiModelTearOff();

  $_ResponseApiModel call(
      {required bool error,
      required String message,
      Map<String, dynamic> data = const {}}) {
    return $_ResponseApiModel(
      error: error,
      message: message,
      data: data,
    );
  }

  ResponseApiModel fromJson(Map<String, Object> json) {
    return ResponseApiModel.fromJson(json);
  }
}

/// @nodoc
const $ResponseApiModel = _$ResponseApiModelTearOff();

/// @nodoc
mixin _$ResponseApiModel {
  bool get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Map<String, dynamic> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseApiModelCopyWith<ResponseApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseApiModelCopyWith<$Res> {
  factory $ResponseApiModelCopyWith(
          ResponseApiModel value, $Res Function(ResponseApiModel) then) =
      _$ResponseApiModelCopyWithImpl<$Res>;
  $Res call({bool error, String message, Map<String, dynamic> data});
}

/// @nodoc
class _$ResponseApiModelCopyWithImpl<$Res>
    implements $ResponseApiModelCopyWith<$Res> {
  _$ResponseApiModelCopyWithImpl(this._value, this._then);

  final ResponseApiModel _value;
  // ignore: unused_field
  final $Res Function(ResponseApiModel) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
abstract class $$_ResponseApiModelCopyWith<$Res>
    implements $ResponseApiModelCopyWith<$Res> {
  factory $$_ResponseApiModelCopyWith(
          $_ResponseApiModel value, $Res Function($_ResponseApiModel) then) =
      _$$_ResponseApiModelCopyWithImpl<$Res>;
  @override
  $Res call({bool error, String message, Map<String, dynamic> data});
}

/// @nodoc
class _$$_ResponseApiModelCopyWithImpl<$Res>
    extends _$ResponseApiModelCopyWithImpl<$Res>
    implements $$_ResponseApiModelCopyWith<$Res> {
  _$$_ResponseApiModelCopyWithImpl(
      $_ResponseApiModel _value, $Res Function($_ResponseApiModel) _then)
      : super(_value, (v) => _then(v as $_ResponseApiModel));

  @override
  $_ResponseApiModel get _value => super._value as $_ResponseApiModel;

  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then($_ResponseApiModel(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$_ResponseApiModel implements $_ResponseApiModel {
  const _$$_ResponseApiModel(
      {required this.error, required this.message, this.data = const {}});

  factory _$$_ResponseApiModel.fromJson(Map<String, dynamic> json) =>
      _$_$$_ResponseApiModelFromJson(json);

  @override
  final bool error;
  @override
  final String message;
  @JsonKey(defaultValue: const {})
  @override
  final Map<String, dynamic> data;

  @override
  String toString() {
    return 'ResponseApiModel(error: $error, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is $_ResponseApiModel &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  $$_ResponseApiModelCopyWith<$_ResponseApiModel> get copyWith =>
      _$$_ResponseApiModelCopyWithImpl<$_ResponseApiModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$$_ResponseApiModelToJson(this);
  }
}

abstract class $_ResponseApiModel implements ResponseApiModel {
  const factory $_ResponseApiModel(
      {required bool error,
      required String message,
      Map<String, dynamic> data}) = _$$_ResponseApiModel;

  factory $_ResponseApiModel.fromJson(Map<String, dynamic> json) =
      _$$_ResponseApiModel.fromJson;

  @override
  bool get error => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $$_ResponseApiModelCopyWith<$_ResponseApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}
