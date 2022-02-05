import 'dart:convert';
import 'dart:developer';

import 'package:absensi/app/api.dart';
import 'package:absensi/models/absen_models.dart';
import 'package:absensi/models/histori_models.dart';
import 'package:absensi/models/responseApi_models.dart';
import 'package:absensi/models/totalHistori_models.dart';
import 'package:absensi/services/geolocator_service.dart';
import 'package:background_fetch/background_fetch.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' show Client;
import 'authentication_service.dart';

class AbsenService {
  Client client = Client();

  GeolocatorService geolocatorService = GeolocatorService();

  Future<AbsenModel?> getAbsenRule() async {
    // await Future.delayed(Duration(milliseconds: 1500));
    try {
      final _header = await AuthenticationService().setHeaderToken(headers);
      final userID = await AuthenticationService().getUserID();

      final url = '$BASE_URL/rule';
      final getRule = client.get(Uri.parse(url), headers: _header);

      final urlAbsen = '$BASE_URL/absen/hari/$userID';
      final getAbsen = client.get(Uri.parse(urlAbsen), headers: _header);

      final response = await Future.wait([getRule, getAbsen]);

      Map<String, dynamic> absen = {};

      response.forEach((res) {
        final json = jsonDecode(res.body);
        absen.addAll(json);
      });

      if (absen.containsKey('error')) {
        return Future.error(absen['message']);
      }

      return new AbsenModel.fromJson(absen);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ResponseApiModel> setAbsen(String tipe) async {
    try {
      final _header = await AuthenticationService().setHeaderToken(headers);
      final userID = await AuthenticationService().getUserID();

      final url = '$BASE_URL/absen/$tipe/$userID';
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
      final userID = await AuthenticationService().getUserID();

      final queryParameters = {'bulan': bulan, 'tahun': tahun};

      final uri;

      if (BASE_URL.substring(0, BASE_URL.indexOf(":")) == "http") {
        uri = Uri.http(
          BASE_URL.replaceRange(0, 7, ''),
          '/absen/$userID',
          queryParameters,
        );
      } else {
        uri = Uri.https(
          BASE_URL.replaceRange(0, 8, ''),
          '/absen/$userID',
          queryParameters,
        );
      }

      final response = await client.get(
        uri,
        headers: _header,
      );

      final res = jsonDecode(response.body);

      final List<HistoriModel> historiList = List.generate(
        (res['historiList'] as List).length,
        (i) => HistoriModel.fromJson(res['historiList'][i]),
      );

      final TotalHistoriModel total = TotalHistoriModel.fromJson(res['total']);

      return {'historiList': historiList, 'total': total};
    } catch (e) {
      log(e.toString());
      return {
        'historiList': <HistoriModel>[],
        'total': TotalHistoriModel(),
      };
    }
  }

  Future<void> initBackgroundFetch() async {
    // Configure BackgroundFetch.
    int status = await BackgroundFetch.configure(
      BackgroundFetchConfig(
        minimumFetchInterval: 1,
        // forceAlarmManager: true,
        stopOnTerminate: false,
        enableHeadless: true,
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresStorageNotLow: false,
        requiresDeviceIdle: false,
        requiredNetworkType: NetworkType.ANY,
      ),
      onBackgroundFetch,
      _onBackgroundFetchTimeout,
    );

    print('[BackgroundFetch] configure success: $status');

    BackgroundFetch.scheduleTask(
      TaskConfig(
        taskId: "com.absensi",
        delay: 1000,
        periodic: true,
        forceAlarmManager: true,
        stopOnTerminate: false,
        enableHeadless: true,
        requiresNetworkConnectivity: true,
      ),
    );

    stopSchedule();
    // startSchedule();
  }

  void startSchedule() {
    BackgroundFetch.start().then((int status) {
      print('[BackgroundFetch] start success: $status');
    }).catchError((e) {
      print('[BackgroundFetch] start FAILURE: $e');
    });
  }

  void stopSchedule() {
    BackgroundFetch.stop().then((status) {
      print('[BackgroundFetch] stop success: $status');
    });
  }

  void onBackgroundFetch(String taskId) async {
    print("[BackgroundFetch] Event received: $taskId");

    DateTime now = DateTime.now();

    print('');
    print("----WAKTU----->" + now.toIso8601String());

    Position position = await geolocatorService.getDeviceLocation();

    print("----LOKASI----->" + position.toString());
    print('');

    ResponseApiModel res = await _setLokasi(position);

    print(res);
    print('');

    BackgroundFetch.finish(taskId);
  }

  void _onBackgroundFetchTimeout(String taskId) {
    print("[BackgroundFetch] TIMEOUT: $taskId");
    BackgroundFetch.finish(taskId);
  }

  Future<ResponseApiModel> _setLokasi(Position position) async {
    try {
      final _header = await AuthenticationService().setHeaderToken(headers);
      final userID = await AuthenticationService().getUserID();

      final url = '$BASE_URL/geolocation/$userID';
      final response = await client.post(
        Uri.parse(url),
        headers: _header,
        body: json.encode({
          'latitude': position.latitude,
          'longitude': position.longitude,
        }),
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
