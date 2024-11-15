import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigationBar extends StatelessWidget {
  void Function(int)? onTabChnage;
  BottomNavigationBar({super.key, required this.onTabChnage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(25),
        child: GNav(tabs: [
          GButton(
            icon: Icons.message,
            text: "Chats",
          ),
          GButton(icon: Icons.update,
          text: "Updates",
          ),
          GButton(icon: Icons.group,
          text: "Communities",
          ),
          GButton(icon: Icons.call,text: "Calls",
          )
        ]),
      ),
    );
  }
}
