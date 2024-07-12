import 'package:flutter/material.dart';
import 'package:prjct223_d1_24/common/widgets/loader.dart';
// import 'package:flutter/widgets.dart';
import 'package:prjct223_d1_24/constants/universal_var.dart';
import 'package:prjct223_d1_24/features/products_page/screens/product_page_screens.dart';
import 'package:prjct223_d1_24/home/services/home_services.dart';
import 'package:prjct223_d1_24/models/products.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealsScreen({super.key, required this.category});

  @override
  State<CategoryDealsScreen> createState() => _CateState();
}

class _CateState extends State<CategoryDealsScreen> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
        context: context, category: widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: UniversalVariable.appBarGradient,
            ),
          ),
          title: Text(
            widget.category,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: productList == null
          ? const Loader()
          : Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Gerusskan ${widget.category}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 15),
                      itemCount: productList!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 1.4,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        final product = productList![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ProductPageScreen.routeName,
                                arguments: product);
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: 130,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 0.5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.network(
                                      product.images[0],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.only(
                                    left: 0, top: 5, right: 15),
                                child: Text(
                                  product.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              // Container(
                              //   alignment: Alignment.topLeft,
                              //   padding: const EdgeInsets.only(
                              //       left: 0, top: 5, right: 15),
                              //   child: Text(
                              //     product.price.toString(),
                              //     maxLines: 1,
                              //     overflow: TextOverflow.ellipsis,
                              //   ),
                              // ),
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
    );
  }
}
