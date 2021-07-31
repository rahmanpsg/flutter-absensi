import 'package:absensi/styles/constant.dart';
import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({Key? key, required this.imageUrl, required this.nama})
      : super(key: key);

  final String imageUrl;
  final String nama;

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
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    imageUrl,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        nama,
                        style: kHeaderStyle,
                      ),
                      Text(
                        "214280187",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Divider(color: Colors.black38)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
