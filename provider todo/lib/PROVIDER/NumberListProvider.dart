import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class NumberListProvider extends ChangeNotifier{
  List <dynamic>ls=[];

  void addList(task){
    ls.add(task);
    notifyListeners();
  }
}