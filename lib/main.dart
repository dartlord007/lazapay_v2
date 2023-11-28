// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lazapay_v2/constants/routes.dart';
import 'package:lazapay_v2/screens/dashboard.dart';
import 'package:lazapay_v2/screens/get_started.dart';
import 'package:lazapay_v2/screens/login.dart';
import 'package:lazapay_v2/screens/register.dart';

void main() async { //shows that the function does not return anything. 
  WidgetsFlutterBinding.ensureInitialized(); 
  
  runApp (const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: dashboard_screen(),
      routes: {
        registerRoute: (context) => const register_page(),
        mainRoute: (context) => const dashboard_screen(),
        loginRoute: (context) => const login_page(),
      },
    );
  }
}
