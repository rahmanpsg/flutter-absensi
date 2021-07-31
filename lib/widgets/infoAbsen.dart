import 'package:absensi/styles/constant.dart';
import 'package:flutter/material.dart';

class InfoAbsen extends StatelessWidget {
  const InfoAbsen({
    Key? key,
    required this.icon,
    required this.text,
    required this.jam,
    required this.info,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final String jam;
  final String info;

  @override
  Widget build(BuildContext context) {
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
                  text,
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
                    jam,
                    style: kHeaderStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
        info != ''
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
                    '*$info',
                    style: primaryStyle,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
