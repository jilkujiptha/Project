import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/PROVIDER/NumberListProvider.dart';

class ToDo2 extends StatefulWidget {
  const ToDo2({super.key});

  @override
  State<ToDo2> createState() => __ToDo2State();
}

class __ToDo2State extends State<ToDo2> {
  TextEditingController add=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(builder: (context,TodoListModel,child)=>Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
      backgroundColor: Colors.grey[800],
        title: Center(child: Text("ADD TASKS")),),
      body: Row(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10,left: 20),
            margin: EdgeInsets.only(left: 20,right: 20),
            width: 350,
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            color: Colors.grey[900]
            ),
            child: TextField(
              controller: add,
              decoration: InputDecoration(
                border: InputBorder.none
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            width: 80,
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            color: Colors.grey[900]
            ),
            child: TextButton(onPressed: (){
              var task=add.text;
              TodoListModel.addList(task);
              Navigator.pushNamedAndRemoveUntil(context, "fistpage", (route)=>false);
            }, child: Text("ADD",style: TextStyle(color: Colors.white),)),
          )
        ],
      ),

    ));
  }
}