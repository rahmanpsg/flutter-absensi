import 'package:freezed_annotation/freezed_annotation.dart';

part 'cuti_models.freezed.dart';
part 'cuti_models.g.dart';

@freezed
class CutiModel with _$CutiModel {
  const factory CutiModel({
    required String tanggal,
    required String keterangan,
    required bool? diterima,
  }) = $_CutiModel;

  factory CutiModel.fromJson(Map<String, dynamic> json) =>
      _$CutiModelFromJson(json);
}
