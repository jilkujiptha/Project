import 'package:cofeeshop/coffee/CartPage.dart';
import 'package:cofeeshop/coffee/HomePage.dart';
import 'package:cofeeshop/coffee/ShopPage.dart';
import 'package:cofeeshop/coffee/firstPage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main()async{
  await Hive.initFlutter();
  var coffee=await Hive.openBox("mybox");
  runApp(MaterialApp(home: MainPage(),
  routes: {
    "main":(context)=>MainPage(),
    "cart":(context)=>CartPage(),
    "shop":(context)=>ShoPage(),
    "home":(context)=>HomePage()
  },
  ));
}