import 'package:freezed_annotation/freezed_annotation.dart';

part 'izin_models.freezed.dart';
part 'izin_models.g.dart';

@freezed
class IzinModel with _$IzinModel {
  const factory IzinModel({
    required String tanggal,
    required String keterangan,
    required DateTime? createdAt,
  }) = $_IzinModel;

  factory IzinModel.fromJson(Map<String, dynamic> json) =>
      _$IzinModelFromJson(json);
}
