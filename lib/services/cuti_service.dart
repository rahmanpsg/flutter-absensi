import 'dart:convert';

import 'package:absensi/app/api.dart';
import 'package:absensi/models/cuti_models.dart';
import 'package:absensi/models/responseApi_models.dart';
import 'package:http/http.dart' show Client;

import 'authentication_service.dart';

class CutiService {
  Client client = Client();

  Future<List<CutiModel>?> getAllData() async {
    try {
      final _header = await AuthenticationService().setHeaderToken(headers);
      final userID = await AuthenticationService().getUserID();

      final url = '$BASE_URL/cuti/$userID';
      final response = await client.get(Uri.parse(url), headers: _header);

      final res = jsonDecode(response.body);

      final List<CutiModel> list =
          List.generate(res.length, (index) => CutiModel.fromJson(res[index]));

      return list;
    } catch (e) {
      return null;
    }
  }

  Future<ResponseApiModel> addData(CutiModel cuti) async {
    try {
      final _header = await AuthenticationService().setHeaderToken(headers);

      final url = '$BASE_URL/cuti/';
      final response = await client.post(
        Uri.parse(url),
        headers: _header,
        body: jsonEncode(cuti),
      );

      final res = jsonDecode(response.body);

      if (response.statusCode != 200) {
        return ResponseApiModel.fromJson(res);
      }

      return ResponseApiModel.fromJson(res);
    } catch (e) {
      return ResponseApiModel(
        error: true,
        message: 'Terjadi masalah yang tidak diketahui',
      );
    }
  }
}
