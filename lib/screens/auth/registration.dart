import 'package:exactus_task/common/color.dart';
import 'package:exactus_task/common/sizedbox.dart';
import 'package:exactus_task/screens/auth/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../common/url.dart';
import '../../validation/validators.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final registerKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  var countryController = TextEditingController();
  var numberController = TextEditingController();

  Future<void> onRegister() async {
    var data = {
      "name": nameController.text,
      "address": addressController.text,
      "email": emailController.text,
      "country": countryController.text,
      "phone": numberController.text,
    };
    var response = await post(Uri.parse('${url}register.php'), body: data);
    print(response.body);
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: grey300,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Form(
                  key: registerKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "REGISTER",
                          style: TextStyle(
                              fontSize: 52, fontWeight: FontWeight.bold),
                        ),
                        sbh40,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              return Validate.nameValidator(value!);
                            },
                            controller: nameController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                ),
                                hintText: "Name",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.deepPurple),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                fillColor: Colors.grey[200],
                                filled: true),
                          ),
                        ),
                        sbh10,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            maxLines: 2,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              return Validate.addressValidator(value!);
                            },
                            controller: addressController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.feed,
                                ),
                                hintText: "Address",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.deepPurple),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                fillColor: Colors.grey[200],
                                filled: true),
                          ),
                        ),
                        sbh10,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              return Validate.emailValidator(value!);
                            },
                            controller: emailController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                ),
                                hintText: "Email",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.deepPurple),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                fillColor: Colors.grey[200],
                                filled: true),
                          ),
                        ),
                        sbh10,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              return Validate.countryValidator(value!);
                            },
                            controller: countryController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.place,
                                ),
                                hintText: "Country",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.deepPurple),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                fillColor: Colors.grey[200],
                                filled: true),
                          ),
                        ),
                        sbh10,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              return Validate.numberValidator(value!);
                            },
                            controller: numberController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.call,
                                ),
                                hintText: "PhoneNumber",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.deepPurple),
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
                                if (registerKey.currentState!.validate()) {
                                  onRegister();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                  snackbar(Text("Registration Successful"),
                                      Colors.green);
                                } else {
                                  snackbar(
                                      Text("Registration Failed"), Colors.red);
                                }
                              },
                              child: const Center(
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        sbh10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already Have an Account ?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                },
                                child: const Text(
                                  " Sign In",
                                  style: TextStyle(color: Colors.blueAccent),
                                ))
                          ],
                        )
                      ],
                    ),
                  ))
            ]),
          ),
        ),
      ),
    );
  }

  snackbar(var msg, var color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: color,
    ));
  }
}
