import 'package:bloodonation/BloodDonation/FirstPage.dart';
import 'package:bloodonation/BloodDonation/secondPage.dart';
import 'package:bloodonation/BloodDonation/thirdPage.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: FirstPage(),routes: {
      "/firstPage":(context)=>FirstPage(),
      "/secondPage":(context)=>SecondPage(),
      "/thirdPage":(context)=>ThirdPage()
    },
  ));
}

