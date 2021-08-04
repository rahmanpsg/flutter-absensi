import 'dart:convert';
import 'package:absensi/app/api.dart';
import 'package:absensi/models/geolocation_models.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' show Client;

class GeolocatorService {
  Client client = Client();

  Future<GeolocationModel?> getGeolocation() async {
    await Future.delayed(Duration(milliseconds: 1500));
    try {
      final url = '$BASE_URL/geolocation';
      final response = await client.get(Uri.parse(url));

      final res = jsonDecode(response.body);

      return new GeolocationModel.fromJson(res);
    } catch (e) {
      return null;
    }
  }

  Future<Position> getDeviceLocation() async {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
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
