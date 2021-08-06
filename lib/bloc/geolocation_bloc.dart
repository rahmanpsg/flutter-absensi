import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:absensi/models/geolocation_models.dart';
import 'package:absensi/services/geolocator_service.dart';
import 'package:absensi/styles/constant.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  GeolocationBloc(this._geolocatorService) : super(GeolocationInital());

  final GeolocatorService _geolocatorService;

  @override
  Stream<GeolocationState> mapEventToState(
    GeolocationEvent event,
  ) async* {
    log(event.toString());
    if (event is GeolocationLoaded) {
      yield* _mapLoadData(event, state);
    } else if (event is ChangePosition) {
      yield _mapChangePosition(event, state);
    }
  }

  Stream<GeolocationState> _mapLoadData(
    GeolocationLoaded event,
    GeolocationState state,
  ) async* {
    try {
      yield GeolocationLoading();

      final geoKantor = await _geolocatorService.getGeolocation();
      final geoDevice = await _geolocatorService.getDeviceLocation();

      if (geoKantor != null) {
        Circle circle = createCircle(
            LatLng(geoKantor.latitude, geoKantor.longitude), geoKantor.radius);

        Marker marker =
            createMarker(LatLng(geoDevice.latitude, geoDevice.longitude));

        final bool inRadius = _geolocatorService.inRadius(
                geoKantor, LatLng(geoDevice.latitude, geoDevice.longitude)) <
            geoKantor.radius;

        yield GeolocationIsLoaded(
          geolocation: geoKantor,
          circle: circle,
          marker: marker,
          inRadius: inRadius,
        );
      } else {
        yield GeolocationFailure(message: 'Tidak dapat terhubung ke server');
      }
    } catch (e) {
      yield GeolocationFailure(message: 'Terjadi masalah yang tidak diketahui');
    }
  }

  GeolocationState _mapChangePosition(
      ChangePosition event, GeolocationState state) {
    final bool inRadius =
        _geolocatorService.inRadius(state.geolocation, event.position) <
            state.geolocation.radius;

    return GeolocationIsLoaded(
      geolocation: state.geolocation,
      circle: state.circle,
      marker: createMarker(event.position),
      inRadius: inRadius,
    );
  }

  Circle createCircle(LatLng point, double radius) {
    return Circle(
      circleId: CircleId('kantor'),
      center: point,
      radius: radius,
      fillColor: Color(0xff2271cce7),
      strokeColor: primaryColor,
      strokeWidth: 3,
    );
  }

  Marker createMarker(LatLng point) {
    return Marker(
      markerId: MarkerId('myPosition'),
      position: point,
      infoWindow: InfoWindow(
        title: 'Lokasi Anda',
        snippet: '${point.latitude}, ${point.longitude}',
      ),
    );
  }
}
