// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:lazapay_v2/screens/get_started.dart';


class login_page extends StatelessWidget {
  const login_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading:
    IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
      onPressed: () {Navigator.push( context, MaterialPageRoute(builder: (context) => get_started(),));}
    )
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Welcome",
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 30, fontWeight: FontWeight.w700),),
          ),
        
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text("Please enter your details to continue",textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black26, fontSize: 20,),
            ),
          ),

          SizedBox(height: 100,),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              decoration: InputDecoration(
            labelText: 'Username', // Add your label here
            hintText: 'Kolade Modupe', hintStyle: TextStyle(color: Colors.grey.shade400)
                  ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(25.0),

            child: TextField(
              decoration: InputDecoration(
            labelText: 'Password', // Add your label here
            hintText: 'paswordisgreat', hintStyle: TextStyle(color: Colors.grey.shade400),
                  ),
            ),
          ),
          // Empty space above the blue container
          Expanded(
            child: Container(
              color: Colors.white, // You can change the background color here
            ),
          ),
          // Blue accent bottom container
          Container(
            height: 100, // Adjust the height as needed
            color: Colors.blueAccent, // Blue accent color
            child: Center(
              child: TextButton(onPressed: (){
                        Navigator.push( context, MaterialPageRoute(builder: (context) => login_page(),));
                      }, child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 25),))
            ),
          ),
        ],
      )
      );
  }
}