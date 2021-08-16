import 'package:absensi/styles/constant.dart';
import 'package:flutter/material.dart';

class CardIzin extends StatelessWidget {
  const CardIzin({
    Key? key,
    required this.tanggal,
    required this.keterangan,
  }) : super(key: key);

  final String tanggal;
  final String keterangan;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      // padding: EdgeInsets.all(20),
      height: 80,
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
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    tanggal,
                    style: kHeaderStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  Text("#" + keterangan)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
