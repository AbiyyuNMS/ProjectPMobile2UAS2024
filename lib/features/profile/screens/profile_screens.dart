import 'package:flutter/material.dart';
import 'package:prjct223_d1_24/constants/universal_var.dart';
import 'package:prjct223_d1_24/features/profile/screens/widgets/bellow_appbar.dart';
import 'package:prjct223_d1_24/features/profile/screens/widgets/myorders.dart';
import 'package:prjct223_d1_24/features/profile/screens/widgets/top_buttons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(Icons.notifications_outlined,
                          color: Colors.white),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: const Column(
        children: [
          BellowAppBar(),
          SizedBox(
            height: 10,
          ),
          TopButtons(),
          SizedBox(
            height: 20,
          ),
          MyOrders(),
        ],
      ),
    );
  }
}
