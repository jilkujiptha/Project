import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/PROVIDER/NumberListProvider.dart';

class ToDo1 extends StatefulWidget {
  const ToDo1({super.key});

  @override
  State<ToDo1> createState() => _ToDo1State();
}

class _ToDo1State extends State<ToDo1> {
  int? index;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
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
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                bottom: 10, top: 10, left: 20, right: 20),
                padding: EdgeInsets.only(left: 20,top: 10,right: 10),
                width: MediaQuery.of(context).size.width * .6,
                height: 50,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[900],
                boxShadow: [
                  BoxShadow(blurRadius: 5, color: const Color.fromARGB(0, 158, 158, 158))
                 ]),
                child: Text("${TodoListModel.ls[index]}",
                style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
               Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            color: Colors.grey[900]
            ),
            child: TextButton(onPressed: (){
              Navigator.pushNamed(context, "thirdpage",arguments: index.toString());
            }, child: Icon(Icons.edit,
            size: 20,
            color: Colors.white,
            )),
          ),
          SizedBox(width: 10,),
           Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            color: Colors.grey[900]
            ),
            child: TextButton(onPressed: (){
              setState(() {
                TodoListModel.ls.removeAt(index);
              });
            }, child: Icon(Icons.delete,
            size: 20,
            color: Colors.white,
            )),
          ),
            ],
          );
        }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[900],
          onPressed: (){
          Navigator.pushNamed(context, "secondpage");
        },
        child: Icon(Icons.add,
        color: Colors.white,
        ),
        ),
    ));
  }
}