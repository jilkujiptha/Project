import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/PROVIDER/NumberListProvider.dart';

class ToDO3 extends StatefulWidget {
  const ToDO3({super.key});

  @override
  State<ToDO3> createState() => _ToDO3State();
}

class _ToDO3State extends State<ToDO3> {
  int? index;
  TextEditingController add=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(builder: (context,TodoListModel,child)=>Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
      backgroundColor: Colors.grey[800],
        title: Center(child: Text("EDITPAGE")),),
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
              onTap: () {
                add.text=TodoListModel.ls[index!];
              },
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
              TodoListModel.ls[index!]=add.text;
              Navigator.pushNamedAndRemoveUntil(context, "fistpage", (Route)=>false);
            }, child: Text("EDIT",style: TextStyle(color: Colors.white),)),
          )
        ],
      ),
    ));
  }
}