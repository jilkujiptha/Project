import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController add = TextEditingController();
  final CollectionReference Todos =
      FirebaseFirestore.instance.collection("Todos");
  void addTodo() {
    final data = {"task": add.text};
    Todos.add(data);
    add.clear();
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: const Color.fromARGB(255, 96, 177, 99)),
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          "HOMEPAGE",
          style: TextStyle(color: const Color.fromARGB(255, 96, 177, 99)),
        )),
        actions: [
          IconButton(
              onPressed: logout,
              icon: Icon(
                Icons.logout_outlined,
                size: 25,
              ))
        ],
      ),
      drawer: Drawer(),
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
                      border: InputBorder.none,
                    ),
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
                      onPressed: addTodo,
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 40,
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: StreamBuilder(
                stream: Todos.orderBy("task").snapshots(),
                builder: (context, snapshot) {
                  // print(snapshot.data!.docs.length);
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot todoSnapshot =
                            snapshot.data!.docs[index];
                        return ListTile(
                          onLongPress: () async {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Do you want to delete",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 96, 177, 99)),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 96, 177, 99)),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            Todos.doc(todoSnapshot.id).delete();
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Delete",
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 96, 177, 99)),
                                          ))
                                    ],
                                  );
                                });
                          },
                          title: Text(todoSnapshot["task"].toString()),
                          trailing: IconButton(
                            onPressed: () {
                              List<dynamic> ls = [
                                todoSnapshot["task"],
                                todoSnapshot.id
                              ];
                              Navigator.pushNamed(context, "update",
                                  arguments: ls);
                            },
                            icon: Icon(
                              Icons.edit,
                              color: const Color.fromARGB(255, 96, 177, 99),
                            ),
                          ),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}
