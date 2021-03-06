import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_models.freezed.dart';
part 'user_models.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String username,
    required String password,
    String? id,
    String? nama,
    String? nik,
    String? image,
    String? token,
  }) = $_UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
