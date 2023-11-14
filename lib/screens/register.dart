// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, non_constant_identifier_names

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lazapay_v2/firebase_options.dart';
import 'package:lazapay_v2/screens/get_started.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';


class register_page extends StatefulWidget {
  const register_page({super.key});

  @override
  State<register_page> createState() => _register_pageState();
}

class _register_pageState extends State<register_page> {

  late final TextEditingController email_controller ;

  late final TextEditingController password_controller ;

  

  @override
  void initState() {
    email_controller =  TextEditingController();
    password_controller =  TextEditingController();
    super.initState();
  }

  @override
  void dispose() {

    email_controller.dispose();
    password_controller.dispose(); //to dispose text after it is no longer required. 

    super.dispose();
  }

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
      body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
            ),
          builder: (context, snapshot){
            switch(snapshot.connectionState){
              case  ConnectionState.done:
              return Column(
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
                controller: email_controller,
                decoration: InputDecoration(
              labelText: 'Email', // Add your label here
              hintText: 'dartlord@gmail.com', hintStyle: TextStyle(color: Colors.grey.shade400)
                    ),
              ),
            ),
        
            
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
        
              child: TextField(
                controller: password_controller,
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
                child: TextButton(onPressed: ()async{
                           final email = email_controller.text;
                           final password = password_controller.text;
                        
                            await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
                            print (UserCredential);
                            
                        }, child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 15),))
              ),
            ),
          ],
        );
        default:
        return const Text('Loading'); //This handles every other scenario apart from the above. If the future is not ready yet, the user will see the loading screen. If the screen has finished rendering, the user will see the column and text fields.         
              
            }
          },
      )
      );
  }
}