import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/PROVIDER/NumberListProvider.dart';

class ToDo1 extends StatefulWidget {
  const ToDo1({super.key});

  @override
  State<ToDo1> createState() => _ToDo1State();
}

class _ToDo1State extends State<ToDo1> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(builder: (context,TodoListModel,child)=> Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Center(child: Text("TASKS")),),
      body: ListView.builder(
        itemCount: TodoListModel.ls.length,
        itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[900]
            ),
          );

      }),
    ));
  }
}