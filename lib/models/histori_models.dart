import 'package:freezed_annotation/freezed_annotation.dart';

part 'histori_models.freezed.dart';
part 'histori_models.g.dart';

@freezed
class HistoriModel with _$HistoriModel {
  const factory HistoriModel({
    required String tanggal,
    required String jamDatang,
    required String jamPulang,
    required String infoDatang,
    required String infoPulang,
  }) = $_HistoriModel;

  factory HistoriModel.fromJson(Map<String, dynamic> json) =>
      _$HistoriModelFromJson(json);
}
