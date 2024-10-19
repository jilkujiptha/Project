import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/PROVIDER/NumberListProvider.dart';
import 'package:todo/TODO/firstPage.dart';
import 'package:todo/TODO/secondPage.dart';
import 'package:todo/TODO/thirdPage.dart';
void main(){
  runApp(ChangeNotifierProvider(create: (context)=>NumberListProvider(),
  child: MaterialApp(home: ToDo1(),
  routes: {
    "fistpage":(context)=>ToDo1(),
    "secondpage":(context)=>ToDo2(),
    "thirdpage":(context)=>ToDO3()
  },
  ),
  )
  );
}