import 'package:flutter/material.dart';
import 'package:prjct223_d1_24/features/profile/screens/widgets/profile_buttons.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ProfileButton(text: 'My Orders', onTap: () {}),
            ProfileButton(text: 'Turn Seller', onTap: () {}),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            ProfileButton(text: 'Log Out', onTap: () {}),
            ProfileButton(text: 'Fav List', onTap: () {}),
          ],
        ),
      ],
    );
  }
}
