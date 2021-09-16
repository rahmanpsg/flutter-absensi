import 'package:absensi/models/histori_models.dart';
import 'package:absensi/styles/constant.dart';
import 'package:flutter/material.dart';
import "package:absensi/app/string_extension.dart";

class CardHistori extends StatelessWidget {
  const CardHistori({Key? key, required this.histori}) : super(key: key);

  final HistoriModel histori;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: histori.status == "cuti"
                  ? orangeColor
                  : histori.status == "izin"
                      ? blueColor
                      : histori.status == "izinPulang"
                          ? secondaryColor
                          : histori.status == "alpa"
                              ? redColor
                              : primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              ),
            ),
            height: double.infinity,
            width: 20,
          ),
          histori.status == "cuti" || histori.status == "izin"
              ? _customInfo(
                  histori.tanggal,
                  histori.status,
                  histori.waktuDatang,
                  histori.infoAbsenDatang,
                  Colors.black,
                )
              : _customInfo(
                  histori.tanggal,
                  'Waktu Datang',
                  histori.waktuDatang,
                  histori.infoAbsenDatang,
                  histori.waktuDatang == '-' ? Colors.red : Colors.black,
                ),
          histori.status == "cuti" || histori.status == "izin"
              ? Container()
              : SizedBox(
                  width: 20,
                  child: Divider(
                    color: primaryColor,
                    thickness: 3,
                  ),
                ),
          histori.status == "cuti" || histori.status == "izin"
              ? Container()
              : _customInfo(
                  null,
                  'Waktu Pulang',
                  histori.waktuPulang,
                  histori.infoAbsenPulang,
                  histori.waktuPulang == '-' ? Colors.red : Colors.black,
                ),
        ],
      ),
    );
  }
}

Widget _customInfo(
    String? tanggal, String status, String waktu, String info, Color color) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          tanggal != null
              ? Text(
                  tanggal,
                  style: primaryStyle.copyWith(
                    color: Colors.black54,
                  ),
                )
              : SizedBox(height: 13),
          Text(
            status.capitalize(),
            style: secondaryStyle.copyWith(fontSize: 17),
          ),
          Text(waktu),
          Text(
            info,
            style: TextStyle(color: color),
          ),
        ],
      ),
    ),
  );
}
