// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, non_constant_identifier_names, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lazapay_v2/screens/get_started.dart';
import 'package:firebase_auth/firebase_auth.dart';


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
                        
                        try { await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);}

                       on FirebaseAuthException catch(e){
                        switch (e.code) {
                          case "weak-password": {ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: const Text('Weak Password, should be at least 6 characters'),
                                     action: SnackBarAction(
                                     label: '', onPressed: () {},)));}
                          case "email-already-in-use": {ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: const Text('Someone is alfeady using that e-mail'),
                                     action: SnackBarAction(
                                     label: '', onPressed: () {},)));}
                          case "invalid-email":{ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: const Text('Invalid e-mail'),
                                     action: SnackBarAction(
                                     label: '', onPressed: () {},)));}

                            
                            break;
                          default: {print(e.runtimeType);}
                        }
                       }
                            
                        }, child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 15),))
              ),
            ),
          ],
        ));
            }
}