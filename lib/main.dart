import 'package:absensi/bloc/authentication_bloc.dart';
import 'package:absensi/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/absensi.dart';
import 'screens/historiAbsen.dart';
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
    return RepositoryProvider(
      create: (context) => AuthenticationService(),
      child: BlocProvider(
        create: (context) {
          final authService =
              RepositoryProvider.of<AuthenticationService>(context);
          return AuthenticationBloc(authService)..add(AppLoaded());
        },
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            return MaterialApp(
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
                '/absensi': (context) => AbsensiScreen(),
                '/histori': (context) => HistoriScreen(),
              },
            );
          },
        ),
      ),
    );
  }
}
