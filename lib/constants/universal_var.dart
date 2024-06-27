import 'package:flutter/material.dart';

String uri = 'http://192.168.1.35:3000';

class UniversalVariable {
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color(0xff3F72AF);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = const Color(0xff028391);
  static const unselectedNavBarColor = Colors.black87;
}
