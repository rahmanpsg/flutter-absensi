import 'package:absensi/models/histori_models.dart';
import 'package:absensi/styles/constant.dart';
import 'package:flutter/material.dart';

class CardHistori extends StatelessWidget {
  const CardHistori({Key? key, required this.histori}) : super(key: key);

  final HistoriModel histori;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 100,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              ),
            ),
            height: double.infinity,
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  histori.tanggal,
                  style: primaryStyle.copyWith(
                    color: Colors.black54,
                  ),
                ),
                Text(
                  'Waktu Absen',
                  style: kHeaderStyle.copyWith(
                    color: primaryColor,
                  ),
                ),
                Text(histori.jamDatang),
                Text('*${histori.infoDatang}'),
              ],
            ),
          ),
          SizedBox(
            width: 30,
            child: Divider(
              color: primaryColor,
              thickness: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 13),
                Text(
                  'Waktu Pulang',
                  style: kHeaderStyle.copyWith(
                    color: primaryColor,
                  ),
                ),
                Text(histori.jamPulang),
                Text('*${histori.infoPulang}'),
              ],
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
