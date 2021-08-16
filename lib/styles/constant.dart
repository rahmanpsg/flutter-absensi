import 'package:flutter/material.dart';

// Colors
const primaryColor = Color(0xFFF875AA);
const secondaryColor = Color(0xFFFBACCC);
const dangerColor = Color(0xFFF1D1D0);
const bgColor = Color(0xFFF4F9F9);
const yellowColor = Color(0xFFf5f522);
const orangeColor = Color(0xFFffbd2e);
const greenColor = Color(0xFF4bd662);
const blueColor = Color(0xFF22e3f5);

// Text Style
const primaryStyle =
    TextStyle(fontFamily: 'Poppins', fontSize: 14, color: Colors.white);
const kLabelStyle =
    TextStyle(fontFamily: 'Poppins', fontSize: 14, color: Colors.white);
const kHintStyle =
    TextStyle(fontFamily: 'Poppins', fontSize: 14, color: Colors.white60);
const kHeaderStyle = TextStyle(
  fontFamily: 'Gothic',
  fontSize: 20,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);
const secondaryStyle = TextStyle(
    fontFamily: 'Gothic',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: primaryColor);

final kBoxDecorationStyle = BoxDecoration(
  color: primaryColor,
  borderRadius: BorderRadius.circular(25.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
