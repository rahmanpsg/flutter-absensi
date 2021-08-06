import 'package:absensi/models/responseApi_models.dart';
import 'package:absensi/styles/constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void modalBottomSheetAbsen(BuildContext context, String absen,
    ResponseApiModel res, Function callback) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    // backgroundColor: bgColor,
    builder: (BuildContext bc) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animations/${res.error ? 'error' : 'success'}.json',
            repeat: false,
            height: 200,
          ),
          Text(
            res.message,
            style: kHeaderStyle,
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              callback();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                Text(
                  'Kembali',
                  style: primaryStyle,
                ),
              ],
            ),
          ),
        ],
      );
    },
  ).whenComplete(() => callback());
}
