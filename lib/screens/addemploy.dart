import 'package:exactus_task/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../common/sizedbox.dart';
import '../common/url.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: formkey,
                child: Column(children: [
                  Text(
                    "Add Employee",
                    style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
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
                            onAdd();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
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
    );
  }
}
