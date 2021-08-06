import 'dart:developer';

import 'package:absensi/bloc/absen_bloc.dart';
import 'package:absensi/bloc/geolocation_bloc.dart';
import 'package:absensi/models/responseApi_models.dart';
import 'package:absensi/services/absen_service.dart';
import 'package:absensi/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';

import 'buttonAbsen.dart';
import 'modalAbsen.dart';

class MapAbsen extends StatelessWidget {
  const MapAbsen({
    Key? key,
    required this.absen,
    required this.state,
  }) : super(key: key);

  final String absen;
  final state;

  @override
  Widget build(BuildContext context) {
    final absenBloc = BlocProvider.of<AbsenBloc>(context);

    log(state.toString());
    return state is GeolocationLoading
        ? Center(child: Lottie.asset('assets/animations/loading.json'))
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
                        absen: 'Absen $absen',
                        info:
                            "*Anda Berada di ${state.inRadius ? '' : 'Luar '}Lokasi Absen",
                        inRadius: state.inRadius,
                        callback: () async {
                          bool isAuthenticated = await AuthenticationService
                              .authenticateWithBiometrics();

                          if (isAuthenticated) {
                            ResponseApiModel res =
                                await AbsenService().setAbsen(absen);

                            modalBottomSheetAbsen(context, absen, res, () {
                              Navigator.of(context).pop();
                              if (!res.error) absenBloc.add(AbsenLoaded());
                            });
                          }
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
