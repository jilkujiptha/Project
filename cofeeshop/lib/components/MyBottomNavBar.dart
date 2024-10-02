import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      child: GNav(
          onTabChange: (value) {
            return onTabChange!(value);
          },
          color: Colors.grey[600],
          mainAxisAlignment: MainAxisAlignment.center,
          tabBorderRadius: 5,
          tabActiveBorder:
              Border.all(color: Colors.grey.shade800),
          activeColor: Colors.white,
          tabs: [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.home,
              text: "Cart",
            )
          ]),
    );
  }
}
