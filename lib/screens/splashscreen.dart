import 'dart:async';

import 'package:exactus_task/common/color.dart';
import 'package:exactus_task/screens/auth/loginpage.dart';
import 'package:exactus_task/screens/homepage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: lightlinear,
        ),
        child: Center(
          child: Image.asset('assets/image/logo.png'),
        ),
      ),
    );
  }
}
