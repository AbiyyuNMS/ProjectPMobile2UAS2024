import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:prjct223_d1_24/constants/universal_var.dart';

class BannerImages extends StatelessWidget {
  const BannerImages({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: UniversalVariable.carouselImages.map((i) {
        return Builder(
          builder: (BuildContext context) => Image.network(
            i,
            fit: BoxFit.cover,
            height: 200,
          ),
        );
      }).toList(),
      options: CarouselOptions(viewportFraction: 1, height: 200),
    );
  }
}
