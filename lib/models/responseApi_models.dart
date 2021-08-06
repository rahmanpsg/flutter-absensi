import 'package:freezed_annotation/freezed_annotation.dart';

part 'responseApi_models.freezed.dart';
part 'responseApi_models.g.dart';

@freezed
class ResponseApiModel with _$ResponseApiModel {
  const factory ResponseApiModel({
    required bool error,
    required String message,
  }) = $_ResponseApiModel;

  factory ResponseApiModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseApiModelFromJson(json);
}
