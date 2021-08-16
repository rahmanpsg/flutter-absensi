import 'dart:convert';

import 'package:absensi/app/api.dart';
import 'package:absensi/models/izin_models.dart';
import 'package:absensi/models/responseApi_models.dart';
import 'package:http/http.dart' show Client;

import 'authentication_service.dart';

class IzinService {
  Client client = Client();

  Future<List<IzinModel>?> getAllData() async {
    try {
      final _header = await AuthenticationService().setHeaderToken(headers);
      final userID = await AuthenticationService().getUserID();

      final url = '$BASE_URL/izin/$userID';
      final response = await client.get(Uri.parse(url), headers: _header);

      final res = jsonDecode(response.body);

      final List<IzinModel> list =
          List.generate(res.length, (index) => IzinModel.fromJson(res[index]));

      return list;
    } catch (e) {
      return null;
    }
  }

  Future<ResponseApiModel> addData(String keterangan) async {
    try {
      final _header = await AuthenticationService().setHeaderToken(headers);

      final url = '$BASE_URL/izin/';
      final response = await client.post(
        Uri.parse(url),
        headers: _header,
        body: jsonEncode(
          {'keterangan': keterangan},
        ),
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
