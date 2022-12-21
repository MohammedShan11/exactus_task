import 'dart:convert';

import 'package:exactus_task/common/color.dart';
import 'package:exactus_task/common/sizedbox.dart';
import 'package:exactus_task/common/textstyles.dart';
import 'package:exactus_task/connect/url.dart';
import 'package:exactus_task/screens/homepage.dart';
import 'package:exactus_task/validation/validators.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class EditPage extends StatefulWidget {
  var id;
  var name;
  var address;
  var email;
  var country;
  var phonenumber;
  var index;
  EditPage(
      {super.key,
      this.id,
      this.name,
      this.address,
      this.country,
      this.email,
      this.phonenumber,
      this.index});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  var countryController = TextEditingController();
  var numberController = TextEditingController();

  Future<void> EditData() async {
    var data = {
      "employee_id": widget.id,
      "name": nameController.text,
      "address": addressController.text,
      "email": emailController.text,
      "country": countryController.text,
      "phone": numberController.text,
    };
    var response = await post(Uri.parse('${url}update.php'), body: data);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)['result'];
      print(result);
      if (result == "success") {
        setState(() {});
        snackbar('Updated Successful', Colors.green);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        snackbar("Couldn't Update", Colors.red);
      }
    }
  }

  @override
  void initState() {
    if (widget.index != null) {
      nameController.text = widget.name;
      addressController.text = widget.address;
      emailController.text = widget.email;
      countryController.text = widget.country;
      numberController.text = widget.phonenumber;
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit",
            style: acme,
          ),
        ),
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
                Form(
                  key: formkey,
                  child: Column(children: [
                    sbh80,
                    Text(
                      "Edit Details",
                      style:
                          TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
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
                            if (formkey.currentState!.validate()) {
                              print(nameController.text);
                              print(addressController.text);
                              print(emailController.text);
                              print(countryController.text);
                              print(numberController.text);
                              setState(() {
                                EditData();
                              });
                            }
                          },
                          child: const Center(
                            child: Text(
                              "Update",
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
