import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prjct223_d1_24/common/widgets/loader.dart';
import 'package:prjct223_d1_24/constants/universal_var.dart';
import 'package:prjct223_d1_24/features/products_page/screens/product_page_screens.dart';
import 'package:prjct223_d1_24/home/services/home_services.dart';
import 'package:prjct223_d1_24/models/products.dart';

class TopSale extends StatefulWidget {
  const TopSale({super.key});

  @override
  State<TopSale> createState() => _TopSaleState();
}

class _TopSaleState extends State<TopSale> {
  Product? product;
  final HomeServices homeServices = HomeServices();
  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  fetchDealOfDay() async {
    product = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }

  void navigateToDetailScreen() {
    Navigator.pushNamed(
      context,
      ProductPageScreen.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Loader()
        : product!.name.isEmpty
            ? const SizedBox()
            : GestureDetector(
                onTap: navigateToDetailScreen,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 10, top: 15),
                      child: const Text(
                        "Top Sale Of The Day",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Image.network(
                      product!.images[0],
                      height: 235,
                      fit: BoxFit.fitHeight,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Rp 155.000",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding:
                          const EdgeInsets.only(left: 15, top: 5, right: 40),
                      child: const Text(
                        "Sepatii",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: product!.images
                            .map(
                              (e) => Image.network(
                                e,
                                fit: BoxFit.fitWidth,
                                width: 100,
                                height: 100,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ).copyWith(left: 15),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Show All Sale",
                        style:
                            TextStyle(color: UniversalVariable.secondaryColor),
                      ),
                    )
                  ],
                ),
              );
  }
}
