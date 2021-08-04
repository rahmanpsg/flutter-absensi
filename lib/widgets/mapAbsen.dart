import 'dart:developer';

import 'package:absensi/bloc/geolocation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'buttonAbsen.dart';

class MapAbsen extends StatelessWidget {
  const MapAbsen({Key? key, required this.state}) : super(key: key);

  final state;

  @override
  Widget build(BuildContext context) {
    log(state.toString());
    return state is GeolocationLoading
        ? Center(child: CircularProgressIndicator())
        : state is GeolocationIsLoaded
            ? Stack(
                children: <Widget>[
                  GoogleMap(
                    mapType: MapType.hybrid,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        state.geolocation.latitude,
                        state.geolocation.longitude,
                      ),
                      zoom: 14.4746,
                    ),
                    circles: Set.from([state.circle]),
                    markers: Set.from([state.marker]),
                    zoomControlsEnabled: false,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ButtonAbsen(
                        absen: 'Absen Datang',
                        info:
                            "*Anda Berada di ${state.inRadius ? '' : 'Luar'} Lokasi Absen",
                        inRadius: state.inRadius,
                        callback: () {
                          context.read<GeolocationBloc>().add(
                              ChangePosition(LatLng(-3.720254, 119.630227)));
                        }),
                  )
                ],
              )
            : Center(
                child:
                    Text(state is GeolocationFailure ? state.message : 'Error'),
              );
  }
}
