import 'dart:convert';

import 'package:absensi/bloc/authentication_bloc.dart';
import 'package:absensi/styles/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 150,
                          minHeight: 150,
                          maxWidth: 100,
                          minWidth: 100,
                        ),
                        child: state.user.image != null
                            //
                            ? CachedNetworkImage(
                                placeholder: (context, url) => Center(
                                    child: new CircularProgressIndicator()),
                                errorWidget: (context, url, error) => Image(
                                  image: AssetImage("assets/images/user.png"),
                                  width: 100,
                                ),
                                imageUrl: state.user.image,
                                fit: BoxFit.fill,
                              )
                            : Image(
                                image: AssetImage("assets/images/user.png"),
                                width: 100,
                              ),
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
