import 'package:flutter/material.dart';
import '../logic/HomePage_logic.dart';

class HomePage extends StatelessWidget with HomePage_Logic {
  Color gradient_top = Color(0xFF2E2F36);
  Color gradient_bot = Color(0xE02E2F36);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xFF2E2F36),
      body: Container(
        height: 1000,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF2C2D31),
              spreadRadius: 15,
              offset: Offset(0, 7),
              // changes position of shadow
            ),
          ],
        ),
      /*   child:const CircleAvatar(
                backgroundImage: NetworkImage('',
                child: Icon(Icons.add)),
                radius: 1.0
              
            ), */
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [

            Text("Maintenance",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,)),
            Text("New Suggestion",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            Text("Complaint",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            Text("Notice",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            Text("Voting",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            Text("Services",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            Text("Setting",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            Text("Help",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            Text("Feedback",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            Text('logout',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            Text('Theme',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          ],),

          ),

      );
}
}

