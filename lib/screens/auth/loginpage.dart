import 'dart:convert';

import 'package:exactus_task/common/color.dart';
import 'package:exactus_task/common/sizedbox.dart';
import 'package:exactus_task/common/textstyles.dart';
import 'package:exactus_task/screens/auth/registration.dart';
import 'package:exactus_task/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../common/url.dart';
import '../../validation/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var loginKey = GlobalKey<FormState>();
  var emailController = TextEditingController();

  Future<void> onLogin() async {
    var data = {
      "email": emailController.text,
    };
    var response = await post(Uri.parse('${url}login.php'), body: data);
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)["message"];
      print(result);
      if (result == "user successfully logged in") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        snackbar("Login Successful", Colors.green);
      } else {
        snackbar("Login Failed", Colors.red);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: grey300,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "LOGIN",
              style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
            ),
            sbh80,
            Form(
                key: loginKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          return Validate.emailValidator(value!);
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.email),
                            hintText: "Email",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            fillColor: Colors.grey[200],
                            filled: true),
                      ),
                    ),
                    sbh10,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: InkWell(
                          onTap: () {
                            if (loginKey.currentState!.validate()) {
                              onLogin();
                            }
                          },
                          child: Center(
                            child: Text(
                              "Sign In",
                              style: signin,
                            ),
                          ),
                        ),
                      ),
                    ),
                    sbh10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an Account?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                          },
                          child: Text(" Sign Up",
                              style: TextStyle(color: Colors.blueAccent)),
                        )
                      ],
                    )
                  ],
                ))
          ]),
        ),
      ),
    );
  }

  void snackbar(String msg, var color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: color,
    ));
  }
}
