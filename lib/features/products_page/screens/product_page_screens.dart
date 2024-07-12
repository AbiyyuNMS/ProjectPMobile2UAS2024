import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:prjct223_d1_24/common/widgets/custom_buttons.dart';
import 'package:prjct223_d1_24/common/widgets/stars.dart';
import 'package:prjct223_d1_24/constants/universal_var.dart';
import 'package:prjct223_d1_24/features/products_page/services/product_page_services.dart';
import 'package:prjct223_d1_24/features/search/screens/search_screen.dart';
import 'package:prjct223_d1_24/models/products.dart';
import 'package:prjct223_d1_24/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ProductPageScreen extends StatefulWidget {
  static const String routeName = '/product-page';
  final Product product;
  const ProductPageScreen({super.key, required this.product});

  @override
  State<ProductPageScreen> createState() => _ProductPageScreenState();
}

class _ProductPageScreenState extends State<ProductPageScreen> {
  final ProductPageServices productPageServices = ProductPageServices();
  double avgRating = 0;
  double myRating = 0;

  @override
  void initState() {
    super.initState();
    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;
      if (widget.product.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.product.rating![i].rating;
      }
    }

    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void addToCart() {
    productPageServices.addTocart(
      context: context,
      product: widget.product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(62),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: UniversalVariable.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 22,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 10),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide:
                                BorderSide(color: Colors.black38, width: 1),
                          ),
                          hintText: "Search",
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.id!,
                  ),
                  StarRating(rating: avgRating),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(widget.product.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
            ),
            CarouselSlider(
              items: widget.product.images.map((i) {
                return Builder(
                  builder: (BuildContext context) => Image.network(
                    i,
                    fit: BoxFit.contain,
                    height: 250,
                  ),
                );
              }).toList(),
              options: CarouselOptions(viewportFraction: 1, height: 200),
            ),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: "Price: ",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "Rp ${widget.product.price} ",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.product.description),
            ),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomButton(
                color: Colors.blue,
                text: "Buy Now!",
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomButton(
                color: Colors.blueGrey,
                text: "Add To Cart",
                onTap: addToCart,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Rate ",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            RatingBar.builder(
              initialRating: myRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: UniversalVariable.secondaryColor,
              ),
              onRatingUpdate: (rating) {
                productPageServices.rateProduct(
                  context: context,
                  product: widget.product,
                  rating: rating,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
