import 'package:absensi/styles/constant.dart';
import 'package:absensi/widgets/mapWidget.dart';
import 'package:flutter/material.dart';

class AbsensiScreen extends StatelessWidget {
  const AbsensiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lokasi Anda',
          style: primaryStyle.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: MapWidget(),
    );
  }
}
