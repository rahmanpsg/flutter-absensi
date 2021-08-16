import 'package:absensi/models/absen_models.dart';
import 'package:absensi/styles/constant.dart';
import 'package:flutter/material.dart';

class InfoAbsen extends StatelessWidget {
  const InfoAbsen({
    Key? key,
    required this.icon,
    required this.tipe,
    required this.absen,
  }) : super(key: key);

  final IconData icon;
  final String tipe;
  final AbsenModel absen;

  @override
  Widget build(BuildContext context) {
    final String _teks = tipe == 'datang' ? 'Jam Datang' : 'Jam Pulang';
    final String _jam = tipe == 'datang' ? absen.jamDatang : absen.jamPulang;
    final String _info =
        tipe == 'datang' ? absen.infoAbsenDatang : absen.infoAbsenPulang;
    final bool _libur = absen.libur || absen.izin || absen.cuti;
    String _liburTeks = 'Libur';
    if (absen.libur) _liburTeks = 'Libur';
    if (absen.izin) _liburTeks = 'Izin';
    if (absen.cuti) _liburTeks = 'Cuti';

    return Column(
      children: [
        Container(
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
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(children: <Widget>[
              Icon(
                icon,
                color: primaryColor,
                size: 50,
              ),
              SizedBox(width: 25),
              Expanded(
                child: Text(
                  _teks,
                  style: kHeaderStyle.copyWith(fontSize: 18),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: double.infinity,
                width: 70,
                child: Center(
                  child: Text(
                    _info == '' && _libur ? _liburTeks : _jam,
                    style: kHeaderStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
        tipe == 'datang' && (_info != '' || !_libur)
            ? Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                height: 30.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: Text(
                    '*$_info',
                    style: primaryStyle,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
