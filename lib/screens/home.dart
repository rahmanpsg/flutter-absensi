import 'package:absensi/bloc/absen_bloc.dart';
import 'package:absensi/bloc/authentication_bloc.dart';
import 'package:absensi/bloc/cuti_bloc.dart';
import 'package:absensi/bloc/geolocation_bloc.dart';
import 'package:absensi/bloc/histori_bloc.dart';
import 'package:absensi/bloc/izin_bloc.dart';
import 'package:absensi/bloc/login_bloc.dart';
import 'package:absensi/models/absen_models.dart';
import 'package:absensi/models/responseApi_models.dart';
import 'package:absensi/services/geolocator_service.dart';
import 'package:absensi/styles/constant.dart';
import 'package:absensi/widgets/headerHome.dart';
import 'package:absensi/widgets/infoAbsen.dart';
import 'package:absensi/widgets/modalAbsen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authBloc = BlocProvider.of<AuthenticationBloc>(context);
    final _absenBloc = BlocProvider.of<AbsenBloc>(context);

    RefreshController _refreshController =
        RefreshController(initialRefresh: false);

    int popped = 0;

    return BlocListener<AbsenBloc, AbsenState>(
      listener: (context, state) {
        if (state is AbsenFailure) {
          print(state.message.split(' ')[0]);
          if (state.message.split(' ')[0] == 'Token') {
            BlocProvider.of<LoginBloc>(context).add(LoginUnauthorized());
            _authBloc.add(UserLoggedOut());
            Navigator.of(context).pushReplacementNamed('/login');
          }
        }
      },
      child: WillPopScope(
        onWillPop: () async {
          DateTime initTime = DateTime.now();
          popped += 1;
          if (popped >= 2) return true;
          await ScaffoldMessenger.of(context)
              .showSnackBar(
                SnackBar(
                  content: Text('Tekan sekali lagi untuk keluar'),
                  duration: const Duration(seconds: 2),
                ),
              )
              .closed;

          if (DateTime.now().difference(initTime) >= Duration(seconds: 2)) {
            popped = 0;
          }
          return false;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Text(
              'Absensi',
              style: primaryStyle.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: <Widget>[
              PopupMenuButton(
                icon: Icon(Icons.more_vert),
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text("Tentang"),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: primaryColor,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text("Logout")
                      ],
                    ),
                  ),
                ],
                onSelected: (item) {
                  switch (item) {
                    case 0:
                      Navigator.of(context).pushNamed('/tentang');
                      break;
                    case 1:
                      BlocProvider.of<HistoriBloc>(context).add(HistoriReset());
                      BlocProvider.of<IzinBloc>(context).add(IzinReset());
                      BlocProvider.of<CutiBloc>(context).add(CutiReset());
                      _authBloc.add(UserLoggedOut());
                      Navigator.of(context).pushReplacementNamed('/login');
                      break;
                    default:
                  }
                },
              ),
            ],
          ),
          body: SmartRefresher(
            controller: _refreshController,
            onRefresh: () async {
              _absenBloc.add(AbsenLoaded());

              await Future.delayed(Duration(milliseconds: 1000));
              _refreshController.refreshCompleted();
            },
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                      return HeaderHome(
                        state: state,
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: BlocBuilder<AbsenBloc, AbsenState>(
                      builder: (context, state) {
                        print("===> $state");
                        if (state is AbsenLoading)
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _buttonAbsenLoading(),
                                  _buttonAbsenLoading(),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _buttonAbsenLoading(size: 80),
                                  _buttonAbsenLoading(size: 80),
                                  _buttonAbsenLoading(size: 80),
                                ],
                              ),
                              SizedBox(height: 40),
                              Text(
                                'Jadwal Absen',
                                style: kHeaderStyle.copyWith(fontSize: 18),
                              ),
                              Text('-'),
                              SizedBox(height: 20),
                              _shimmerLoading(),
                              SizedBox(height: 20),
                              _shimmerLoading(),
                            ],
                          );
                        else if (state is AbsenIsLoaded) {
                          AbsenModel absen = state.absen;

                          bool btnDatangDisabled = false;
                          bool btnPulangDisabled = false;

                          if (absen.jamPulang != "") {
                            DateTime now = new DateTime.now();
                            List tanggal = absen.tanggal
                                .split('-')
                                .map((e) => int.parse(e))
                                .toList();
                            List jam = absen.jamPulang
                                .split(':')
                                .map((e) => int.parse(e))
                                .toList();
                            DateTime jamPulang = new DateTime(
                              tanggal[2],
                              tanggal[1],
                              tanggal[0],
                              jam[0],
                              jam[1],
                            );

                            btnDatangDisabled = jamPulang.isBefore(now) ||
                                absen.waktuDatang.isNotEmpty;
                            btnPulangDisabled = jamPulang.isAfter(now) ||
                                absen.waktuPulang.isNotEmpty;
                          }

                          bool btnDisabled =
                              absen.libur || absen.izin || absen.cuti;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  _buttonAbsen(
                                      disabled:
                                          btnDisabled || btnDatangDisabled,
                                      size: 25,
                                      icon: Icons.login,
                                      text: 'Absen Datang',
                                      callback: () async {
                                        try {
                                          await GeolocatorService()
                                              .getPermission();
                                          final geoDevice =
                                              await GeolocatorService()
                                                  .getDeviceLocation();
                                          context.read<GeolocationBloc>().add(
                                              ChangePosition(LatLng(
                                                  geoDevice.latitude,
                                                  geoDevice.longitude)));
                                          Navigator.of(context)
                                              .pushNamed('/absensiDatang');
                                        } catch (e) {
                                          modalBottomSheetAbsen(
                                              context,
                                              "",
                                              ResponseApiModel(
                                                  error: true,
                                                  message: e.toString()),
                                              () {});
                                        }
                                      }),
                                  SizedBox(width: 20),
                                  _buttonAbsen(
                                      disabled:
                                          btnDisabled || btnPulangDisabled,
                                      size: 25,
                                      icon: Icons.logout,
                                      text: 'Absen Pulang',
                                      callback: () async {
                                        try {
                                          await GeolocatorService()
                                              .getPermission();

                                          final geoDevice =
                                              await GeolocatorService()
                                                  .getDeviceLocation();
                                          context.read<GeolocationBloc>().add(
                                              ChangePosition(LatLng(
                                                  geoDevice.latitude,
                                                  geoDevice.longitude)));
                                          Navigator.of(context)
                                              .pushNamed('/absensiPulang');
                                        } catch (e) {
                                          modalBottomSheetAbsen(
                                              context,
                                              "",
                                              ResponseApiModel(
                                                  error: true,
                                                  message: e.toString()),
                                              () {});
                                        }
                                      }),
                                ],
                              ),
                              SizedBox(height: 25),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  _buttonAbsen(
                                      size: 15,
                                      icon: Icons.compare_arrows_rounded,
                                      text: 'Izin',
                                      callback: () async {
                                        Navigator.of(context)
                                            .pushNamed('/izin');
                                      }),
                                  SizedBox(width: 20),
                                  _buttonAbsen(
                                      size: 15,
                                      icon: Icons.calendar_today_rounded,
                                      text: 'Cuti',
                                      callback: () async {
                                        Navigator.of(context)
                                            .pushNamed('/cuti');
                                      }),
                                  SizedBox(width: 20),
                                  _buttonAbsen(
                                      size: 15,
                                      icon: Icons.auto_stories,
                                      text: 'Histori Absen',
                                      callback: () {
                                        Navigator.of(context)
                                            .pushNamed('/histori');
                                      }),
                                ],
                              ),
                              SizedBox(height: 40),
                              Text(
                                'Jadwal Absen',
                                style: kHeaderStyle.copyWith(fontSize: 18),
                              ),
                              Text(state.absen.tanggal),
                              SizedBox(height: 20),
                              InfoAbsen(
                                icon: Icons.login,
                                tipe: 'datang',
                                absen: absen,
                              ),
                              SizedBox(height: 20),
                              InfoAbsen(
                                icon: Icons.logout,
                                tipe: 'pulang',
                                absen: absen,
                              )
                            ],
                          );
                        } else if (state is AbsenFailure) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Lottie.asset(
                                'assets/animations/error.json',
                                height: 200,
                              ),
                              Text(
                                state.message,
                                style: kHeaderStyle,
                              )
                            ],
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buttonAbsen({
  bool disabled = false,
  required double size,
  required IconData icon,
  required String text,
  required Function callback,
}) {
  return Column(
    children: <Widget>[
      TextButton(
        style: TextButton.styleFrom(
          backgroundColor: disabled ? secondaryColor : primaryColor,
          padding: EdgeInsets.all(size),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 50,
        ),
        onPressed: () => disabled ? null : callback(),
      ),
      Text(text)
    ],
  );
}

Widget _buttonAbsenLoading({double size = 100}) {
  return Shimmer.fromColors(
    baseColor: secondaryColor,
    highlightColor: Colors.white,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );
}

Widget _shimmerLoading() {
  return Shimmer.fromColors(
    baseColor: Colors.white,
    highlightColor: primaryColor,
    child: Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
    ),
  );
}
