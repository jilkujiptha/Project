import 'package:flutter/material.dart';

class ShoPage extends StatefulWidget {
  const ShoPage({super.key});

  @override
  State<ShoPage> createState() => _ShoPageState();
}

class _ShoPageState extends State<ShoPage> {
  // List ls=[
  //   {

  //   }
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Center(
          child: Text(
            "MOKA",
            style: TextStyle(
                fontFamily: "edu",
                color: const Color.fromARGB(255, 255, 170, 59),fontSize: 30),
          ),
        ),
      ),
      body:
           Column(
             children: [
              Text("Its a Great Day for Coffee",style: TextStyle(color: Colors.white,fontSize: 25),),
               Expanded(
                 child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 3/4,
                    crossAxisCount: 2
                    ),
                    padding: EdgeInsets.all(10), 
                  itemBuilder: (context,index){
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:  const Color.fromARGB(255, 245, 240, 240)
                      ),
                    );
                 }),
               ),
             ],
           ),
    );
  }
}
