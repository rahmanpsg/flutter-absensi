import 'package:freezed_annotation/freezed_annotation.dart';

part 'geolocation_models.freezed.dart';
part 'geolocation_models.g.dart';

@freezed
class GeolocationModel with _$GeolocationModel {
  const factory GeolocationModel({
    required double latitude,
    required double longitude,
    required double radius,
  }) = $_GeolocationModel;

  factory GeolocationModel.fromJson(Map<String, dynamic> json) =>
      _$GeolocationModelFromJson(json);
}
