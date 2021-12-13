import 'package:freezed_annotation/freezed_annotation.dart';

part 'absen_models.freezed.dart';
part 'absen_models.g.dart';

@freezed
class AbsenModel with _$AbsenModel {
  const factory AbsenModel({
    required int hari,
    required String tanggal,
    required String jamDatang,
    required String jamPulang,
    @Default("") String waktuDatang,
    @Default("") String waktuPulang,
    @Default("") String infoAbsenDatang,
    @Default("") String infoAbsenPulang,
    required bool lembur,
    required bool libur,
    @Default(false) bool izin,
    @Default(false) bool cuti,
  }) = $_AbsenModel;

  factory AbsenModel.fromJson(Map<String, dynamic> json) =>
      _$AbsenModelFromJson(json);
}
