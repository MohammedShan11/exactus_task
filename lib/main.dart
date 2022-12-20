import 'package:exactus_task/screens/auth/loginpage.dart';
import 'package:exactus_task/screens/homepage.dart';
import 'package:exactus_task/screens/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      //LoginPage(),
      //HomePage(),
    );
  }
}
