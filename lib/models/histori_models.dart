import 'package:freezed_annotation/freezed_annotation.dart';

part 'histori_models.freezed.dart';
part 'histori_models.g.dart';

@freezed
class HistoriModel with _$HistoriModel {
  const factory HistoriModel({
    required String tanggal,
    required String status,
    required String waktuDatang,
    required String waktuPulang,
    required String infoAbsenDatang,
    required String infoAbsenPulang,
  }) = $_HistoriModel;

  factory HistoriModel.fromJson(Map<String, dynamic> json) =>
      _$HistoriModelFromJson(json);
}
