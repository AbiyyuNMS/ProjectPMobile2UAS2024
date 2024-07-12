import 'package:flutter/material.dart';
import 'package:prjct223_d1_24/constants/universal_var.dart';
import 'package:prjct223_d1_24/features/admin/screens/post_screen.dart';

class AdminScreens extends StatefulWidget {
  const AdminScreens({super.key});

  @override
  State<AdminScreens> createState() => _AdminScreensState();
}

class _AdminScreensState extends State<AdminScreens> {
  int _page = 0;
  double bottomBarWdth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const PostsScreen(),
    const Center(
      child: Text("Upload Page"),
    ),
    const Center(
      child: Text("Cart Page"),
    ),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/logomj.png',
                  width: 50,
                  height: 45,
                  color: Colors.white,
                ),
              ),
              const Text(
                "Admin",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              )
            ],
          ),
        ),
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: UniversalVariable.selectedNavBarColor,
        unselectedItemColor: UniversalVariable.unselectedNavBarColor,
        backgroundColor: UniversalVariable.secondaryColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          //upload
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

          //analitic acc
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
                Icons.analytics_outlined,
                color: Colors.white,
              ),
            ),
            label: '',
          ),

          //orders
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
              child: const Icon(
                Icons.all_inbox_outlined,
                color: Colors.white,
              ),
            ),
            label: '',
          ),

          //cart
        ],
      ),
    );
  }
}
