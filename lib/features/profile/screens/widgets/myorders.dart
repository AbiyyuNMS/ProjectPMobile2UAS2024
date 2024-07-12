import 'package:flutter/material.dart';
import 'package:prjct223_d1_24/constants/universal_var.dart';
import 'package:prjct223_d1_24/features/profile/screens/widgets/single_product.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  List list = [
    {
      'https://unsplash.com/photos/a-bunch-of-bubbles-floating-in-the-air-jaOew9jE0cI',
      'https://unsplash.com/photos/a-bunch-of-bubbles-floating-in-the-air-jaOew9jE0cI',
      'https://unsplash.com/photos/a-bunch-of-bubbles-floating-in-the-air-jaOew9jE0cI',
      'https://unsplash.com/photos/a-bunch-of-bubbles-floating-in-the-air-jaOew9jE0cI',
    }.toString()
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                "My Orders",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                "Show All",
                style: TextStyle(
                    fontSize: 17,
                    color: UniversalVariable.secondaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        //product
        Container(
          height: 170,
          padding: EdgeInsets.only(left: 10, top: 20, right: 0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return SingleProduct(image: list[index]);
              }),
        ),
      ],
    );
  }
}
