import 'package:flutter/material.dart';
import 'package:lazapay_v2/screens/onboard_screen.dart';

void main() async { //shows that the function does not return anything. 
  WidgetsFlutterBinding.ensureInitialized(); 
  
  runApp (const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: onboard_screen(),
    );
  }
}