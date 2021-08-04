// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'geolocation_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeolocationModel _$GeolocationModelFromJson(Map<String, dynamic> json) {
  return $_GeolocationModel.fromJson(json);
}

/// @nodoc
class _$GeolocationModelTearOff {
  const _$GeolocationModelTearOff();

  $_GeolocationModel call(
      {required double latitude,
      required double longitude,
      required double radius}) {
    return $_GeolocationModel(
      latitude: latitude,
      longitude: longitude,
      radius: radius,
    );
  }

  GeolocationModel fromJson(Map<String, Object> json) {
    return GeolocationModel.fromJson(json);
  }
}

/// @nodoc
const $GeolocationModel = _$GeolocationModelTearOff();

/// @nodoc
mixin _$GeolocationModel {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get radius => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeolocationModelCopyWith<GeolocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeolocationModelCopyWith<$Res> {
  factory $GeolocationModelCopyWith(
          GeolocationModel value, $Res Function(GeolocationModel) then) =
      _$GeolocationModelCopyWithImpl<$Res>;
  $Res call({double latitude, double longitude, double radius});
}

/// @nodoc
class _$GeolocationModelCopyWithImpl<$Res>
    implements $GeolocationModelCopyWith<$Res> {
  _$GeolocationModelCopyWithImpl(this._value, this._then);

  final GeolocationModel _value;
  // ignore: unused_field
  final $Res Function(GeolocationModel) _then;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? radius = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      radius: radius == freezed
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class $$_GeolocationModelCopyWith<$Res>
    implements $GeolocationModelCopyWith<$Res> {
  factory $$_GeolocationModelCopyWith(
          $_GeolocationModel value, $Res Function($_GeolocationModel) then) =
      _$$_GeolocationModelCopyWithImpl<$Res>;
  @override
  $Res call({double latitude, double longitude, double radius});
}

/// @nodoc
class _$$_GeolocationModelCopyWithImpl<$Res>
    extends _$GeolocationModelCopyWithImpl<$Res>
    implements $$_GeolocationModelCopyWith<$Res> {
  _$$_GeolocationModelCopyWithImpl(
      $_GeolocationModel _value, $Res Function($_GeolocationModel) _then)
      : super(_value, (v) => _then(v as $_GeolocationModel));

  @override
  $_GeolocationModel get _value => super._value as $_GeolocationModel;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? radius = freezed,
  }) {
    return _then($_GeolocationModel(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      radius: radius == freezed
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$_GeolocationModel implements $_GeolocationModel {
  const _$$_GeolocationModel(
      {required this.latitude, required this.longitude, required this.radius});

  factory _$$_GeolocationModel.fromJson(Map<String, dynamic> json) =>
      _$_$$_GeolocationModelFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double radius;

  @override
  String toString() {
    return 'GeolocationModel(latitude: $latitude, longitude: $longitude, radius: $radius)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is $_GeolocationModel &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.radius, radius) ||
                const DeepCollectionEquality().equals(other.radius, radius)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(radius);

  @JsonKey(ignore: true)
  @override
  $$_GeolocationModelCopyWith<$_GeolocationModel> get copyWith =>
      _$$_GeolocationModelCopyWithImpl<$_GeolocationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$$_GeolocationModelToJson(this);
  }
}

abstract class $_GeolocationModel implements GeolocationModel {
  const factory $_GeolocationModel(
      {required double latitude,
      required double longitude,
      required double radius}) = _$$_GeolocationModel;

  factory $_GeolocationModel.fromJson(Map<String, dynamic> json) =
      _$$_GeolocationModel.fromJson;

  @override
  double get latitude => throw _privateConstructorUsedError;
  @override
  double get longitude => throw _privateConstructorUsedError;
  @override
  double get radius => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $$_GeolocationModelCopyWith<$_GeolocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
