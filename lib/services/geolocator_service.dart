import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeolocatorService {
  Future<Position> getLocation() async {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
  }

  double inRadius(LatLng position, LatLng pltuBarruPosition) {
    return Geolocator.distanceBetween(
      position.latitude,
      position.longitude,
      pltuBarruPosition.latitude,
      pltuBarruPosition.longitude,
    );
  }
}
