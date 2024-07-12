import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:prjct223_d1_24/constants/universal_var.dart';

class StarRating extends StatelessWidget {
  final double rating;
  const StarRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        direction: Axis.horizontal,
        itemCount: 5,
        rating: rating,
        itemSize: 15,
        itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: UniversalVariable.secondaryColor,
            ));
  }
}
