import 'dart:convert';

import 'package:absensi/bloc/authentication_bloc.dart';
import 'package:absensi/styles/constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({Key? key, required this.state}) : super(key: key);

  final state;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(color: primaryColor),
        child: Card(
          margin: EdgeInsets.symmetric(
            vertical: 3,
            horizontal: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: state is AuthenticationOnAuthenticated
                ? Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        // child: Image.network(
                        //   'https://img.a.transfermarkt.technology/portrait/big/8198-1626161872.jpg?lm=1',
                        // ),
                        child: Image.memory(base64Decode(state.user.image)),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              state.user.nama ?? '',
                              style: kHeaderStyle,
                            ),
                            Text(
                              state.user.nik ?? '',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 10),
                            Divider(color: Colors.black38)
                          ],
                        ),
                      )
                    ],
                  )
                : Lottie.asset(
                    'assets/animations/loading.json',
                    repeat: false,
                    height: 200,
                  ),
          ),
        ),
      ),
    );
  }
}
