import 'package:absensi/bloc/authentication_bloc.dart';
import 'package:absensi/styles/constant.dart';
import 'package:absensi/widgets/headerHome.dart';
import 'package:absensi/widgets/infoAbsen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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

    int popped = 0;

    DateTime now = DateTime.now();
    String tanggal = DateFormat('dd MMMM yyyy').format(now);

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
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              HeaderHome(
                imageUrl:
                    'https://img.a.transfermarkt.technology/portrait/big/8198-1626161872.jpg?lm=1',
                nama: 'Abd Rahman',
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
                            callback: () {
                              Navigator.of(context).pushNamed('/absensi');
                            }),
                        SizedBox(width: 20),
                        _buttonAbsen(
                            icon: Icons.logout,
                            text: 'Absen Pulang',
                            callback: () {}),
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
                    Text(
                      'Jadwal Absen',
                      style: kHeaderStyle.copyWith(fontSize: 18),
                    ),
                    Text(tanggal),
                    SizedBox(height: 20),
                    InfoAbsen(
                      icon: Icons.login,
                      text: 'Jam Datang',
                      jam: '08:00',
                      info: 'Anda Belum Melakukan Absen Datang',
                    ),
                    SizedBox(height: 20),
                    InfoAbsen(
                      icon: Icons.logout,
                      text: 'Jam Pulang',
                      jam: '15:00',
                      info: '',
                    ),
                  ],
                ),
              ),
              FlatButton(
                textColor: Theme.of(context).primaryColor,
                child: Text('Logout'),
                onPressed: () {
                  authBloc.add(UserLoggedOut());
                  Navigator.of(context).pushReplacementNamed('/login');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
