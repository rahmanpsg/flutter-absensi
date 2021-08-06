import 'package:absensi/styles/constant.dart';
import 'package:absensi/widgets/loginForm.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    primaryColor,
                    secondaryColor,
                    dangerColor,
                  ],
                ),
              ),
            ),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 200.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/logo.png"),
                      width: 250.0,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Absensi Karyawan \nPLTU Barru",
                      textAlign: TextAlign.center,
                      style: primaryStyle.copyWith(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    LoginForm()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
