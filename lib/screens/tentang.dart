import 'package:absensi/styles/constant.dart';
import 'package:flutter/material.dart';

class TentangScreen extends StatelessWidget {
  const TentangScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tentang",
          style: primaryStyle.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: Image(
                  image: AssetImage("assets/images/logo.png"),
                  width: 150,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Aplikasi Absensi Karyawan Menggunakan Geolocation dan Finger Print Berbasis Android',
                  textAlign: TextAlign.center,
                  style: primaryStyle.copyWith(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  'Anggita Arfina Arfah \n217280058',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 35),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _dosenInfo("Pembimbing", "1", "Muh. Zainal, ST., MT"),
                  SizedBox(height: 10),
                  _dosenInfo(
                      "Pembimbing", "2", "Ir. Untung Suwardoyo, S.Kom, MT"),
                  SizedBox(height: 10),
                  _dosenInfo("Penguji", "1", "Ahmad Selao, STP., M.Sc."),
                  SizedBox(height: 10),
                  _dosenInfo("Penguji", "2", "Masnur, ST., M.Kom"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _dosenInfo(String dosen, String angka, String nama) {
  return Row(
    children: [
      Text("$dosen $angka"),
      SizedBox(width: dosen == "Pembimbing" ? 20 : 52),
      Text(":"),
      SizedBox(width: 20),
      Expanded(child: Text(nama)),
    ],
  );
}
