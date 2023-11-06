// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:lazapay_v2/screens/get_started.dart';


class register_page extends StatelessWidget {
  const register_page({super.key});

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
            child: Text("Sign Up",
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 25, fontWeight: FontWeight.w700),),
          ),
        
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text("Please enter your details to continue",textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black26, fontSize: 15,),
            ),
          ),

          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: TextField(
              decoration: InputDecoration(
            labelText: 'Email', // Add your label here
            hintText: 'dartlord@gmail.com', hintStyle: TextStyle(color: Colors.grey.shade400)
                  ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: TextField(
              decoration: InputDecoration(
            labelText: 'Username', // Add your label here
            hintText: 'Kolade Modupe', hintStyle: TextStyle(color: Colors.grey.shade400)
                  ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),

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
            height: 50, // Adjust the height as needed
            color: Colors.blueAccent, // Blue accent color
            child: Center(
              child: TextButton(onPressed: (){
                        Navigator.push( context, MaterialPageRoute(builder: (context) => register_page(),));
                      }, child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 15),))
            ),
          ),
        ],
      )
      );
  }
}