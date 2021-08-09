import 'package:absensi/bloc/absen_bloc.dart';
import 'package:absensi/bloc/authentication_bloc.dart';
import 'package:absensi/bloc/geolocation_bloc.dart';
import 'package:absensi/models/absen_models.dart';
import 'package:absensi/services/geolocator_service.dart';
import 'package:absensi/styles/constant.dart';
import 'package:absensi/widgets/headerHome.dart';
import 'package:absensi/widgets/infoAbsen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _buttonAbsen({
    required IconData icon,
    required String text,
    required Function callback,
  }) {
    return Column(
      children: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            padding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 50,
          ),
          onPressed: () => callback(),
        ),
        Text(text)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    final absenBloc = BlocProvider.of<AbsenBloc>(context);

    RefreshController _refreshController =
        RefreshController(initialRefresh: false);

    int popped = 0;

    return WillPopScope(
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
                    authBloc.add(UserLoggedOut());
                    Navigator.of(context).pushReplacementNamed('/login');
                    break;
                  default:
                }
              },
            ),
          ],
        ),
        body: SafeArea(
          child: SmartRefresher(
            controller: _refreshController,
            onRefresh: () async {
              absenBloc.add(AbsenLoaded());

              await Future.delayed(Duration(milliseconds: 1000));
              _refreshController.refreshCompleted();
            },
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _buttonAbsen(
                              icon: Icons.login,
                              text: 'Absen Datang',
                              callback: () async {
                                final geoDevice = await GeolocatorService()
                                    .getDeviceLocation();
                                context.read<GeolocationBloc>().add(
                                    ChangePosition(LatLng(geoDevice.latitude,
                                        geoDevice.longitude)));
                                Navigator.of(context)
                                    .pushNamed('/absensiDatang');
                              }),
                          SizedBox(width: 20),
                          _buttonAbsen(
                              icon: Icons.logout,
                              text: 'Absen Pulang',
                              callback: () async {
                                final geoDevice = await GeolocatorService()
                                    .getDeviceLocation();
                                context.read<GeolocationBloc>().add(
                                    ChangePosition(LatLng(geoDevice.latitude,
                                        geoDevice.longitude)));
                                Navigator.of(context)
                                    .pushNamed('/absensiPulang');
                              }),
                          SizedBox(width: 20),
                          _buttonAbsen(
                              icon: Icons.auto_stories,
                              text: 'Histori Absen',
                              callback: () {
                                Navigator.of(context).pushNamed('/histori');
                              }),
                        ],
                      ),
                      SizedBox(height: 60),
                      BlocBuilder<AbsenBloc, AbsenState>(
                        builder: (context, state) {
                          print(state);
                          if (state is AbsenLoading)
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Jadwal Absen',
                                  style: kHeaderStyle.copyWith(fontSize: 18),
                                ),
                                Text(state.absen.tanggal),
                                SizedBox(height: 20),
                                InfoAbsen(
                                  icon: Icons.login,
                                  text: 'Jam Datang',
                                  jam: absen.jamDatang,
                                  info: absen.infoAbsenDatang,
                                  libur: absen.libur,
                                ),
                                SizedBox(height: 20),
                                InfoAbsen(
                                  icon: Icons.logout,
                                  text: 'Jam Pulang',
                                  jam: absen.jamPulang,
                                  info: absen.infoAbsenPulang,
                                  libur: absen.libur,
                                ),
                              ],
                            );
                          }
                          return Container();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
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
