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
                      // LatLng(geoDevice.latitude, geoDevice.longitude)));
                      LatLng(-3.720254, 119.630227)));
                },
              )
            ],
          ),
          body: MapAbsen(
            absen: absen,
            state: state,
          ),
        );
      },
    );
  }
}
