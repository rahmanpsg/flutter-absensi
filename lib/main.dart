import 'package:absensi/bloc/authentication_bloc.dart';
import 'package:absensi/bloc/geolocation_bloc.dart';
import 'package:absensi/bloc/login_bloc.dart';
import 'package:absensi/services/absen_service.dart';
import 'package:absensi/services/authentication_service.dart';
import 'package:absensi/services/geolocator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/absen_bloc.dart';
import 'bloc/histori_bloc.dart';
import 'screens/absensi.dart';
import 'screens/histori.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'styles/constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isLogin = await AuthenticationService().isLogged();

  runApp(MyApp(isLogin: isLogin));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.isLogin}) : super(key: key);
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthenticationService()),
        RepositoryProvider(create: (context) => GeolocatorService()),
        RepositoryProvider(create: (context) => AbsenService()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) {
            final _authService =
                RepositoryProvider.of<AuthenticationService>(context);
            return AuthenticationBloc(_authService)..add(AppLoaded());
          }),
          BlocProvider(create: (context) {
            final _geoService =
                RepositoryProvider.of<GeolocatorService>(context);
            return GeolocationBloc(_geoService)..add(GeolocationLoaded());
          }),
          BlocProvider(create: (context) {
            final _absenService = RepositoryProvider.of<AbsenService>(context);
            if (isLogin)
              return AbsenBloc(_absenService)..add(AbsenLoaded());
            else
              return AbsenBloc(_absenService);
          }),
          BlocProvider(create: (context) {
            final _absenService = RepositoryProvider.of<AbsenService>(context);
            return HistoriBloc(_absenService);
          }),
          BlocProvider(create: (context) {
            final _authBloc = BlocProvider.of<AuthenticationBloc>(context);
            final _absenBloc = BlocProvider.of<AbsenBloc>(context);
            final _authService =
                RepositoryProvider.of<AuthenticationService>(context);
            return LoginBloc(_authBloc, _absenBloc, _authService);
          }),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: primaryColor,
            splashColor: secondaryColor,
            primarySwatch: Colors.pink,
            fontFamily: 'Gothic',
            appBarTheme: Theme.of(context).appBarTheme.copyWith(
                  brightness: Brightness.dark,
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                ),
          ),
          initialRoute: isLogin ? '/' : '/login',
          routes: {
            '/': (context) => HomeScreen(),
            '/login': (context) => LoginScreen(),
            '/absensiDatang': (context) => AbsensiScreen(absen: 'Datang'),
            '/absensiPulang': (context) => AbsensiScreen(absen: 'Pulang'),
            '/histori': (context) => HistoriScreen(),
          },
        ),
      ),
    );
  }
}
