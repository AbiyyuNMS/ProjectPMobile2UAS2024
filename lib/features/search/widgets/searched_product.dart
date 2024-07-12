import 'package:flutter/material.dart';
import 'package:prjct223_d1_24/common/widgets/stars.dart';
import 'package:prjct223_d1_24/constants/universal_var.dart';
import 'package:prjct223_d1_24/models/products.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double totalRating = 0;
    for (int i = 0; i < product.rating!.length; i++) {
      totalRating += product.rating![i].rating;
    }
    double avgRating = 0;
    if (totalRating != 0) {
      avgRating = totalRating / product.rating!.length;
    }
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              Image.network(
                product.images[0],
                fit: BoxFit.contain,
                height: 135,
                width: 135,
              ),
              Column(
                children: [
                  Container(
                    width: 235,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      product.name,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: StarRating(
                      rating: avgRating,
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      "Rp ${product.price}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      "Stock",
                      style: TextStyle(
                          fontSize: 15,
                          color: UniversalVariable.selectedNavBarColor),
                      maxLines: 2,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
