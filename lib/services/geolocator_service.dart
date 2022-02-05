import 'dart:async';
import 'dart:convert';
import 'package:absensi/app/api.dart';
import 'package:absensi/models/geolocation_models.dart';
import 'package:absensi/services/authentication_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' show Client;

class GeolocatorService {
  Client client = Client();

  Future<GeolocationModel?> getGeolocation() async {
    try {
      final _header = await AuthenticationService().setHeaderToken(headers);

      final url = '$BASE_URL/geolocation';
      final response = await client.get(Uri.parse(url), headers: _header);

      final res = jsonDecode(response.body);

      return new GeolocationModel.fromJson(res);
    } catch (e) {
      return null;
    }
  }

  Future<LocationPermission> getPermission() async {
    await Geolocator.requestPermission();

    LocationPermission permission = await Geolocator.checkPermission();

    print(permission != LocationPermission.always);

    if (permission != LocationPermission.always)
      return Future.error(
          'Untuk dapat menggunakan aplikasi, akses lokasi dibutuhkan untuk selalu berjalan...');

    return permission;
  }

  Future<Position> getDeviceLocation() async {
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
      );
    } catch (e) {
      print(e);
      return Future.error('Aktifkan akses lokasi');
    }
  }

  Future toMyPosition(
    LatLng position,
    Completer<GoogleMapController> _controller,
  ) async {
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: position,
          zoom: 14.4746,
        ),
      ),
    );
  }

  double inRadius(GeolocationModel kantorPosition, LatLng devicePosition) {
    return Geolocator.distanceBetween(
      devicePosition.latitude,
      devicePosition.longitude,
      kantorPosition.latitude,
      kantorPosition.longitude,
    );
  }
}
