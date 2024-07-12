import 'package:flutter/material.dart';

String uri = 'http://192.168.1.11:3000';

class UniversalVariable {
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 21, 97, 203),
      Color.fromARGB(255, 124, 125, 125),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color(0xff3F72AF);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = const Color(0xff028391);
  static const unselectedNavBarColor = Colors.black87;

  static const List<String> carouselImages = [
    "https://img.freepik.com/free-psd/running-shoes-banner-template_23-2148681438.jpg",
    "https://img.freepik.com/free-vector/sale-landing-page-template-with-photo_23-2148271371.jpg?t=st=1719631174~exp=1719631774~hmac=d8042699554c1043e6fec96f8edafc0b667c5679c08e19169a7ea15e90b55b6c",
    "https://img.freepik.com/free-psd/black-friday-super-sale-web-banner-template_120329-3849.jpg?t=st=1719631329~exp=1719631929~hmac=f6e1a6f51bef3e4ed6be9c88c545ff665de7eef53040e67cd9fb1561cfe35784"
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Puma',
      'image': 'assets/images/Puma.png',
    },
    {
      'title': 'Nike',
      'image': 'assets/images/Nike.png',
    },
    {
      'title': 'NewBalance',
      'image': 'assets/images/NB.png',
    },
    {
      'title': 'Converse',
      'image': 'assets/images/Converse.png',
    },
    {
      'title': 'Adidas',
      'image': 'assets/images/Adidas.png',
    },
  ];
}
