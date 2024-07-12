import 'package:flutter/material.dart';
import 'package:prjct223_d1_24/common/widgets/custom_buttons.dart';
import 'package:prjct223_d1_24/constants/universal_var.dart';
import 'package:prjct223_d1_24/features/adress/screens/addres_screen.dart';
import 'package:prjct223_d1_24/features/cart/widgets/cart_product.dart';
import 'package:prjct223_d1_24/features/cart/widgets/cart_subtotal.dart';
import 'package:prjct223_d1_24/features/search/screens/search_screen.dart';
import 'package:prjct223_d1_24/home/widgets/address_box.dart';
import 'package:prjct223_d1_24/provider/user_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void navigateToAddressScreen() {
    Navigator.pushNamed(context, AddressScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
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
          children: [
            const AddressBox(),
            const CartSubtotal(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                  text: "CheckOut (${user.cart.length} items)",
                  onTap: navigateToAddressScreen,
                  color: UniversalVariable.secondaryColor),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.black12.withOpacity(0.08),
              height: 1,
            ),
            const SizedBox(
              height: 5,
            ),
            ListView.builder(
              itemCount: user.cart.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CartProduct(index: index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
