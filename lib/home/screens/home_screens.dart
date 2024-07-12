import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:prjct223_d1_24/constants/universal_var.dart';
import 'package:prjct223_d1_24/features/search/screens/search_screen.dart';
import 'package:prjct223_d1_24/home/widgets/address_box.dart';
import 'package:prjct223_d1_24/home/widgets/banner_images.dart';
import 'package:prjct223_d1_24/home/widgets/top_brands.dart';
import 'package:prjct223_d1_24/home/widgets/top_sell.dart';
// import 'package:prjct223_d1_24/provider/user_provider.dart';
// import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context).user;

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
      body: const SingleChildScrollView(
        child: Column(
          children: [
            AddressBox(),
            SizedBox(
              height: 10,
            ),
            TopBrands(),
            SizedBox(
              height: 10,
            ),
            BannerImages(),
            TopSale(),
          ],
        ),
      ),
    );
  }
}
