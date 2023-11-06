// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import "package:lazapay_v2/screens/get_started.dart";


class onboard_screen extends StatefulWidget {
  const onboard_screen({super.key});

  @override
  State<onboard_screen> createState() => _onboard_screenState();
}

class _onboard_screenState extends State<onboard_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            decoration: BoxDecoration(
                  color:Colors.white24,
                  image:  DecorationImage(
                    image: AssetImage('images/img1.png'),
                  ),
                ),
          ),

          Positioned(
            
            top: 610,
            bottom: 40,
            child: Container(
            ////
            height: 100,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),

                child: Padding(
                  padding: const EdgeInsets.fromLTRB(3,20,3,0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(7),
                        child: Text('Look Good, Feel Good', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Create your individual & unique style and look amazing everyday', style: TextStyle(color: Colors.grey),textAlign: TextAlign.center),
                      ),
                      Padding(padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0,0,7,0),
                            child: FilledButton(onPressed: (){}, style: ButtonStyle(
                              fixedSize: MaterialStatePropertyAll(Size(170,65)),
                              backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(66, 207, 216, 220)), shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)))), child: Text("Men",style: TextStyle(color: Colors.grey)),),
                          ),

                          Padding(
                            padding: EdgeInsets.fromLTRB(7,0,0,0),
                            child: FilledButton(onPressed: (){}, 
                            style: ButtonStyle(
                              fixedSize: MaterialStatePropertyAll(Size(170,65)),
                              backgroundColor: MaterialStatePropertyAll<Color>(Colors.blueAccent.shade200), 
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)))
                              ), 
                            child: Text("Women"),),
                          ),
                        ],
                      ),
                      ),
                      
                      TextButton(onPressed: (){
                        Navigator.push( context, MaterialPageRoute(builder: (context) => get_started(),));
                      }, child: Text("skip", style: TextStyle(color: Colors.grey, fontSize: 18),))
                
                    ],
                  ),
                ),
          )
          )
        ],
      )
      );
  }
}
