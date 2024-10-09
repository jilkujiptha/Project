import 'package:api/cartPage.dart';
import 'package:api/firstPage.dart';
import 'package:api/secondPage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  var flip=await Hive.openBox("mybox");
  runApp(MaterialApp(home: MainPage(),
  routes: {
    "first":(context)=>MainPage(),
    "second":(context)=>TouchPage(),
    "third":(context)=>CartPage()
  },
  ));
}
