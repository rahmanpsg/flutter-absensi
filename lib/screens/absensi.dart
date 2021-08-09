import 'dart:async';

import 'package:absensi/bloc/geolocation_bloc.dart';
import 'package:absensi/services/geolocator_service.dart';
import 'package:absensi/styles/constant.dart';
import 'package:absensi/widgets/mapAbsen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AbsensiScreen extends StatelessWidget {
  const AbsensiScreen({Key? key, required this.absen}) : super(key: key);

  final String absen;

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> _controller = Completer();

    return BlocBuilder<GeolocationBloc, GeolocationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Lokasi Anda',
              style: primaryStyle.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.location_searching,
                  color: Colors.white,
                ),
                onPressed: () async {
                  final geoDevice =
                      await GeolocatorService().getDeviceLocation();

                  await GeolocatorService().toMyPosition(
                    LatLng(geoDevice.latitude, geoDevice.longitude),
                    _controller,
                  );

                  final double _distance = GeolocatorService().inRadius(
                      state.geolocation,
                      LatLng(geoDevice.latitude, geoDevice.longitude));

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Anda berada ${(_distance / 1000).round()} KM dari lokasi absen"),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                onPressed: () async {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Memperbaharui lokasi anda'),
                    ),
                  );

                  final geoDevice =
                      await GeolocatorService().getDeviceLocation();
                  context.read<GeolocationBloc>().add(ChangePosition(
                      LatLng(geoDevice.latitude, geoDevice.longitude)));
                  // LatLng(-3.9843736145260973, 119.65054606109925)));
                },
              )
            ],
          ),
          body: MapAbsen(
            absen: absen,
            state: state,
            controller: _controller,
          ),
        );
      },
    );
  }
}
