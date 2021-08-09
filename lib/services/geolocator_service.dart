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

  Future<Position> getDeviceLocation() async {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
    );
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
