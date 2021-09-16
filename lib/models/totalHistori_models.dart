import 'package:freezed_annotation/freezed_annotation.dart';

part 'totalHistori_models.freezed.dart';
part 'totalHistori_models.g.dart';

@freezed
class TotalHistoriModel with _$TotalHistoriModel {
  const factory TotalHistoriModel({
    @Default(0) int hadir,
    @Default(0) int alpa,
    @Default(0) int izin,
    @Default(0) int cuti,
  }) = $_TotalHistoriModel;

  factory TotalHistoriModel.fromJson(Map<String, dynamic> json) =>
      _$TotalHistoriModelFromJson(json);
}
