import 'dart:convert';
import 'dart:developer';

import 'package:absensi/app/api.dart';
import 'package:absensi/models/absen_models.dart';
import 'package:absensi/models/histori_models.dart';
import 'package:absensi/models/responseApi_models.dart';
import 'package:http/http.dart' show Client;
import 'authentication_service.dart';

class AbsenService {
  Client client = Client();

  Future<AbsenModel?> getAbsenRule() async {
    // await Future.delayed(Duration(milliseconds: 1500));
    try {
      final _header = await AuthenticationService().setHeaderToken(headers);
      final user = await AuthenticationService().getCurrentUser();

      final url = '$BASE_URL/rule';
      final response = await client.get(Uri.parse(url), headers: _header);

      final urlAbsen = '$BASE_URL/absen/hari/${user!.id}';
      final responseAbsen =
          await client.get(Uri.parse(urlAbsen), headers: _header);

      final res = jsonDecode(response.body);
      final resAbsen = jsonDecode(responseAbsen.body);

      res['tanggal'] = resAbsen['tanggal'];
      res['infoAbsenDatang'] = resAbsen['infoAbsenDatang'];
      res['infoAbsenPulang'] = resAbsen['infoAbsenPulang'] ?? '';

      return new AbsenModel.fromJson(res);
    } catch (e) {
      return null;
    }
  }

  Future<ResponseApiModel> setAbsen(String tipe) async {
    try {
      final _header = await AuthenticationService().setHeaderToken(headers);
      final user = await AuthenticationService().getCurrentUser();

      final url = '$BASE_URL/absen/$tipe/${user!.id}';
      final response = await client.post(Uri.parse(url), headers: _header);

      final res = jsonDecode(response.body);

      log(res.toString());

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

  Future getAbsenHistori(String bulan, String tahun) async {
    try {
      final _header = await AuthenticationService().setHeaderToken(headers);
      final user = await AuthenticationService().getCurrentUser();

      final queryParameters = {'bulan': bulan, 'tahun': tahun};

      final uri = Uri.https(
        BASE_URL.replaceRange(0, 8, ''),
        '/absen/${user!.id}',
        queryParameters,
      );

      final response = await client.get(
        uri,
        headers: _header,
      );

      final res = jsonDecode(response.body);

      if (res != null) {
        final List<HistoriModel> historiList = List.generate(
          (res as List).length,
          (i) => HistoriModel.fromJson(res[i]),
        );

        return historiList;
      } else {
        return <HistoriModel>[];
      }
    } catch (e) {
      log(e.toString());
      return ResponseApiModel(
        error: true,
        message: 'Terjadi masalah yang tidak diketahui',
      );
    }
  }
}
