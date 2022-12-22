import 'dart:convert';

import 'package:exactus_task/common/color.dart';
import 'package:exactus_task/common/textstyles.dart';
import 'package:exactus_task/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../common/sizedbox.dart';
import '../connect/url.dart';
import '../validation/validators.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  var countryController = TextEditingController();
  var numberController = TextEditingController();

  Future<void> onAdd() async {
    var data = {
      "name": nameController.text,
      "address": addressController.text,
      "email": emailController.text,
      "country": countryController.text,
      "phone": numberController.text,
    };
    var response = await post(Uri.parse('${url}employee.php'), body: data);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)['result'];
      print(result);
      if (result == "success") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        snackbar("Added Successfully", Colors.green);
      } else {
        snackbar("Couldn't Add", Colors.red);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: appbar,
            title: Text(
              "Add",
              style: acme,
            )),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: lightlinear,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                sbh60,
                Form(
                  key: formkey,
                  child: Column(children: [
                    Text(
                      "Add Employee",
                      style: heading,
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
                              borderSide: BorderSide(color: Colors.deepPurple),
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
                              borderSide: BorderSide(color: Colors.deepPurple),
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
                              borderSide: BorderSide(color: Colors.deepPurple),
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
                              borderSide: BorderSide(color: Colors.deepPurple),
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
                        keyboardType: TextInputType.number,
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
                          gradient: cyanlinear,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: InkWell(
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              onAdd();
                            }
                          },
                          child: const Center(
                            child: Text(
                              "Add",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              ],
            ),
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
