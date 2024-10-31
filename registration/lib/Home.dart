import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController add=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color:  const Color.fromARGB(255, 96, 177, 99)),
        backgroundColor: Colors.white,
        title: Center(child: Text("HOMEPAGE",style: TextStyle(color: const Color.fromARGB(255, 96, 177, 99)),)),
      ),
      drawer: Drawer(),
      body: 
          Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      padding: EdgeInsets.only(left: 40),
                      width: MediaQuery.of(context).size.width*.7,
                      height: 60,
                      decoration: BoxDecoration(
                       border: Border.all(color: const Color.fromARGB(255, 96, 177, 99)) ,
                      ),
                      child: TextField(
                        controller: add,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: 70,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 96, 177, 99),
                       ),
                       child: IconButton(onPressed: (){}, 
                       icon: Icon(Icons.add,
                       color: Colors.white,
                       size: 40,
                    )
                  ),
                ),
                  ],
                ),
              ),
              SizedBox(height: 50,),
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.only(bottom: 30,left: 30,right: 30),
                    padding: EdgeInsets.only(left: 30,right: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.grey
                        )
                      ]
                    ), 
                    child: Row(
                      children: [
                        Text("data"),
                        Spacer(),
                        Icon(Icons.delete,
                        color: const Color.fromARGB(255, 96, 177, 99),
                        ),
                        SizedBox(width: 15,),
                        Icon(Icons.edit,
                        color: const Color.fromARGB(255, 96, 177, 99),
                        )
                      ],
                    ),
                  );
              },
            ),
          )
        ],
      ),
    );
  }
}