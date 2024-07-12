import 'package:flutter/material.dart';
// import 'package:badges/badges.dart' as badges;
import 'package:prjct223_d1_24/constants/universal_var.dart';
import 'package:badges/badges.dart' as badges;
import 'package:prjct223_d1_24/features/cart/screens/cart_screens.dart';
import 'package:prjct223_d1_24/features/profile/screens/profile_screens.dart';
import 'package:prjct223_d1_24/home/screens/home_screens.dart';
import 'package:prjct223_d1_24/provider/user_provider.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWdth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const ProfileScreen(),
    const CartScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: UniversalVariable.selectedNavBarColor,
        unselectedItemColor: UniversalVariable.unselectedNavBarColor,
        backgroundColor: UniversalVariable.secondaryColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          //homepage
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWdth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? UniversalVariable.backgroundColor
                        : Colors.transparent,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
            ),
            label: '',
          ),

          //profile acc
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWdth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? UniversalVariable.backgroundColor
                        : Colors.transparent,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.person_outline_outlined,
                color: Colors.white,
              ),
            ),
            label: '',
          ),

          //cart
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWdth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? UniversalVariable.backgroundColor
                        : Colors.transparent,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: badges.Badge(
                elevation: 0,
                badgeContent: Text(userCartLen.toString()),
                badgeColor: Colors.white,
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
