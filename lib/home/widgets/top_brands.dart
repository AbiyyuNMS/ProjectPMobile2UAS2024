import 'package:flutter/material.dart';
import 'package:prjct223_d1_24/constants/universal_var.dart';
import 'package:prjct223_d1_24/home/screens/category_deals.dart';

class TopBrands extends StatelessWidget {
  const TopBrands({super.key});

  void navigateToCategory(BuildContext context, String category) {
    Navigator.pushNamed(context, CategoryDealsScreen.routeName,
        arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      // color: Colors.white,
      child: ListView.builder(
          itemCount: UniversalVariable.categoryImages.length,
          scrollDirection: Axis.horizontal,
          itemExtent: 80,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => navigateToCategory(
                  context, UniversalVariable.categoryImages[index]['title']!),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        UniversalVariable.categoryImages[index]['image']!,
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                  Text(
                    UniversalVariable.categoryImages[index]['title']!,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            );
          }),
    );
  }
}
