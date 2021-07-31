// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'histori_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoriModel _$HistoriModelFromJson(Map<String, dynamic> json) {
  return $_HistoriModel.fromJson(json);
}

/// @nodoc
class _$HistoriModelTearOff {
  const _$HistoriModelTearOff();

  $_HistoriModel call(
      {required String tanggal,
      required String jamDatang,
      required String jamPulang,
      required String infoDatang,
      required String infoPulang}) {
    return $_HistoriModel(
      tanggal: tanggal,
      jamDatang: jamDatang,
      jamPulang: jamPulang,
      infoDatang: infoDatang,
      infoPulang: infoPulang,
    );
  }

  HistoriModel fromJson(Map<String, Object> json) {
    return HistoriModel.fromJson(json);
  }
}

/// @nodoc
const $HistoriModel = _$HistoriModelTearOff();

/// @nodoc
mixin _$HistoriModel {
  String get tanggal => throw _privateConstructorUsedError;
  String get jamDatang => throw _privateConstructorUsedError;
  String get jamPulang => throw _privateConstructorUsedError;
  String get infoDatang => throw _privateConstructorUsedError;
  String get infoPulang => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoriModelCopyWith<HistoriModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoriModelCopyWith<$Res> {
  factory $HistoriModelCopyWith(
          HistoriModel value, $Res Function(HistoriModel) then) =
      _$HistoriModelCopyWithImpl<$Res>;
  $Res call(
      {String tanggal,
      String jamDatang,
      String jamPulang,
      String infoDatang,
      String infoPulang});
}

/// @nodoc
class _$HistoriModelCopyWithImpl<$Res> implements $HistoriModelCopyWith<$Res> {
  _$HistoriModelCopyWithImpl(this._value, this._then);

  final HistoriModel _value;
  // ignore: unused_field
  final $Res Function(HistoriModel) _then;

  @override
  $Res call({
    Object? tanggal = freezed,
    Object? jamDatang = freezed,
    Object? jamPulang = freezed,
    Object? infoDatang = freezed,
    Object? infoPulang = freezed,
  }) {
    return _then(_value.copyWith(
      tanggal: tanggal == freezed
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      jamDatang: jamDatang == freezed
          ? _value.jamDatang
          : jamDatang // ignore: cast_nullable_to_non_nullable
              as String,
      jamPulang: jamPulang == freezed
          ? _value.jamPulang
          : jamPulang // ignore: cast_nullable_to_non_nullable
              as String,
      infoDatang: infoDatang == freezed
          ? _value.infoDatang
          : infoDatang // ignore: cast_nullable_to_non_nullable
              as String,
      infoPulang: infoPulang == freezed
          ? _value.infoPulang
          : infoPulang // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $$_HistoriModelCopyWith<$Res>
    implements $HistoriModelCopyWith<$Res> {
  factory $$_HistoriModelCopyWith(
          $_HistoriModel value, $Res Function($_HistoriModel) then) =
      _$$_HistoriModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String tanggal,
      String jamDatang,
      String jamPulang,
      String infoDatang,
      String infoPulang});
}

/// @nodoc
class _$$_HistoriModelCopyWithImpl<$Res>
    extends _$HistoriModelCopyWithImpl<$Res>
    implements $$_HistoriModelCopyWith<$Res> {
  _$$_HistoriModelCopyWithImpl(
      $_HistoriModel _value, $Res Function($_HistoriModel) _then)
      : super(_value, (v) => _then(v as $_HistoriModel));

  @override
  $_HistoriModel get _value => super._value as $_HistoriModel;

  @override
  $Res call({
    Object? tanggal = freezed,
    Object? jamDatang = freezed,
    Object? jamPulang = freezed,
    Object? infoDatang = freezed,
    Object? infoPulang = freezed,
  }) {
    return _then($_HistoriModel(
      tanggal: tanggal == freezed
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      jamDatang: jamDatang == freezed
          ? _value.jamDatang
          : jamDatang // ignore: cast_nullable_to_non_nullable
              as String,
      jamPulang: jamPulang == freezed
          ? _value.jamPulang
          : jamPulang // ignore: cast_nullable_to_non_nullable
              as String,
      infoDatang: infoDatang == freezed
          ? _value.infoDatang
          : infoDatang // ignore: cast_nullable_to_non_nullable
              as String,
      infoPulang: infoPulang == freezed
          ? _value.infoPulang
          : infoPulang // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$_HistoriModel implements $_HistoriModel {
  const _$$_HistoriModel(
      {required this.tanggal,
      required this.jamDatang,
      required this.jamPulang,
      required this.infoDatang,
      required this.infoPulang});

  factory _$$_HistoriModel.fromJson(Map<String, dynamic> json) =>
      _$_$$_HistoriModelFromJson(json);

  @override
  final String tanggal;
  @override
  final String jamDatang;
  @override
  final String jamPulang;
  @override
  final String infoDatang;
  @override
  final String infoPulang;

  @override
  String toString() {
    return 'HistoriModel(tanggal: $tanggal, jamDatang: $jamDatang, jamPulang: $jamPulang, infoDatang: $infoDatang, infoPulang: $infoPulang)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is $_HistoriModel &&
            (identical(other.tanggal, tanggal) ||
                const DeepCollectionEquality()
                    .equals(other.tanggal, tanggal)) &&
            (identical(other.jamDatang, jamDatang) ||
                const DeepCollectionEquality()
                    .equals(other.jamDatang, jamDatang)) &&
            (identical(other.jamPulang, jamPulang) ||
                const DeepCollectionEquality()
                    .equals(other.jamPulang, jamPulang)) &&
            (identical(other.infoDatang, infoDatang) ||
                const DeepCollectionEquality()
                    .equals(other.infoDatang, infoDatang)) &&
            (identical(other.infoPulang, infoPulang) ||
                const DeepCollectionEquality()
                    .equals(other.infoPulang, infoPulang)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(tanggal) ^
      const DeepCollectionEquality().hash(jamDatang) ^
      const DeepCollectionEquality().hash(jamPulang) ^
      const DeepCollectionEquality().hash(infoDatang) ^
      const DeepCollectionEquality().hash(infoPulang);

  @JsonKey(ignore: true)
  @override
  $$_HistoriModelCopyWith<$_HistoriModel> get copyWith =>
      _$$_HistoriModelCopyWithImpl<$_HistoriModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$$_HistoriModelToJson(this);
  }
}

abstract class $_HistoriModel implements HistoriModel {
  const factory $_HistoriModel(
      {required String tanggal,
      required String jamDatang,
      required String jamPulang,
      required String infoDatang,
      required String infoPulang}) = _$$_HistoriModel;

  factory $_HistoriModel.fromJson(Map<String, dynamic> json) =
      _$$_HistoriModel.fromJson;

  @override
  String get tanggal => throw _privateConstructorUsedError;
  @override
  String get jamDatang => throw _privateConstructorUsedError;
  @override
  String get jamPulang => throw _privateConstructorUsedError;
  @override
  String get infoDatang => throw _privateConstructorUsedError;
  @override
  String get infoPulang => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $$_HistoriModelCopyWith<$_HistoriModel> get copyWith =>
      throw _privateConstructorUsedError;
}
