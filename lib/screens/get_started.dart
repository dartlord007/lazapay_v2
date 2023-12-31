// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lazapay_v2/firebase_options.dart';
import 'package:lazapay_v2/screens/login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lazapay_v2/screens/register.dart';


class get_started extends StatelessWidget {
  const get_started({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Text("Let's Get Started",
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 30, fontWeight: FontWeight.w700),),
              ),
          
              SizedBox(
                height: 100,
              ),
          
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,0),
                child: FilledButton( 
                  onPressed: (){},
                  style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(500,70)),
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue.shade800), 
                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)))
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook, color: Colors.white,size: 25),
                        SizedBox(width: 10,),
                        Text(
                          'Facebook',
                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  ),
              ),
              
              Padding(
                padding: EdgeInsets.fromLTRB(20,10,20,0),
                child: FilledButton( 
                  onPressed: (){},
                  style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(500,70)),
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue), 
                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)))
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.twitter, color: Colors.white,size: 25),
                        SizedBox(width: 10,),
                        Text(
                          'Twitter',
                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  ),
              ),
              
              Padding(
                padding: const EdgeInsets.fromLTRB(20,10,20,0),
                child: FilledButton( 
                  onPressed: (){},
                  style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(500,70)),
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.red), 
                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)))
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.google, color: Colors.white,size: 20),
                        SizedBox(width: 10,),
                        Text(
                          'Google',
                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  ),
              ),
          
              SizedBox(
                height: 130,
              ),
          
          
                Text("Already have an account?"),
                TextButton(onPressed: (){Navigator.push( context, MaterialPageRoute(builder: (context) => login_page(),));}, child: Text("Sign in", style: TextStyle(color: Colors.black),)),
          
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
                          }, child: Text("Create an account", style: TextStyle(color: Colors.white, fontSize: 15),))
                ),
              ),
            ],
          );
        }
      )
      );
  }
}