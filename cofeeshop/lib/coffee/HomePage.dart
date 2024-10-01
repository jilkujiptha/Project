import 'package:cofeeshop/coffee/CartPage.dart';
import 'package:cofeeshop/coffee/ShopPage.dart';
import 'package:cofeeshop/components/MyBottomNavBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage=0;
  final List<Widget>pages=[
    ShoPage(),CartPage()
  ];
void navigationBar(int index){
  setState(() {
    selectedPage=index;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index)=>navigationBar(index),
      ),
      body: pages[selectedPage],
    );
  }
}