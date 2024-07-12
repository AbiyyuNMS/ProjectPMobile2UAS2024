import 'package:flutter/material.dart';
import 'package:prjct223_d1_24/constants/universal_var.dart';
import 'package:prjct223_d1_24/provider/user_provider.dart';
import 'package:provider/provider.dart';

class BellowAppBar extends StatelessWidget {
  const BellowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      decoration: const BoxDecoration(
        gradient: UniversalVariable.appBarGradient,
      ),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: "Assalamualaikum, ",
              style: const TextStyle(fontSize: 22, color: Colors.white),
              children: [
                TextSpan(
                  text: user.name,
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
