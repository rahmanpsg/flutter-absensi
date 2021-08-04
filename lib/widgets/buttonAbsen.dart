import 'package:absensi/styles/constant.dart';
import 'package:flutter/material.dart';

class ButtonAbsen extends StatelessWidget {
  const ButtonAbsen({
    Key? key,
    required this.absen,
    required this.info,
    required this.inRadius,
    required this.callback,
  }) : super(key: key);

  final String absen;
  final String info;
  final bool inRadius;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      height: 70,
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
          SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  absen,
                  style: kHeaderStyle.copyWith(color: primaryColor),
                ),
                Text(
                  info,
                  style: primaryStyle.copyWith(
                      color: inRadius ? Colors.black : Colors.red),
                )
              ],
            ),
          ),
          TextButton(
            onPressed: inRadius
                ? () {
                    callback();
                  }
                : null,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  inRadius ? primaryColor : secondaryColor),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'Lanjut',
                  style: primaryStyle,
                ),
                Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(width: 20)
        ],
      ),
    );
  }
}
