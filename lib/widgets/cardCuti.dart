import 'package:absensi/styles/constant.dart';
import 'package:flutter/material.dart';

class CardCuti extends StatelessWidget {
  const CardCuti({
    Key? key,
    required this.tanggal,
    required this.keterangan,
    required this.diterima,
  }) : super(key: key);

  final String tanggal;
  final String keterangan;
  final bool? diterima;

  @override
  Widget build(BuildContext context) {
    // 0 belum, 1 diterima, 2 ditolak

    final int _status = diterima != null
        ? diterima == true
            ? 1
            : 2
        : 0;

    final List<Color> _color = [blueColor, greenColor, orangeColor];
    final List<String> _teks = ['Menunggu Konfirmasi', 'Diterima', 'Ditolak'];
    final List<IconData> _icon = [Icons.access_time, Icons.check, Icons.close];

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      // padding: EdgeInsets.all(20),
      height: 90,
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
        children: [
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    tanggal,
                    style: kHeaderStyle.copyWith(
                      fontSize: 15,
                    ),
                  ),
                  Text("#" + keterangan)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: _color[_status],
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              height: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    _icon[_status],
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    _teks[_status],
                    style: primaryStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
