import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController add = TextEditingController();
  final CollectionReference Todos=FirebaseFirestore.instance.collection("Todos");

  void updateTask(id){
    Todos.doc(id).update({"task":add.text});
  }
  @override
  Widget build(BuildContext context) {
    List ls = ModalRoute.of(context)?.settings.arguments as List;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    padding: EdgeInsets.only(left: 40),
                    width: MediaQuery.of(context).size.width * .7,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 96, 177, 99)),
                    ),
                    child: TextField(
                      controller: add,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "${ls[0]}"),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 70,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 96, 177, 99),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 40,
                        )),
                  ),
                ],
              ),
            ),
            Text(ls[0]),
          ],
        ));
  }
}
