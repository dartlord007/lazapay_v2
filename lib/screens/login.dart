// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, non_constant_identifier_names, avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lazapay_v2/constants/routes.dart';
import 'package:lazapay_v2/screens/dashboard.dart';
import 'package:lazapay_v2/screens/get_started.dart';


class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {


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
      body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Welcome",
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 25, fontWeight: FontWeight.w700),),
              ),
            
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text("Please enter your details to continue",textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black26, fontSize: 15,),
                ),
              ),
          
              SizedBox(height: 50,),
          
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  controller: email_controller,
                  decoration: InputDecoration(
              labelText: 'Email', // Add your label here
              hintText: 'dartlord@gmail.com', hintStyle: TextStyle(color: Colors.grey.shade400)
                    ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(25.0),
          
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

                            try{
                             final email = email_controller.text;
                             final password = password_controller.text;    
                            
                             await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                             
                             Navigator.pushNamedAndRemoveUntil(context, mainRoute, (route) => false);

                              }
                            on FirebaseAuthException catch(e){
                               switch (e.code) {
                                 case "user-not-found":{ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: const Text('User Not Found'),
                                     action: SnackBarAction(
                                     label: '', onPressed: () {},)));}
                                 case "invalid-email":{ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: const Text('Invalid e-mail'),
                                     action: SnackBarAction(
                                     label: '', onPressed: () {},)));}
                                 case "INVALID_LOGIN_CREDENTIALS":{ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: const Text('Invalid login Credentials'),
                                     action: SnackBarAction(
                                     label: '', onPressed: () {},)));}
                                 default: print(e.code);
                               }
                                
                                }
                                
                            }, child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 15),))
                ),
              ),
            ],
          )
    );
  }
}